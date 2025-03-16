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
					"a {C:attention}Boss Blind{}, this Joker",
					"gives {X:mult,C:white}XMult{} equal to the {C:money}money earned",
					"{C:inactive}(Requires $1 or more){}",
					"{C:inactive}(Currently #1# with {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
					" ",
					"{C:inactive}You cannot put a price on a masterpiece.{}"
				},
			},
			j_bf_mothiva = {
				name = "Mothiva",
				text = {
					"If played hand contains {C:attention}4 or more{}",
					"scoring cards, upgrade the {C:attention}rank{} of each one",
					"{C:inactive}(Aces do not become 2s){}",
					" ",
					"{C:inactive}It's a bug eat bug world, on the way to stardom!"
				},
			},
			j_bf_zasp = {
				name = "Zasp",
				text = {
					"{C:attention}Aces{} give {X:mult,C:white}X#1#{} Mult when scored",
					"This value doubles if {C:attention}Mothiva{} is debuffed,",
					"and quadruples if {C:attention}Mothiva{} is dissolved",
					" ",
					"{C:inactive}Don't misunderstand. I'm not doing this only for Mothiva.",
					"{C:inactive}...Although it's a pretty big reason.{}"
				},
			},
			j_bf_charmy = {
				name = "Charmy",
				text = {
					"When a {C:attention}hand{} is played, fixed {C:green}50% chance{} to",
					"generate a random {C:planet}Planet{}, {C:tarot}Tarot{}, or {C:spectral}Spectral{} card",
					"{C:inactive}(Equal chance for each)",
					" ",
					"{C:inactive}Hello there lovelies! Welcome to my humble stall.",
				},
			},
			j_bf_stratos = {
				name = "Stratos",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult",
					"This boost {C:attention}doubles{} when",
					"a {C:attention}Boss Blind{} is defeated",
					" ",
					"{C:inactive,s:1.35}I'VE BEEN WAITING TO LET LOOSE!{}",
				},
			},
			j_bf_delilah = {
				name = "Delilah",
				text = {
					"When a {C:attention}non-Boss{} Blind is selected,",
					"fixed {C:green}33%{} chance",
					"to Sth-root the {C:attention}Blind requirement{}",
					"{C:inactive}(S = sum of hands and discards, currently #1#)",
					" ",
					"{C:inactive}Take your time! A rushed fight's no good.{}",
				},
			},
			j_bf_maki = {
				name = "Maki",
				text = {
					"{C:attention}Steel cards{} give an additional",
					"{X:dark_edition,C:white}^#1#{} Mult when held in hand",
					" ",
					"{C:inactive}I would never serve one without conviction and integrity.{}",
				},
			},
			j_bf_kina = {
				name = "Kina",
				text = {
					"{C:attention}Jacks{} give {X:dark_edition,C:white}^#1#{} Mult when scored",
					"Retrigger scored {C:attention}Jacks{} once per copy of {C:attention}Maki{}",
					" ",
					"{C:inactive}#2#{}",
				},
			},
			j_bf_yin = {
				name = "Yin",
				text = {
					"When a {C:attention}non-{C:dark_edition}Negative{} {C:attention}consumable{} is used,",
					"fixed {C:green}25%{} chance to create a {C:dark_edition}Negative{} copy",
					"{C:inactive}(Unretriggerable){}",
					" ",
					"{C:inactive}N...Nice to me...meet you!{}",
				},
			},
        },
    },
}