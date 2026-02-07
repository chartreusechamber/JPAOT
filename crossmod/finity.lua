
local function is_plain_card(card)
    if not card or not card.config then return false end
    local has_enhancement = (card.config.center ~= G.P_CENTERS.c_base)
    local has_seal = (card.seal ~= nil)
    local has_edition = (card.edition ~= nil)
    return not (has_enhancement or has_seal or has_edition)
end

-- sort 
local function sort_round(a, b)
    local val_a = is_plain_card(a) and 1 or 2
    local val_b = is_plain_card(b) and 1 or 2
    
    if val_a ~= val_b then
        return val_a < val_b
    end
    return false
end


local function sort_pack(a, b)
 
    local val_a = is_plain_card(a) and 2 or 1
    local val_b = is_plain_card(b) and 2 or 1
    
    if val_a ~= val_b then
        return val_a < val_b
    end
    return false
end

local ref_shuffle = CardArea.shuffle
function CardArea:shuffle(seed, seed_mod)
    ref_shuffle(self, seed, seed_mod)

    if next(SMODS.find_card("j_jpaot_emmy")) and self == G.deck then
        -- Round Mode: Plain at bottom, Modified at top
        table.sort(self.cards, sort_round)
        self:align_cards()
    end
end

local ref_open = Card.open
function Card:open() 
    ref_open(self)

    if next(SMODS.find_card("j_jpaot_emmy")) and self.ability.set == 'Booster' then
        
        local name = (self.ability.name or ""):lower()
        local is_standard = name:find("standard") or name:find("buffoon")
        
        if not is_standard then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 1.3,
                func = function()
                    -- Sort HAND (Pack Mode)
                    if G.hand and #G.hand.cards > 0 then
                        table.sort(G.hand.cards, sort_pack)
                        G.hand:align_cards()
                    end

                    -- Sort DECK (Pack Mode)
                    if G.deck and #G.deck.cards > 0 then
                        table.sort(G.deck.cards, sort_pack)
                        G.deck:align_cards()
                    end
                    
                    return true
                end
            }))
        end
    end
end


-- I have no idea how other mods did this, so I am just copying from Neonflame. 
local smaps = {}
local quips = {}
local decks = {}


SMODS.Joker {
    key = "jpenguin",
    name = "Jade Penguin",

    atlas = "jokers",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    discovered = true, 
    config = { extra = { chance = 3, xm = 1 } },
    rarity = "finity_showdown",
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
		local num, den = SMODS.get_probability_vars(card, 1, card.ability.extra.chance, "jpaot_jpenguin")
        return { vars = {num, den, card.ability.extra.xm} }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for k, v in ipairs(context.full_hand) do
                if not SMODS.in_scoring(v, context.scoring_hand) 
                    and SMODS.pseudorandom_probability(card, "jpaot_jpenguin", 1, card.ability.extra.chance) then

                    v.ability.nflame_youreated = true
                end
            end
        end

        if context.destroy_card and context.destroy_card.ability.nflame_youreated and not context.blueprint then
            local xmvalue = context.destroy_card:get_id()
            if SMODS.has_no_rank(context.destroy_card) then xmvalue = 5 end
            xmvalue = xmvalue / 10

            card.ability.extra.xm = card.ability.extra.xm + xmvalue

            local msgs = localize("k_upgrade_eat")
            return { sound = "jpaot_jp_consume", message = pseudorandom_element(msgs), remove = true }
        end

        if context.joker_main or context.force_trigger then return { xmult = card.ability.extra.xm } end
    end,
    set_badges = function (self, card, badges)
        SMODS.create_mod_badges({ mod = SMODS.find_mod("finity")[1] }, badges)
    end,
}


SMODS.Joker {
    key = "mole",
    name = "Maroon Mole",

    atlas = "jokers",
    pos = { x = 2, y = 0 },
    soul_pos = { x = 3, y = 0 },
    discovered = true, 
    config = { extra = { scaling = 0.1, xm = 1 } },
    rarity = "finity_showdown",
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
		local num, den = SMODS.get_probability_vars(card, 1, card.ability.extra.chance, "jpaot_jpenguin")
        return { vars = {card.ability.extra.scaling, card.ability.extra.xm} }
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
			SMODS.scale_card(card, {
				ref_table = card.ability.extra,
				ref_value = "xm",
				scalar_value = "scaling",
                message_key = "a_xmult",
				message_colour = G.C.MULT,
			})
			return nil, true
        end

        if context.joker_main then
            return { xmult = card.ability.extra.xm}
        end
    end,
    set_badges = function (self, card, badges)
        SMODS.create_mod_badges({ mod = SMODS.find_mod("finity")[1] }, badges)
    end,
}

SMODS.Joker {
    key = "beaver",
    name = "Brass Beaver",

    atlas = "jokers",
    pos = { x = 4, y = 0 },
    soul_pos = { x = 5, y = 0 },
    discovered = true, 
    config = { extra = { chance = 3, xm = 1 } },
    rarity = "finity_showdown",
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        -- 1. Find the ID with the highest play count
        local target_id = 14 -- Default to Ace
        local highest_count = -1

       
        if G.GAME.most_played_ranks then
            for id, count in pairs(G.GAME.most_played_ranks) do
                if count > highest_count then
                    highest_count = count
                    target_id = id
                elseif count == highest_count then
                    -- Tie-breaker: prefer the higher rank
                    if id > target_id then target_id = id end
                end
            end
        end

 
        local target_rank_name = 'Ace'
        
      
        for key, rank_obj in pairs(SMODS.Ranks) do
            if rank_obj.id == target_id then
                target_rank_name = key
                break
            end
        end

       
        self.beaver_target_id = target_id

       
        return { vars = { localize(target_rank_name, 'ranks') } }
    end,

   calculate = function(self, card, context)
       
        if context.repetition and context.cardarea == G.play then
            
          
            local target_id = 14
            local highest_count = -1
            if G.GAME.most_played_ranks then
                for id, count in pairs(G.GAME.most_played_ranks) do
                    if count > highest_count then
                        highest_count = count
                        target_id = id
                    elseif count == highest_count then
                        if id > target_id then target_id = id end
                    end
                end
            end

          
            if context.other_card:get_id() == target_id then
                
              
                local match_count = 0
                if context.scoring_hand then
                    for _, playing_card in ipairs(context.scoring_hand) do
                        if playing_card:get_id() == target_id then
                            match_count = match_count + 1
                        end
                    end
                end

               
                if match_count > 0 then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = match_count,
                        card = card
                    }
                end
            end
        end
    end,
    set_badges = function (self, card, badges)
        SMODS.create_mod_badges({ mod = SMODS.find_mod("finity")[1] }, badges)
    end,
}

SMODS.Joker {
    key = "frog",
    name = "Fandango Frog",

    atlas = "jokers",
    pos = { x = 6, y = 0 },
    soul_pos = { x = 7, y = 0 },
    discovered = true, 
    config = { extra = { drawback = 0.5, handper = 2, handcount = 0 } },
    rarity = "finity_showdown",
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.drawback, card.ability.extra.handper} }
    end,

    calculate = function(self, card, context)

        if context.joker_main and G.GAME.current_round.hands_left > 0 then
                return {
                    xchips = card.ability.extra.drawback,
                    xmult = card.ability.extra.drawback,
                }
            end
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
                 return {
                    xmult = card.ability.extra.handper * card.ability.extra.handcount,
                }
        end

        if context.initial_scoring_step then
            card.ability.extra.handcount = card.ability.extra.handcount + 1
        end

    end,
    set_badges = function (self, card, badges)
        SMODS.create_mod_badges({ mod = SMODS.find_mod("finity")[1] }, badges)
    end,
}

SMODS.Joker {
    key = "polarbear",
    name = "Quartz Polar Bear",

    atlas = "jokers",
    pos = { x = 8, y = 0 },
    soul_pos = { x = 9, y = 0 },
    discovered = true, 
    config = { extra = {xc = 1, chipstoadd = 0,} },
    rarity = "finity_showdown",
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)

        return { vars = {card.ability.extra.xc} }
    end,

    calculate = function(self, card, context)

        
        if context.initial_scoring_step then
            if #context.full_hand == #context.scoring_hand then
                
                local random_card = pseudorandom_element(context.scoring_hand, pseudoseed('jpaot_polarbear'))
                
                local rank_to_add = math.max(0, random_card:get_id())

                if rank_to_add > 0  then
                
                if random_card.debuff then
                    SMODS.calculate_effect({ message = "Bummer...", colour = G.C.RED}, random_card)
                else
                SMODS.calculate_effect({ sound = "jpaot_qpb_strum", message = "Let's Rock!", colour = G.C.PURPLE}, random_card)
                card.ability.extra.chipstoadd = rank_to_add/ 10
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xc",
                    scalar_value = "chipstoadd",
                    message_key = "a_xchips",
                    message_colour = G.C.CHIPS,
                })
                return nil, true

            end
        
             end
        end
    end

        if context.joker_main then
            return {xchips = card.ability.extra.xc}
        end

    end,
    set_badges = function (self, card, badges)
        SMODS.create_mod_badges({ mod = SMODS.find_mod("finity")[1] }, badges)
    end,
}

SMODS.Joker {
    key = "samson",
    name = "Butterscotch Bugbear",

    atlas = "jokers",
    pos = { x = 10, y = 0 },
    soul_pos = { x = 11, y = 0 },
    discovered = true, 
    config = { extra = { chance = 4, permoney = 10 } },
    rarity = "finity_showdown",
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
		local num, den = SMODS.get_probability_vars(card, 1, card.ability.extra.chance, "jpaot_jsamson")
        return { vars = {num, den, card.ability.extra.permoney} }
    end,

    calculate = function(self, card, context)

        if context.cardarea == G.play and context.repetition then
            if SMODS.pseudorandom_probability(card, "jpaot_jpenguin", 1, card.ability.extra.chance) then
                return {   repetitions = math.floor( G.GAME.dollars / card.ability.extra.permoney) }
            end
        end

    end,
    set_badges = function (self, card, badges)
        SMODS.create_mod_badges({ mod = SMODS.find_mod("finity")[1] }, badges)
    end,
}

SMODS.Joker {
    key = "emmy",
    name = "Blueberry Bird",
    atlas = "jokers",
    discovered = true, 
    pos = { x = 12, y = 0 },
    soul_pos = { x = 13, y = 0 },
    config = { extra = { } },
    rarity = "finity_showdown",
    cost = 10,
    blueprint_compat = false, -- Sorting logic is hard to blueprint
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not card.debuff and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.deck:shuffle('emmy_sort')
                    return true
                end
            }))
        end
    end,

    set_badges = function (self, card, badges)
        SMODS.create_mod_badges({ mod = SMODS.find_mod("finity")[1] }, badges)
    end,
}

SMODS.Joker {
    key = "sappy",
    name = "Honey Hedgehog",

    atlas = "jokers",
    pos = { x = 14, y = 0 },
    soul_pos = { x = 15, y = 0 },

    config = { extra = { chance = 3, xm = 1 } },
    rarity = "finity_showdown",
    cost = 10,
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
		local num, den = SMODS.get_probability_vars(card, 1, card.ability.extra.chance, "jpaot_jpenguin")
        return { vars = {num, den, card.ability.extra.xm} }
    end,

    calculate = function(self, card, context)

    end,
    set_badges = function (self, card, badges)
        SMODS.create_mod_badges({ mod = SMODS.find_mod("finity")[1] }, badges)
    end,
}



smaps.bl_jpaot_jpenguin = {"j_jpaot_jpenguin", "Jade Penguin"} -- This is the key and name of the joker that is assosiated with the blind.
quips.bl_jpaot_jpenguin = {"jpenguin", 4, 3} -- This is the key for quips. first and second number are the amount of game over and endless quips respectively.
decks.bl_jpaot_jpenguin = {"jpaot_backs", { x = 0, y = 0 }}

-- Quips are in the localization folder. 

smaps.bl_jpaot_mole = {"j_jpaot_mole", "Maroon Mole"}
quips.bl_jpaot_mole = {"mole", 4, 3}
decks.bl_jpaot_mole = {"jpaot_backs", { x = 1, y = 0 }}


smaps.bl_jpaot_beaver = {"j_jpaot_beaver", "Brass Beaver"}
quips.bl_jpaot_beaver = {"beaver", 4, 4}
decks.bl_jpaot_beaver = {"jpaot_backs", { x = 2, y = 0 }}

smaps.bl_jpaot_frog = {"j_jpaot_frog", "Fandango Frog"}
quips.bl_jpaot_frog = {"frog", 4, 4}
decks.bl_jpaot_frog = {"jpaot_backs", { x = 3, y = 0 }}

smaps.bl_jpaot_polarbear = {"j_jpaot_polarbear", "Quartz Polar Bear"}
quips.bl_jpaot_polarbear = {"bear", 3, 1}
decks.bl_jpaot_polarbear = {"jpaot_backs", { x = 4, y = 0 }}

smaps.bl_jpaot_sappy = {"j_jpaot_sappy", "Honey Hedgehog"}
quips.bl_jpaot_sappy = {"sappy", 3, 6}
decks.bl_jpaot_sappy = {"jpaot_backs", { x = 5, y = 0 }}

smaps.bl_jpaot_samson = {"j_jpaot_samson", "Butterscotch Bugbear"}
quips.bl_jpaot_samson = {"samson", 6, 7}
decks.bl_jpaot_samson = {"jpaot_backs", { x = 0, y = 1 }}

smaps.bl_jpaot_emmy = {"j_jpaot_emmy", "Blueberry Bird"}
quips.bl_jpaot_emmy = {"emmy", 4, 6}
decks.bl_jpaot_emmy = {"jpaot_backs", { x = 1, y = 1 }}




FinisherBossBlindStringMap = FinisherBossBlindStringMap or {}
FinisherBossBlindQuips = FinisherBossBlindQuips or {}
FinisherBossBlinddecksprites = FinisherBossBlinddecksprites or {}

-- im desperate man
local mmref = Game.main_menu
function Game.main_menu(self, change_context)
    for k, v in pairs(smaps) do FinisherBossBlindStringMap[k] = v end
    for k, v in pairs(quips) do FinisherBossBlindQuips[k] = v end
    for k, v in pairs(decks) do FinisherBossBlinddecksprites[k] = v end
    return mmref(self, change_context)
end
