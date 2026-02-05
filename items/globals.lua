local mod = SMODS.Mods["JPAOT"]

mod.calculate = function(self, context)
    
    if context.individual and context.cardarea == G.play then
        

        local card = context.other_card
        
        if card then
            G.GAME.most_played_stats = G.GAME.most_played_stats or {}
            
            
            if card.base and card.base.suit and card.base.id then
                local mp_key = card.base.suit .. "_" .. card.base.id
                
                G.GAME.most_played_stats[mp_key] = (G.GAME.most_played_stats[mp_key] or 0) + 1
                
               
                print("Individual Trigger: " .. mp_key .. " | Total: " .. G.GAME.most_played_stats[mp_key])
            end
        end
    end
end