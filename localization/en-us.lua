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
					"{C:inactive}#3#{}",
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
					"{C:green}#3# in #4#{}: give {C:money}$#2#{}",
					"{C:green}#5# in #6#{}: give a {C:tarot}Tarot card{}",
					"{C:green}#7# in #8#{}: give a {C:spectral}Spectral card{}",
					"{C:green}#9# in #10#{}: give a {C:spectral}Soul{}",
					"{C:green}#11# in #12#{}: give a {C:cry_exotic}Gateway{}",
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
					"{C:inactive}#3#{}",
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
					"When {C:money}money is earned{}, during",
					"next {C:attention}Boss Blind{}, this Joker",
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
					"{X:dark_edition,C:white}^#1#{} Mult when scored and held in hand",
					" ",
					"{C:inactive}I would never serve one without{}",
					"{C:inactive}conviction and integrity.{}",
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
			j_bf_fry = {
				name = "Fry",
				text = {
					"When leaving the shop, create",
					"{C:attention}#1#{} {C:dark_edition}Negative{} copies of {C:cry_code}://SPAGHETTI{}",
					"{C:inactive}(Max #2#)",
					" ",
					"{C:inactive}Watch a master do his work!{}",
				},
			},
			j_bf_kut = {
				name = "Kut",
				text = {
					"{X:mult,C:white}X#1#{} Mult {C:attention}(multiplicatively){} per {C:attention}food Joker{} you own",
					"{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult)",
					" ",
					"{C:inactive}Witness it! A life of skill and mastery put to use!{}",
				},
			},
			j_bf_crisbee = {
				name = "Crisbee",
				text = {
					"{C:attention}Food Jokers{} give {C:money}$#1#{}",
					"when they trigger",
					"{C:inactive}#2#{}",
					"{C:inactive}Crisbee's always open!{}",
				},
			},
			j_bf_hologram = {
				name = "Roach Hologram",
				text = {
					"Every {C:attention}#5#{} {C:inactive}[#1#]{} {C:attention}non-{C:dark_edition}Negative{} {C:cry_code}Code{} cards used,",
					"create a {C:spectral}Soul{} and",
					"increase the requirement by {C:attention}#2#{}",
					"{C:red}Works twice{}, resetting when",
					"a {C:attention}Boss Blind{} is defeated",
					"{C:inactive}(Currently #4# use#<s>4# left)",
					" ",
					"{C:inactive}You deserve something for your efforts!{}",
				},
			},
			j_bf_abomihoney = {
				name = "Abomihoney",
				text = {
					"Scored cards have a {C:green}#1# in #2#{}",
					"chance to gain a {C:money}Gold Seal{}",
					"Retrigger played cards with {C:money}Gold Seals{}",
					"{C:inactive}(Does not overwrite existing Seals)",
				},
			},
			j_bf_mimic = {
				name = "Mimic Spider",
				text = {
					"When a non-{C:tarot}Death{} {C:attention}consumable{}",
					"is used, {C:green}#1# in #2#{} chance",
					"to create a {C:dark_edition}Negative{} {C:tarot}Death{}",
				},
			},
			j_bf_neolith = {
				name = "Professor Neolith",
				text = {
					"If played hand contains {C:attention}3{} unique suits,",
					"create {C:attention}#1#{} {C:dark_edition}Negative{} {C:spectral}Spectral{} card#<s>1#",
					" ",
					"{C:inactive}For SCIENCE!{}"
				},
			},
			j_bf_samira = {
				name = "Samira",
				text = {
					"{X:purple,C:white}X#1#{} Chips and Mult",
					"Earn {C:money}$#2#{} at end of round",
					"Retrigger the rightmost Joker",
					"{C:attention}#3#{} additional time#<s>3#",
					" ",
					"{C:inactive}I just need to get fans of my own! Um...{}",
					"{C:inactive}I'm hoping you'll be my first!"
				},
			},
			j_bf_jaune = {
				name = "Jaune",
				text = {
					"Retrigger all {C:attention}6{}s,",
					"{C:attention}Wild{} Cards, and",
					"{C:attention}enhanced{} cards",
					"#1# time#<s>1# per type",
					"{C:inactive}#2#{}",
					"{C:inactive}What do you want? I'm busy.{}"
				},
			},
			j_bf_chompybase = {
				name = "Chompy",
				text = {
					"{X:red,C:white}X#1#{} Mult",
					"Can be given a {C:spectral}Ribbon",
					"for an {C:attention}additional effect"
				},
			},
			j_bf_chompypretty = {
				name = "Chompy (Pretty Ribbon)",
				text = {
					"{X:red,C:white}X#1#{} Mult"
				},
			},
			j_bf_chompyvenom = {
				name = "Chompy (Venom Ribbon)",
				text = {
					"{X:red,C:white}X#1#{} Mult",
					"When a {C:tarot}Tarot{} card is used,",
					"inside a Boss Blind,",
					"{C:attention}X#2# Boss Blind{} requirement",
					"and disables {C:attention}Boss Blind{}"
				},
			},
			j_bf_chompyshocking = {
				name = "Chompy (Shocking Ribbon)",
				text = {
					"{X:red,C:white}X#1#{} Mult",
					"When a non-{C:dark_edition}Negative{} {C:planet}Planet{} card",
					"is used, {C:planet}level up{} your most played hand",
				},
			},
			j_bf_chompydrowsy = {
				name = "Chompy (Drowsy Ribbon)",
				text = {
					"{X:red,C:white}X#1#{} Mult",
					"When a {C:spectral}Spectral{} card is used,",
					"apply {C:white,X:mult}X#2#{} permanent Mult",
					"to all cards in deck",
				},
			},
			j_bf_chompyteam = {
				name = "Chompy (Team Ribbon)",
				text = {
					"{X:red,C:white}X#1#{} Mult",
					"When hand is played,",
					"earn {C:money}#2#%{} of your money"
				},
			},
        },
		Spectral = {
			c_bf_prettyribbon = {
				name = "Pretty Ribbon",
				text = {
					"Grants all copies of {C:attention}Chompy",
					"the {C:attention}Pretty Ribbon",
				},
			},
			c_bf_venomribbon = {
				name = "Venom Ribbon",
				text = {
					"Grants all copies of {C:attention}Chompy",
					"the {C:attention}Venom Ribbon",
				},
			},
			c_bf_shockingribbon = {
				name = "Shocking Ribbon",
				text = {
					"Grants all copies of {C:attention}Chompy",
					"the {C:attention}Shocking Ribbon",
				},
			},
			c_bf_drowsyribbon = {
				name = "Drowsy Ribbon",
				text = {
					"Grants all copies of {C:attention}Chompy",
					"the {C:attention}Drowsy Ribbon",
				},
			},
			c_bf_teamribbon = {
				name = "Team Ribbon",
				text = {
					"Grants all copies of {C:attention}Chompy",
					"the {C:attention}Team Ribbon",
				},
			},
		},
		Other = {
			bf_prettyribbon = {
				name = "Pretty Ribbon",
				text = {
					"An additional",
					"{X:red,C:white}X10{} Mult"
				},
			},
			bf_venomribbon = {
				name = "Venom Ribbon",
				text = {
					"When a {C:tarot}Tarot{} card is used,",
					"inside a Boss Blind,",
					"{C:attention}X0.25 Boss Blind{} requirement",
					"and disables {C:attention}Boss Blind{}"
				},
			},
			bf_shockingribbon = {
				name = "Shocking Ribbon",
				text = {
					"When a non-{C:dark_edition}Negative{} {C:planet}Planet{} card",
					"is used, {C:planet}level up{} your most played hand",
				},
			},
			bf_drowsyribbon = {
				name = "Drowsy Ribbon",
				text = {
					"When a {C:spectral}Spectral{} card is used,",
					"apply {C:white,X:mult}X0.5{} permanent Mult",
					"to all cards in deck",
				},
			},
			bf_teamribbon = {
				name = "Team Ribbon",
				text = {
					"When hand is played,",
					"earn {C:money}5%{} of your money"
				},
			},
		},
	},
	misc = {
		dictionary = {
			k_onebee = "(This card counts as a Bee Joker)",
			k_kinawithmaki = "You always run off without me!",
			k_kinawithoutmaki = "Oh no... Maki went off by himself? Again!?",
			k_soulmade = "Have a Soul!",
			k_deathmade = "+Death",
			k_venusmoney = "+$10",
			k_venustarot = "+Tarot",
			k_venusspectral = "+Spectral",
			k_venussoul = "+Soul",
			k_venusgateway = "+Gateway",
			k_samira = "T-thank you!",
		},
		v_dictionary = {
			k_multibees = "(This card counts as #1# Bee Jokers)",
			k_carminamoney = "+$#1#",
			k_carminahands = "+#1# Hand",
			k_carminadiscardsyes = "-#1# Discard",
			k_carminadiscardsno = "Out of Discards",
		},
    },
}