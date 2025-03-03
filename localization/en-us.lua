return {
    descriptions = {
        -- this key should match the set ("object type") of your object,
        -- e.g. Voucher, Tarot, or the key of a modded consumable type
		Tarot = {
			c_bf_sapling = {
				name = "Wilted Sapling",
				text = {
					" ",
					"Someone wants this very badly...",
					"#1#"
				},
			},
		},
        Joker = {
            -- this should be the full key of your object, including any prefixes
            j_bf_vi = {
				name = "Vi",
				text = {
					"{C:attention}6{}s give {X:dark_edition,C:white} ^#1# {} Mult when scored",
					"Increase value by {X:dark_edition,C:white}^#2#{} when a {C:attention}6{} scores",
					" ",
					"{C:inactive}I'm worth like four bees, okay!?{}",
				},
            },
			j_bf_kabbu = {
				name = "Kabbu",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult against {C:attention}Boss Blinds{}",
					"Earn {C:money}$#2#{} when played hand triggers a {C:attention}Boss Blind{}",
					" ",
					"{C:inactive}You shouldn't underestimate me.{}",
				},
			},
			j_bf_leif = {
				name = "Leif",
				text = {
					"{C:attention}Glass cards{} give an additional",
					"{X:dark_edition,C:white}^#1#{} Mult when scored",
					"This number increases by {X:dark_edition,C:white}^#2#{}",
					"when a {C:attention}Glass card{} breaks",
					" ",
					"{C:inactive}Sup.{}",
				},
			},
			j_bf_hoaxe = {
				name = "Hoaxe",
				text = {
					"When a {C:attention}King{} is scored,",
					"multiply {C:attention}Blind size{} by {C:attention}x#1#{}",
					" ",
					"{C:inactive}For when I consume the sapling...{}",
					"{C:inactive}You will have no choice but to squirm in fear{}",
					"{C:inactive}and surrender to your King!{}",
				},
			},
			j_bf_elk = {
				name = "The Everlasting King",
				text = {
					"When a {C:attention}King{} is scored,",
					"multiply {C:attention}Blind size{} by {C:attention}x#1#{}",
					"When hand is played, gain {C:attention}x#2#{} {C:red}Discards{}",
					" ",
					"{C:inactive}...Yes...YES!{}",
					"{C:inactive}This power will suit me just fine!{}",
				},
			},
			j_bf_carmina = {
				name = "Carmina",
				text = {
					"Spin a {C:attention}roulette{} when hand is played",
					" ",
					"{C:inactive}I brought you into the scene...{}",
					"{C:inactive}But I\'ll crush you nonetheless!{}",
				},
			},
			j_bf_asto = {
				name = "Astotheles",
				text = {
					"When selecting a {C:attention}Blind{},",
					"destroy a random {C:attention}Consumable{}",
					"and {C:planet}level up{} {C:attention}all hands #1# times{}",
					" ",
					"{C:inactive}You shall have an honorable fight.{}",
					"{C:inactive}Do your worst!{}",
				},
			},
			j_bf_venus = {
				name = "Venus",
				text = {
					"{C:attention}+#1# Consumable slots{}",
					"{C:attention}Mult cards{} have a {C:green}chance{} to, when scored:",
					"{C:green}#2# in #4#{}: give {C:money}$#3#{}",
					"{C:green}#2# in #5#{}: give a {C:tarot}Tarot card{}",
					"{C:green}#2# in #6#{}: give a {C:spectral}Spectral card{}",
					"{C:green}#2# in #7#{}: give a {C:spectral}Soul{}",
					"{C:green}#2# in #8#{}: give a {C:cry_exotic}Gateway{}",
					'{C:inactive}(Does not require room, but may overflow)',
					" ",
					"{C:inactive}My roots travel all across the soil.{}",
				},
			},
			j_bf_elizant2 = {
				name = "Queen Elizant II",
				text = {
					"{C:attention}Each card held in hand{} gives {X:mult,C:white}X#1#{} Mult",
					" ",
					"{C:inactive}Time is precious. Let us not waste it.{}",
				},
			},
			j_bf_elizant1 = {
				name = "Queen Elizant I",
				text = {
					" ",
					"{C:inactive}(She's taking a hard-earned rest.){}",
					" "
				},
			},
			j_bf_etq = {
				name = "The Eternal Queen",
				text = {
					"{C:attention}Queens{} of {C:hearts}Hearts{} give {X:dark_edition,C:white}^#1#{} Mult when scored",
					"{C:attention}Other Queens{} give {X:dark_edition,C:white}^#2#{} Mult when scored",
					"{C:attention}All other cards{} give {X:dark_edition,C:white}^#3#{} Mult when scored",
					" ",
					"{C:inactive}(She has nothing to say.){}"
				},
			},
			j_bf_scarlet = {
				name = "Monsieur Scarlet",
				text = {
					"When hand is played,",
					"fixed {C:green}25% chance{} to",
					"gain {C:attention}#1# hands{}",
					" ",
					"{C:inactive}Just...{} {C:inactive,E:1}relax{}{C:inactive}...~{}",
				},
			},
			j_bf_bianca = {
				name = "Queen Bianca",
				text = {
					"If played hand contains a {C:attention}Straight{},",
					"retrigger all Jokers {C:attention}once per card scored{}",
					" ",
					"{C:inactive}We all have our wonderful place in this world.{}",
				},
			},
			j_bf_vanessa = {
				name = "Queen Vanessa II",
				text = {
					"All {C:money}money{} earned is {C:attention}tripled{}",
					" ",
					"{C:inactive}Please, allow me to accompany you.{}",
				},
			},
			j_bf_janet = {
				name = "Janet",
				text = {
					"All {C:attention}non-enhanced cards{} give",
					"{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult when scored",
					" ",
					"{C:inactive}I'll do my best, so you do too.{}",
				},
			},
			j_bf_layra = {
				name = "Queen Layra II",
				text = {
					"Gives {C:attention}+1 Joker slot{} per",
					"card that is added to the deck",
					"{C:inactive}#2#{}",
					" ",
					"{C:inactive}I hope you can provide a good show!{}",
				},
			},
			j_bf_hector = {
				name = "King Hector IV",
				text = {
					"{X:mult,C:white}X#2#{} Mult {C:attention}(multiplicatively)",
					"per card in deck below {C:attention}#1#{}",
					"{C:inactive}(Currently{} {X:mult,C:white}X#3#{} {C:inactive}Mult){}",
					" ",
					"{C:inactive,s:1.35}HECTOR IV!{} {C:inactive,s:1.1}Not{} {C:inactive,s:1.35}HECTOR!",
				},
			},
			j_bf_kali = {
				name = "Kali",
				text = {
					"When {C:money}money is earned{} during",
					"a {C:attention}Boss Blind, this Joker",
					"gives {X:mult,C:white}XMult{} equal to the {C:money}money earned",
					"{C:inactive}(Requires $1 or more){}",
					"{C:inactive}(Currently #1# with {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
					" ",
					"{C:inactive}You cannot put a price on a masterpiece.{}"
				},
			},
        },
    },
}