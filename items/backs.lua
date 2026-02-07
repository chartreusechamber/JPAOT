
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

      
        local master_pool = {
            "bl_jpaot_jpenguin",
            "bl_jpaot_mole",
            "bl_jpaot_beaver",
            "bl_jpaot_frog",
            "bl_jpaot_polarbear",
            "bl_jpaot_sappy",
            "bl_jpaot_emmy",
            "bl_jpaot_samson",
        }


        if not G.GAME.jpaot_gauntlet_bag or #G.GAME.jpaot_gauntlet_bag == 0 then
            G.GAME.jpaot_gauntlet_bag = {}
            for _, boss_key in ipairs(master_pool) do
                table.insert(G.GAME.jpaot_gauntlet_bag, boss_key)
            end
           
        end

       
        local seed = 'gauntlet_boss_' .. G.GAME.round_resets.ante
        local index = math.ceil(pseudorandom(seed) * #G.GAME.jpaot_gauntlet_bag)
        
        local selected_boss = G.GAME.jpaot_gauntlet_bag[index]
        
   
        table.remove(G.GAME.jpaot_gauntlet_bag, index)

        return selected_boss
    end

    return ref_get_new_boss()
end