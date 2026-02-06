
return {
    descriptions = {
        Back = {
          

           

        },

        Blind = {
            bl_jpaot_jpenguin = {
                name = "Jade Penguin",
                text = {
                    "Played hand must contain",
                    "an unscoring card"
                }
            },

               bl_jpaot_mole = {
                name = "Maroon Mole",
                text = {
                    "Most played cards are shuffled",
                    "to the bottom of your deck"
                }
            },

                           bl_jpaot_beaver = {
                name = "Brass Beaver",
                text = {
                    "Played hand must contain",
                    "a #1#"
                }
            },

                    bl_jpaot_frog= {
                name = "Fandango Frog",
                text = {
                    "Only the final hand",
                    "will score"
                }
            },

                    bl_jpaot_polarbear = {
                name = "Quartz Polar Bear",
                text = {
                    "If hand contains an unscoring card,",
                    "half final score"
                }
            },

              bl_jpaot_polarbear = {
                name = "Quartz Polar Bear",
                text = {
                    "Final score is halved if",
                    "hand contains an unscoring card"
                }
            },

              bl_jpaot_sappy = {
                name = "Honey Hedgehog",
                text = {
                    "Copies the effects of",
                    "#1# and #2#"
                }
            },

            bl_jpaot_emmy = {
                name = "Blueberry Bird",
                text = {
                    "+x0.25 Blind Requirement when",
                    "a modifed card is played"
                }
            },

             bl_jpaot_samson = {
                name = "Butterscotch Bugbear",
                text = {
                    "Discard a card in hand",
                    "and lose $3 for every",
                    "card scored",
                    "Cards have a #1# in #2#",
                    "chance to not score if in debt",
                }
            },
        },

        Joker = {


            j_jpaot_jpenguin = {
                name = "Jade Penguin",
                text = {
                    "Played and {C:attention}unscoring{} cards have a",
                    "{C:green}#1# in #2#{} chance to be {C:red}destroyed",
                    "Gain a tenth of its rank as {C:white,X:mult}XMult",
                    "{s:0.8,C:inactive}(Currently {s:0.8,C:white,X:mult}X#3#{s:0.8,C:inactive} Mult)"
                }
            },

             j_jpaot_mole = {
                name = "Maroon Mole",
                text = {
                    "{X:mult,C:white}X#2#{} Mult",
                    "Gains {X:mult,C:white}X#1#{} Mult",
                    "per card {C:attention}discarded{}",
                }
            },

             j_jpaot_beaver = {
                name = "Brass Beaver",
                text = {
                    "Retrigger every scored {C:attention}#1#{}",
                    "for every {C:attention}#1#{} in played hand",
                    "{s:0.8,C:attention}Rank{} {s:0.8}is your most played rank"
                }
            },

            j_jpaot_frog = {
                name = "Fandango Frog",
                text = {
                    "{X:purple,C:white}X#1#{} Chips and Mult,",
                    "then gives {X:mult,C:white}X#2#{} Mult",
                    "per hands played this round",
                    "on {C:attention}final hand{} instead"
                }
            },
          
             j_jpaot_polarbear = {
                name = "Quartz Polar Bear",
                text = {
                    "If all played cards are scoring,",
                    "Gains a {C:attention}tenth{} of a random played card's",
                    "rank as {X:chips,C:white}xChips{}",
                    "{C:inactive}(Currently {C:white,X:chips}X#1#{C:inactive} Chips)"
                }
            },

            j_jpaot_samson = {
                name = "Butterscotch Bugbear",
                text = {
                    "Scored cards have a {C:green}#1# in #2#{}",
                    "chance to {C:attention}retrigger{} for for every",
                    "{C:money}$#3#{} you have",
                }
            },
           
            j_jpaot_emmy = {
                name = "Blueberry Bird",
                text = {
                    "Played and {C:attention}unscoring{} cards have a",
                    "{C:green}#1# in #2#{} chance to be {C:red}destroyed",
                    "Gain a tenth of its rank as {C:white,X:mult}XMult",
                    "{s:0.8,C:inactive}(Currently {s:0.8,C:white,X:mult}X#3#{s:0.8,C:inactive} Mult)"
                }
            },
           
             j_jpaot_sappy = {
                name = "Honey Hedgehog",
                text = {
                    "Played and {C:attention}unscoring{} cards have a",
                    "{C:green}#1# in #2#{} chance to be {C:red}destroyed",
                    "Gain a tenth of its rank as {C:white,X:mult}XMult",
                    "{s:0.8,C:inactive}(Currently {s:0.8,C:white,X:mult}X#3#{s:0.8,C:inactive} Mult)"
                }
            },

           

           
        },

        Partner = {
            pnr_jpaot_snugglepenguin = {
                name = "Snugglebug",
                text = {
                    "When card is {C:attention}destroyed",
                    "{C:green}#1# in #2#{} chance to",
                    "gain half its {C:blue}chips",
                    "{C:inactive}(Currently {C:blue}+#3#{C:inactive} Chips)"
                }
            },

            pnr_jpaot_snugglepenguin_1 = {
                name = "Snugglebug",
                text = {
                    "When card is {C:attention}destroyed",
                    "gain half its {C:blue}chips",
                    "{C:green}#1# in #2#{} chance to",
                    "instead gain all of its rank",
                    "{C:inactive,s.0.8}(Currently {C:blue}+#3#{} Chips)"
                }
            }
        },

    
	},

    misc = {

         dictionary = {
    
             k_upgrade_eat = {
                 "Consumed!",
                 "Fine dined!",
                 "Bit!",
                 "Snacked!",
                 "Oops!",
                 "Digested!"
             },

         },

         quips = {
             -- jpenguin came up with all of these
             -- blame him not me
             pnr_jpaot_snugglepenguin_1 = {
                 "Trust me, my appetite",
                 "is way beyond what",
                 "you would expect"
             },

             pnr_jpaot_snugglepenguin_2 = {
                 "I like eating",
                 "cards, they",
                 "remind me of",
                 "crackers"
             },

             pnr_jpaot_snugglepenguin_3 = {
                 "I won't accept just",
                 "fish and krill, I",
                 "require fine dining..."
             },

             pnr_jpaot_snugglepenguin_4 = {
                 "My tummy rumbles for",
                 "some sweet action"
             },

             pnr_jpaot_snugglepenguin_5 = {
                 "This'll be a piece",
                 "of cake, now that",
                 "your favorite casino",
                 "penguin is here!"
             },

             lq_jpenguin_1 = {
                 "Maybe next time... uhhh,",
                 "not let one of your stuff",
                 "not score?"
             },

             lq_jpenguin_2 = {
                 "I'm not sure what you're",
                 "trying to do but it's absolutely",
                 "funny, keep doing that."
             },

             lq_jpenguin_3 = {
                 "I'm hungry,",
                 "what's for dessert?"
             },

             lq_jpenguin_4 = {
                 "Hey, chin up, not everyone",
                 "can win against me" 
             },

             lq_endless_jpenguin_1 = {
                 "C'mon man, can't you let",
                 "a penguin like me rest",
                 "for a while?"
             },

             lq_endless_jpenguin_2 = {
                 "I'm too drowsy to even",
                 "finish my...",
                 "zzzzz..."
             },

             lq_endless_jpenguin_3 = {
                 "I believe it's a good",
                 "time to get up and",
                 "stretch. Thank me later!"
             },
         },

    },
}
