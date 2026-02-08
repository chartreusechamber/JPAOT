

SMODS.Blind {
    key = "jpenguin",
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("74CCA8"),

    atlas = "blinds",
    pos = { x = 0, y = 0 },
    
    debuff_hand = function(self, cards, hand, handname, check)
        if #cards < 1 then return true end
        local _, _, _, scoring_hand, _ = G.FUNCS.get_poker_hand_info(cards)

        for i, card in ipairs(cards) do
            -- At least they don't have to be coded again.
            if not SMODS.in_scoring(card, scoring_hand) and not SMODS.always_scores(card) then return end
        end

        return true
    end
}

SMODS.Blind {
    key = "mole",
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("A61A1F"),

    atlas = "blinds",
    pos = { x = 0, y = 1 },

    calculate = function(self, blind, context)
        -- Mole itself doesn’t need a per-context effect; everything is in globals
    end,

    disable = function(self)
        -- When Mole is disabled, reshuffle the deck normally
        if G and G.deck and G.GAME and G.GAME.round_resets then
            G.deck:shuffle('nr'..G.GAME.round_resets.ante)
        end
    end
}

local original_shuffle = CardArea.shuffle

function CardArea:shuffle(_seed)
    local ret = original_shuffle(self, _seed)

    if self == G.deck and G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_jpaot_mole' and not G.GAME.blind.disabled then
        
        table.sort(self.cards, function(a, b)
            local stats = G.GAME.most_played_stats or {}

            local function get_count(c)
                -- MUST MATCH TRACKER KEY (Suit + ID)
                if c.base and c.base.suit and c.base.id then
                    local key = c.base.suit .. "_" .. c.base.id
                    return stats[key] or 0
                end
                return -1 
            end

            local count_a = get_count(a)
            local count_b = get_count(b)

            -- LOGIC:
            -- count_a > count_b means A has MORE plays than B.
            -- Sorting A before B (True) puts A at Index 1.
            -- Index 1 is the BOTTOM of the deck (Drawn last).
            -- Index 52 is the TOP of the deck (Drawn first).
            return count_a > count_b
        end)
        
        G.GAME.blind:wiggle()
    end

    return ret
end

SMODS.Blind {
    key = "beaver",
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("B88828"),
    atlas = "blinds",
    pos = { x = 0, y = 2 },

   loc_vars = function(self)
        --Find the ID with the highest play count
        local target_id = 11 -- Default to Ace
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

        -- Save target ID for the debuff logic
        self.beaver_target_id = target_id

        -- Return localized name
        return { vars = { localize(target_rank_name, 'ranks') } }
    end,
     collection_loc_vars = function(self)
        return { vars = { '[most played rank]' } }
    end,

    debuff_hand = function(self, cards, hand, handname, check)
      
        local target_id = self.beaver_target_id or 11
        
        if cards then
            local found_target = false
            
           
            for k, v in ipairs(cards) do
                if v:get_id() == target_id then
                    found_target = true
                    break
                end
            end

    
            if found_target then
                return false
            else
                return true
            end
        end
    end,

    disable = function(self)
        self.beaver_target_id = nil
    end
}

SMODS.Blind {
    key = "frog",
    dollars = 8,
    mult = 1.5,
    boss = { showdown = true },
    boss_colour = HEX("71569d"),

    atlas = "blinds",
    pos = { x = 0, y = 3 },

    
    calculate = function(self, blind, context)
    
        if context.final_scoring_step and not blind.disabled then
            
       
            if G.GAME.current_round.hands_left > 0 then
                return {
                    xmult = 0,  
                    xchips = 0,      
                }
            end
            
        end
    end,

}
-- bear
SMODS.Blind{
    key = "polarbear",
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("634d84"),
    atlas = "blinds",
    pos = { x = 0, y = 4 },

    calculate = function(self, blind, context)
     
        if context.final_scoring_step and not blind.disabled then
            
        
            if context.full_hand and context.scoring_hand then
                
                if #context.full_hand > #context.scoring_hand then
                    
                    
                    
                    
                    return {
                        sound = 'jpaot_qpb_divide',
                        message = "Halved!",
                        xmult = 0.5,
                        remove_default_message = true,
                        colour = G.C.RED
                    }
                end
            end
        end
    end,


    disable = function(self)
    end,
}

-- sappy
SMODS.Blind {
    key = "sappy",
    name = "Honey Hedgehog",
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("d8de3e"),
    atlas = "blinds",
    pos = { x = 0, y = 5 },

    
    recalc_debuff = function(self, card, from_blind)
     
        if card.ability.jpaot_sticky then
            return true
        end
        return false
    end,

    
    disable = function(self)
        for _, v in ipairs(G.playing_cards) do
            v.ability.jpaot_sticky = nil
        end
    end
}


local ref_discard_cards_from_highlighted = G.FUNCS.discard_cards_from_highlighted

G.FUNCS.discard_cards_from_highlighted = function(e, hook)
    local hedgehog_joker = SMODS.find_card("j_jpaot_sappy")[1]
    
    if hedgehog_joker then
        local any_reshuffled = false
        
    
        for i, card in ipairs(G.hand.highlighted) do
             
             if SMODS.pseudorandom_probability(hedgehog_joker, 'hedgehog_discard', 1, 3) then
               
                card.ability.jpaot_reshuffle = true 
                any_reshuffled = true
             end
        end
        
       
        if any_reshuffled then
            G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.5, 
                func = function() 
                    G.deck:shuffle('hedgehog_discard')
                    return true 
                end
            }))
        end
    end
    

    ref_discard_cards_from_highlighted(e, hook)
end



local ref_draw_card = draw_card

function draw_card(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, message)
    
    
    if card and card.ability and card.ability.jpaot_reshuffle then
        to = G.deck
        
       
        card.ability.jpaot_reshuffle = nil
        
        card:juice_up()
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Reshuffled!", colour = G.C.YELLOW})
    end
    
    ref_draw_card(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, message)
end


--GOD. 

local ref_draw_from_play_to_discard = G.FUNCS.draw_from_play_to_discard

G.FUNCS.draw_from_play_to_discard = function(e)
    local hedgehog_joker = SMODS.find_card("j_jpaot_sappy")[1]
    local sappy_blind = (G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_jpaot_sappy' and not G.GAME.blind.disabled)
    
    if not hedgehog_joker and not sappy_blind then
        return ref_draw_from_play_to_discard(e)
    end

    local cards_to_deck = {}
    local cards_to_hand = {}
    local cards_to_discard = {}

    -- Sort cards
    for i = 1, #G.play.cards do
        local card = G.play.cards[i]
        if (not card.shattered) and (not card.destroyed) then
            local handled = false
            
         
            if hedgehog_joker and not handled then
                if SMODS.pseudorandom_probability(hedgehog_joker, 'hedgehog_play', 1, 3) then
                     table.insert(cards_to_deck, card)
                     handled = true
                end
            end

        
            if sappy_blind and not handled then
                table.insert(cards_to_hand, card)
                handled = true
            end

            
            if not handled then
                table.insert(cards_to_discard, card)
            end
        end
    end

   
    if #cards_to_deck > 0 then
        for i, card in ipairs(cards_to_deck) do
            card:juice_up()
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Reshuffled!", colour = G.C.YELLOW})
           
            ref_draw_card(G.play, G.deck, 90, 'up', nil, card)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.2,
            func = function() G.deck:shuffle('hedgehog_play'); return true end
        }))
    end

    if #cards_to_hand > 0 then
         for i, card in ipairs(cards_to_hand) do
            card.ability.jpaot_sticky = true
            ref_draw_card(G.play, G.hand, i*100/#cards_to_hand, 'up', true, card)
            
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.1,
                func = function()
                    if card.area == G.hand then
                        G.GAME.blind:debuff_card(card)
                        card:juice_up()
                    end
                    return true
                end
            }))
        end
    end

    if #cards_to_discard > 0 then
        for i, card in ipairs(cards_to_discard) do
            ref_draw_card(G.play, G.discard, 90, 'up', nil, card)
        end
    end
end

--
SMODS.Blind {
    key = "samson",
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("fca656"),
    atlas = "blinds",
    pos = { x = 0, y = 6 },
     loc_vars = function(self)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, 4, 'jpaot_samson')
        return { vars = { numerator, denominator } }
    end,
    collection_loc_vars = function(self)
        return { vars = { '1', "4"} }
    end,
    calculate = function(self, blind, context)
        if not blind.disabled then
        
            if G.GAME.dollars < 0 then
                if context.modify_scoring_hand then 
                    if  SMODS.pseudorandom_probability(blind, 'jpaot_samson', 1, 4) then
                        return { remove_from_hand = true }
                    end
                end
            end

        
        
            if context.press_play then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()

                local text, disp_text, poker_hands, scoring_hand, non_scoring_hand = G.FUNCS.get_poker_hand_info(G.play.cards)
                
       
                for i = 1, #scoring_hand do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scoring_hand[i]:juice_up()
                            return true
                        end,
                    }))
                    ease_dollars(-3)
                    delay(0.23)
                end
                return true
            end
        }))
    end
        end
    end,

    disable = function(self)
    end
}


--emmy
SMODS.Blind{
    key = 'emmy',
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("b2889c"),
    atlas = "blinds",
    pos = { x = 0, y = 7 },


    set_blind = function(self, reset, silent)
        if not reset then
            G.GAME.emmy_startchips = G.GAME.blind.chips
        end
    end,


    disable = function()
        G.GAME.emmy_startchips = nil
    end,

    calculate = function(self, blind, context)
       
        if context.individual 
           and context.cardarea == G.play
           and context.other_card
           and not blind.disabled
        then

            local has_enhancement =
                context.other_card.ability 
                and context.other_card.ability.set == 'Enhanced'

           
            local has_seal = context.other_card.seal ~= nil

          
            local has_edition = context.other_card.edition ~= nil

            if has_enhancement or has_seal or has_edition then
              
                local base = G.GAME.emmy_startchips or G.GAME.blind.chips
                local inc  = math.floor(base * 0.25)
                if inc < 1 then inc = 1 end

                G.GAME.blind.chips = G.GAME.blind.chips + inc
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate(true)
                G.GAME.blind:wiggle()
            end
        end
    end,
}