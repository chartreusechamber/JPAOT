local mod = SMODS.Mods["JPAOT"]

mod.calculate = function(self, context)
    
   
    if context.individual and context.cardarea == G.play then
        local card = context.other_card
        
        if card then
            
           -- Mole code, tracks most played card
            if card.base and card.base.suit and card.base.id then
                G.GAME.most_played_stats = G.GAME.most_played_stats or {}
                
                local mp_key = card.base.suit .. "_" .. card.base.id
                
                G.GAME.most_played_stats[mp_key] = (G.GAME.most_played_stats[mp_key] or 0) + 1
                
                --print("Mole Trigger: " .. mp_key .. " | Total: " .. G.GAME.most_played_stats[mp_key])
            end

           --beaver tracker, tracks rank
            local id = card:get_id()

            -- CHECK: id > 1 ensures we filter out Stone Cards (which return -100 etc)
            if id and id > 1 then
                G.GAME.most_played_ranks = G.GAME.most_played_ranks or {}
                
                -- Save purely by ID number
                G.GAME.most_played_ranks[id] = (G.GAME.most_played_ranks[id] or 0) + 1
                
                --print("Beaver Trigger: Rank " .. id .. " | Total: " .. G.GAME.most_played_ranks[id])
            end

        end
    end
end

