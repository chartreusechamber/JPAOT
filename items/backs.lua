
SMODS.Back {
    key = "gauntlet",
    atlas = "gauntlet",
    pos = {x = 0, y = 0},
    config = {
        dollars = 6,
        joker_slot = 1
    },
}
local ref_get_new_boss = get_new_boss

function get_new_boss()
    
    if G.GAME.selected_back and G.GAME.selected_back.effect.center.key == 'b_jpaot_gauntlet' then
        
        if G.GAME.round_resets.ante % 8 == 0 then
            return "bl_jpaot_jpenguin"
        end

        local gauntlet_pool = {
            "bl_jpaot_jpenguin",
            "bl_jpaot_mole",
            "bl_jpaot_beaver",
            "bl_jpaot_frog",
            "bl_jpaot_polarbear",
            "bl_jpaot_sappy",
            "bl_jpaot_emmy",
            "bl_jpaot_samson",
         
        }

        local selected_boss = pseudorandom_element(gauntlet_pool, pseudoseed('gauntlet_pool'..G.GAME.round_resets.ante))
        
        return selected_boss
    end

    return ref_get_new_boss()
end