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
    boss_colour = HEX("B88828"),

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