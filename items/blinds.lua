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

--blinds.lua
SMODS.Blind {
    key = "mole",
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("B88828"),

    atlas = "blinds",
    pos = { x = 0, y = 1 },

    calculate = function(self, blind, context)
     
    end,

    disable = function(self)
    G.deck:shuffle('nr'..G.GAME.round_resets.ante)
    end
}

local old_shuffle = CardArea.shuffle

function CardArea:shuffle(_seed)
    local result = old_shuffle(self, _seed)

    -- Only do anything if Mole is the current blind and not disabled
    if not (G and G.GAME and G.GAME.blind and G.GAME.blind.config
        and G.GAME.blind.config.blind
        and G.GAME.blind.config.blind.key == "bl_jpaot_mole"
        and not G.GAME.blind.disabled) then
        return result
    end

    -- Only reorder the main deck, not hand/discard/etc
    if self ~= G.deck then
        return result
    end

    if not G.GAME.most_played_stats then
        return result
    end

    -- Find the maximum play count
    local best = 0
    for key, count in pairs(G.GAME.most_played_stats) do
        if count > best then
            best = count
        end
    end
    if best <= 0 then
        return result
    end

    -- All rank+suit keys tied for max become "most played"
    local targets = {}
    for key, count in pairs(G.GAME.most_played_stats) do
        if count == best then
            targets[key] = true
        end
    end

    -- Split deck into keep vs push-to-bottom
    local keep = {}
    local bottom = {}

    for i = 1, #self.cards do
        local c = self.cards[i]
        local move = false

        if c.base and c.base.suit and c.base.rank then
            local k = c.base.suit .. "_" .. c.base.rank
            if targets[k] then
                move = true
            end
        end

        if move then
            bottom[#bottom + 1] = c
        else
            keep[#keep + 1] = c
        end
    end

    -- Rebuild: first all non-most-played, then all most-played
    self.cards = keep
    for i = 1, #bottom do
        self.cards[#self.cards + 1] = bottom[i]
    end

    return result
end


SMODS.Blind {
    key = "beaver",
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("A61A1F"),

    atlas = "blinds",
    pos = { x = 0, y = 2 },

    calculate = function(self, blind, context)
       
    end,

    disable = function(self)
      
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
       
    end,

    debuff_hand = function(self, cards, hand, handname, check)
        if G.GAME.current_round.hands_left == 0 then 
            return true 
        end
    end,


}

-- Currently broken, halves your entire score if hand hand contains an unscored card. 
SMODS.Blind{
    key = "polarbear",
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("634d84"),
    atlas = "blinds",
    pos = { x = 0, y = 4 },

    calculate = function(self, blind, context)
        -- only in scoring contexts where these exist
        if context.scoring_hand and context.full_hand then
            if #context.scoring_hand < #context.full_hand then
                G.GAME.blind.effect = G.GAME.blind.effect or {}
                G.GAME.blind.effect.polarbear = true
            end
        end

    end,

    disable = function(self)
        if G.GAME and G.GAME.blind and G.GAME.blind.effect then
            G.GAME.blind.effect.polarbear = nil
        end
    end,

}

SMODS.Blind {
    key = "sappy",
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("d8de3e"),

    atlas = "blinds",
    pos = { x = 0, y = 5 },

    calculate = function(self, blind, context)
       
    end,

    disable = function(self)
      
    end
}

SMODS.Blind {
    key = "samson",
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("fca656"),

    atlas = "blinds",
    pos = { x = 0, y = 6 },

    calculate = function(self, blind, context)
       
    end,

    disable = function(self)
      
    end
}



SMODS.Blind{
    key = 'emmy',
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX("b2889c"),
    atlas = "blinds",
    pos = { x = 0, y = 7 },

    -- Save the starting chip requirement when the blind is set
    set_blind = function(self, reset, silent)
        if not reset then
            G.GAME.emmy_startchips = G.GAME.blind.chips
        end
    end,

    -- Optional: clean up when disabled
    disable = function()
        G.GAME.emmy_startchips = nil
    end,

    calculate = function(self, blind, context)
        -- Run once per scoring card
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