-- globals.lua

SMODS.current_mod.calculate = function(self, context)
    if not (G and G.GAME and G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind) then
        return
    end

    if G.GAME.blind.config.blind.key == "bl_jpaot_polarbear"
       and context.after   -- or `context.after` if you’re sure that exists
       and G.GAME.blind.effect
       and G.GAME.blind.effect.polarbear
    then
        G.GAME.blind.effect.polarbear = false
        G.GAME.chips = math.floor((G.GAME.chips or 0) * 0.5)
        -- optional:
        SMODS.juice_up_blind()
    end
end

function SMODS.current_mod.calculate(self, context)
    if old_mod_calc then
        old_mod_calc(self, context)
    end

    -- Track "most played" cards over the whole run
    if context.individual and context.cardarea == G.play and context.other_card then
        if not G.GAME.most_played_stats then
            G.GAME.most_played_stats = {}
        end

        if context.other_card.base and context.other_card.base.suit and context.other_card.base.rank then
            local k = context.other_card.base.suit .. "_" .. context.other_card.base.rank
            G.GAME.most_played_stats[k] = (G.GAME.most_played_stats[k] or 0) + 1
        end
    end
end