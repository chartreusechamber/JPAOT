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