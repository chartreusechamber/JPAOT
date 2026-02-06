
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


             --- JADE PENGUIN

                --Showdown

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

                -- Endless

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





            --- MAROON MOLE

                --Showdown

                lq_mole_1 = {
                    "Mortal of flesh, do you",
                    "think you can win against somebody",
                    "born from the Ethereal Plane?"
                },

                lq_mole_2 = {
                    "You really can't dig your way",
                    "out of my rocky slapstick!",
                },

                lq_mole_3 = {
                    "...and that's why ya",
                    "deck fix, people at home!"
                },

                lq_mole_4 = {
                    "Your deck makes a",
                    "{s:1.2}GREAT{} restin'",
                    "place for ya!" 
                },

                -- Endless

                lq_endless_mole_1 = {
                    "That's all, folks!",
 
                },

                lq_endless_mole_2 = {
                    "I could live forever,",
                    "'til the end of the",
                    "universe I bet!",
                    "...sorry for bein' a",
                    "downer, hope I was funny though!",
                },

                lq_endless_mole_3 = {
                    "Great run! A shame",
                    "the law of toons had",
                    "to make ya fall and go BAM!"
                },





            --- BRASS BEAVER

                --Showdown

                lq_beaver_1 = {
                    "My fellow classmates call me,",
                    "'The Beaver* Beaver'",
                    "for a reason!",
                    " ",
                    "*A very hard working person."
                },

                lq_beaver_2 = {
                    "Want some animadversion*?",
                    "Fix your deck!",
                    " ",
                    "*Criticism or censure."
                },

                lq_beaver_3 = {
                    "Seems like you lack the",
                    "the appetency* against my rules!",
                    " ",
                    "*A fixed and strong desire."
                },

                lq_beaver_4 = {
                    "You did all of that",
                    "just to boondoggle*?",
                    "Oh well!",
                    " ",
                    "*Work or activity that",
                    "is wasteful or pointless",
                    "but gives the appearence",
                    "of having value"
                },

                -- Endless

                lq_endless_beaver_1 = {
                    "Nice work, you sure gave",
                    "me some delectation* there.",
                    " ",
                    "*Pleasure and delight.",
                },

                lq_endless_beaver_2 = {
                    "Eeeyep, seems like you",
                    "finally got enervated*.",
                    " ",
                    "*Drained of energy or vitality.",
                },

                lq_endless_beaver_3 = {
                    "My tail was sure the",
                    "ferricadouzer* to wake",
                    "you out of this I bet!",
                    " ",
                    "*A knockout blow."
                },

                lq_endless_beaver_4 = {
                    "A+. Your build had a",
                    "ebullient* kick to it.",
                    " ",
                    "*Bursting with great",
                    "nthusiasm or excitement",
                },









            --- FANDANGO FROG

                --Showdown

                lq_frog_1 = {
                    "Sayonara.",

                },

                lq_frog_2 = {
                    "Moves with silent grace,",
                    "Even though she is a frog,",
                    "Stealthy ninja strikes."
                },

                lq_frog_3 = {
                    "If only you weren't,",
                    "an easy and open target."
                },

                lq_frog_4 = {
                    "I'm sorry it had",
                    "to be this way." 
                },

                -- Endless

                lq_endless_frog_1 = {
                     "{f:jpaot_madou}さよなら{}.",
                },

                lq_endless_frog_2 = {
                    "{f:jpaot_madou}またね{}.",
                },

                lq_endless_frog_3 = {
                    "Rest easy now."
                },

                lq_endless_frog_4 = {
                    "This cold-bloodline shall",
                    "live on for years to come.",
                },








            --- QUARTZ POLAR BEAR

                --Showdown

                lq_bear_1 = {
                    "I rock like a guitar hero,",
                    "you didn't even live to",
                    "see the encore, mosh on!"
                },

                lq_bear_2 = {
                    "You played like an",
                    "American Idiot, mosh on!",
                },

                lq_bear_3 = {
                    "Seems like you forgot",
                    "to tune your deck before",
                    "the big show, mosh on!"
                },

                -- Endless

                lq_endless_bear_1 = {
                    "Now if you excuse me,",
                    "I'm going to dive into",
                    "the crowd, mosh on!"
                },


            --- SAMSON

                --Showdown

                lq_samson_1 = {
                    "Myehehe~! Sorry for",
                    "being so tough on ya!",
                },

                lq_samson_2 = {
                    "Econ is the name of",
                    "the game here!",
                },

                lq_samson_3 = {
                    "Don't worry, you'll",
                    "get em next time!!",
                },

                lq_samson_4 = {
                    "Uh oh! Your honey-",
                    "er, money ran dry!",
                },

                                lq_samson_5 = {
                    "They spent 4K on a blind,",
                    "Only to find they wasted their time!",
                },

                     lq_samson_6 = {
                    "Not so much of a",
                    "teddy bear now, am I?",
                },

                -- Endless

                lq_endless_samson_1 = {
                    "What do you think of the mod?",
                    "It took forever to get all",
                    "the blind gimmicks working..."
                },

                lq_endless_samson_2 = {
                    "Add me to your mod!",
                    "Myehehehehe~!!",
                },

                lq_endless_samson_3 = {
                    "JPenguin has some adorable,",
                    "characters, doesn't he?",
                    "They're fun to draw!"
                },

                 lq_endless_samson_4 = {
                    "Listen to Mycom Maim Marionette",
                    "by Kidorikko!",
                },

                  lq_endless_samson_4 = {
                    "Listen to Pizzicato Five!!",
                },

                    lq_endless_samson_5  = {
                    "Aiyaiyai, I'm your",
                    "little butterfly!!"
                },

                     lq_endless_samson_6  = {
                    "Quartz is super cute!",
                    "No bias here though."
                },

    









            --- EMMY

                --Showdown

                lq_emmy_1 = {
                    "I'm sorry, dear,",
                    "were my confections",
                    "too much this time?"
                },

                lq_emmy_2 = {
                    "What you need is",
                    "a second helping,,,",
                    "don't be shy~",
                },

                lq_emmy_3 = {
                    "Hmmm... seems like",
                    "this batch was a",
                    "little overproofed."
                },

                lq_emmy_4 = {
                    "Oh my... was it too much",
                    "of a good thing, sweetie?",
                    "I understand... hmhmhmhm~"
                },

                -- Endless

                lq_endless_emmy_1 = {
                    "Ending, ending, endless.",
                },

                lq_endless_emmy_2 = {
                    "Just when is 'someday'?",
                    "I'll see you soon, dear.",
                },


                 lq_endless_emmy_3 = {
                    "Mhmhmhmhm~",
                    "I hope I could be of",
                    "use to you, darling.",
                },

                 lq_endless_emmy_4 = {
                    "What a facinating batch",
                    "we baked today~",
                    "Please come again, sweetie.",
                },

                lq_endless_emmy_5 = {
                    "It's more of a",
                    "lifestyle, dear~",
                    "What more could I do?",
                },

                 lq_endless_emmy_6 = {
                    "Mmmhmhmhm~ what an",
                    "interesting result~",
                },



            -- SAPPY

                --Showdown

                lq_sappy_1 = {
                    "oh...",
                },

                lq_sappy_2 = {
                    "u got unlucky...",
                },

                lq_sappy_3 = {
                    "u just got.....",
                    "sappied!!!!!!"
                },

            
                -- Endless

                lq_endless_sappy_1 = {
                    "waow...",
                    "nice :3"
                },

                lq_endless_sappy_2 = {
                    "u did good!",
                },


                 lq_endless_sappy_3 = {
                    "coding jade",
                    "was so hard",
                },

                lq_endless_sappy_4 = {
                    "im slime :3",
                },
                
                lq_endless_sappy_5 = {
                    "{s:3}:3",
                },

                    lq_endless_sappy_6 = {
                    "play neonflame too",
                    "if u want"
                },

                
         },

    },
}
