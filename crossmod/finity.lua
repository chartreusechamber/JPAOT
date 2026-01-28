SMODS.Sound ({
    key = 'jp_consume',
    path = 'jp_consume.ogg',
    pitch = 1,
})



SMODS.Joker {
    key = "jpenguin",
    name = "Jade Penguin",

    atlas = "jokers",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },

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
    end
}


SMODS.Joker {
    key = "mole",
    name = "Maroon Mole",

    atlas = "jokers",
    pos = { x = 2, y = 0 },
    soul_pos = { x = 3, y = 0 },

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

    end
}

SMODS.Joker {
    key = "beaver",
    name = "Brass Beaver",

    atlas = "jokers",
    pos = { x = 4, y = 0 },
    soul_pos = { x = 5, y = 0 },

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

    end
}

SMODS.Joker {
    key = "frog",
    name = "Fandango Frog",

    atlas = "jokers",
    pos = { x = 6, y = 0 },
    soul_pos = { x = 7, y = 0 },

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

    end
}

SMODS.Joker {
    key = "polarbear",
    name = "Quartz Polar Bear",

    atlas = "jokers",
    pos = { x = 8, y = 0 },
    soul_pos = { x = 9, y = 0 },

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

    end
}

SMODS.Joker {
    key = "samson",
    name = "Butterscotch Bugbear",

    atlas = "jokers",
    pos = { x = 10, y = 0 },
    soul_pos = { x = 11, y = 0 },

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

    end
}

SMODS.Joker {
    key = "emmy",
    name = "Blueberry Bird",

    atlas = "jokers",
    pos = { x = 12, y = 0 },
    soul_pos = { x = 13, y = 0 },

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

    end
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
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicolon_compat = true,

    loc_vars = function(self, info_queue, card)
		local num, den = SMODS.get_probability_vars(card, 1, card.ability.extra.chance, "jpaot_jpenguin")
        return { vars = {num, den, card.ability.extra.xm} }
    end,

    calculate = function(self, card, context)

    end
}