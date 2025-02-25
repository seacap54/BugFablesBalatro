--JOKER ATLASES
local atlases = {
	'vi',
	'kabbu',
	'leif',
	'hoaxe',
	'elk',
	'carmina',
	'asto',
	'venus',
	'elizant2',
	'elizant1',
	'etq',
	'scarlet',
	'bianca',
	'vanessa',
	'janet',
	'layra'
}

for k, v in pairs(atlases) do
	SMODS.Atlas {
		key = 'bf' .. v,
		px = 71,
		py = 95,
		path = 'j_bf_' .. v .. '.png'
	}
end

SMODS.Atlas {
	key = 'bfsapling',
	px = 71,
	py = 95,
	path = 'c_bf_sapling.png'
}

function Card:speak(text, col)
	if type(text) == 'table' then text = text[math.random(#text)] end
	card_eval_status_text(self, 'extra', nil, nil, nil, {message = text, colour = col or G.C.FILTER})
end

function lvlupallhands(amnt, card, fast)
	if not amnt then return end
	if amnt == 0 then return end
	if (G.SETTINGS.FASTFORWARD or 0) > 1 then fast = true end
	if fast then
		Q(function() if card then
			card:juice_up(0.8, 0.5)
		end return true end)
		jl.h(localize('k_all_hands'), (amnt > 0 and '+' or '-'), (amnt > 0 and '+' or '-'), (amnt > 0 and '+' or '-') .. number_format(math.abs(amnt)), true)
	else
		jl.th('all')
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
			play_sound('tarot1')
			if card then card:juice_up(0.8, 0.5) end
		return true end }))
		jl.h(localize('k_all_hands'), (amnt > 0 and '+' or '-'), (amnt > 0 and '+' or '-'), (amnt > 0 and '+' or '-') .. number_format(math.abs(amnt)), true)
		delay(1.3)
	end
	for k, v in pairs(G.GAME.hands) do
		level_up_hand(card, k, true, amnt)
	end
	jl.ch()
end

SMODS.Rarity {
	key = 'everlasting',
	loc_txt = {
		name = 'Everlasting'
	},
	badge_colour = HEX('a8d022')
}

SMODS.Joker{
	key = "vi",
	loc_txt = {
		name = "Vi",
		text = {
			"{C:attention}6{}s give {X:dark_edition,C:white} ^#1# {} Mult when scored",
            "Increase value by {X:dark_edition,C:white}^#2#{} when a {C:attention}6{} scores",
			" ",
			"{C:inactive}I'm worth like, four bees okay?!{}",
		}
	},
	atlas = "bfvi",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	rarity = 'cry_exotic',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	config = { 
		big_num_scaler = true,
		extra = {
			Emult = 1,
			Emult_change = 0.06,
		}
	},
	calculate = function(self,card,context)
		if context.individual then
			if context.cardarea == G.play then
				if context.other_card:get_id() == 6 then
					card.ability.extra.Emult = card.ability.extra.Emult + card.ability.extra.Emult_change
					return {
						e_mult = card.ability.extra.Emult,
						colour = G.C.DARK_EDITION,
						card = card
					}, true
				end
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.Emult, center.ability.extra.Emult_change}}
	end,
}

SMODS.Joker{
	key = "kabbu",
	loc_txt = {
		name = "Kabbu",
		text = {
			"{X:dark_edition,C:white}^#1#{} Mult against {C:attention}Boss Blinds{}",
            "Earn {C:money}$#2#{} when played hand triggers a {C:attention}Boss Blind{}",
			" ",
			"{C:inactive}You shouldn't underestimate me.{}",
		}
	},
	atlas = "bfkabbu",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	rarity = 'cry_exotic',
	immutable = true,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	config = { 
		extra = {
			Emult = 3,
			money = 40,
		}
	},
	calculate = function(self,card,context)
		if context.debuffed_hand and context.cardarea == G.play then
            return {
				dollars = card.ability.extra.money,
            }
			end
		if context.joker_main and G.GAME.blind.boss and not context.before and not context.after then
			return {
				message = localize{type='variable',key='a_powmult',vars={number_format(card.ability.extra.Emult)}},
				Emult_mod = card.ability.extra.Emult,
				colour = G.C.DARK_EDITION,
			}
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.Emult, center.ability.extra.money}}
	end,
}

SMODS.Joker{
	key = "leif",
	loc_txt = {
		name = "Leif",
		text = {
			"{C:attention}Glass cards{} give an additional",
            "{X:dark_edition,C:white}^#1#{} Mult when scored",
			"This number increases by {X:dark_edition,C:white}^#2#{}",
			"when a {C:attention}Glass card{} breaks",
			" ",
			"{C:inactive}Sup.{}",
		}
	},
	atlas = "bfleif",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	rarity = 'cry_exotic',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	config = { 
		big_num_scaler = true,
		extra = {
			Emult = 2,
			Emult_change = 0.5,
		}
	},
	calculate = function(self,card,context)
		if context.individual then
			if context.cardarea == G.play then
				if context.other_card and context.other_card.ability.name == 'Glass Card' then
					return {
						e_mult = card.ability.extra.Emult,
						card = card
					}, true
				end
			end
		end
		if context.remove_playing_cards and not context.blueprint then
			for k, v in ipairs(context.removed) do
				if v.shattered then
					card.ability.extra.Emult = card.ability.extra.Emult + card.ability.extra.Emult_change
				end
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.Emult, center.ability.extra.Emult_change}}
	end,
}

SMODS.Joker{
	key = "hoaxe",
	loc_txt = {
		name = "Hoaxe",
		text = {
			"When a {C:attention}King{} is scored,",
            "multiply {C:attention}Blind size{} by {C:attention}x#1#{}",
			" ",
			"{C:inactive}For when I consume the sapling...{}",
			"{C:inactive}You will have no choice but to squirm in fear{}",
			"{C:inactive}and surrender to your King!{}",
		}
	},
	atlas = "bfhoaxe",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	immutable = true,
	config = { 
		extra = {
			blindmult = 0.85,
		}
	},
	calculate = function(self,card,context)
		if context.individual then
			if context.cardarea == G.play then
				if context.other_card:get_id() == 13 then
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips * card.ability.extra.blindmult)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

                    local chips_UI = G.hand_text_area.blind_chips
                    G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                    G.HUD_blind:recalculate() 
                    chips_UI:juice_up()

                    if not silent then play_sound('chips2') end
					return true end }))
				end
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.blindmult}}
	end,
}

SMODS.Consumable{
        key = 'sapling',
        set = 'Tarot',
        pos = {x = 0, y = 0},
        cost = 4,
        loc_txt = {
            name = "Wilted Sapling",
            text = {
                "{C:inactive}Someone wants this very badly...{}"
            }
        },
		atlas = "bfsapling",
		unlocked = true,
		discovered = true,
        loc_vars = function(self, info_queue, card)
            return {vars = {}}
        end,
        can_use = function(self, card, area, copier)
			local joker = G.jokers.highlighted[1]
			if joker then
				if joker.config.center_key == "j_bf_hoaxe" or joker.config.center_key == "j_bf_elizant1" then
					return true
				end
			end
			return false
        end,
        use = function(self, card)
			local joker = G.jokers.highlighted[1]
			if joker.config.center_key == "j_bf_hoaxe"  then
				local elk = create_card('Joker',G.jokers, nil, nil, nil, nil, 'j_bf_elk')
				joker:start_dissolve()
				elk:add_to_deck()
				G.jokers:emplace(elk)
			elseif joker.config.center_key == "j_bf_elizant1" then
				local etq = create_card('Joker',G.jokers, nil, nil, nil, nil, 'j_bf_etq')
				joker:start_dissolve()
				etq:add_to_deck()
				G.jokers:emplace(etq)
			end
        end,
}

SMODS.Joker{
	key = "elk",
	loc_txt = {
		name = "The Everlasting King",
		text = {
			"When a {C:attention}King{} is scored,",
            "multiply {C:attention}Blind size{} by {C:attention}x#1#{}",
			"When hand is played, gain {C:attention}x#2#{} {C:red}Discards{}",
			" ",
			"{C:inactive}...Yes...YES!{}",
			"{C:inactive}This power will suit me just fine!{}",
		}
	},
	atlas = "bfelk",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	rarity = 'bf_everlasting',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	immutable = true,
	no_doe = true,
	config = { 
		extra = {
			blindmult = 0.75,
			discardmult = 3,
		}
	},
	calculate = function(self,card,context)
		if context.individual then
			if context.cardarea == G.play then
				if context.other_card:get_id() == 13 then
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips * card.ability.extra.blindmult)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

                    local chips_UI = G.hand_text_area.blind_chips
                    G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                    G.HUD_blind:recalculate() 
                    chips_UI:juice_up()

                    if not silent then play_sound('chips2') end
					return true end }))
				end
			end
		end
		if context.joker_main then
			card:speak('x3 Discards', G.C.RED)
			ease_discard(G.GAME.current_round.discards_left * 2)
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.blindmult, center.ability.extra.discardmult}}
	end,
}

SMODS.Joker{
	key = "carmina",
	loc_txt = {
		name = "Carmina",
		text = {
			"Spin a {C:attention}roulette{} when hand is played",
			" ",
			"{C:inactive}I brought you into the scene...{}",
			"{C:inactive}But I\'ll crush you nonetheless!{}",
		}
	},
	atlas = "bfcarmina",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	immutable = true,
	config = { 
		extra = {
			posmult = 5,
			negmult = 0.5,
			handboost = 1,
			discardpen = 1,
			moneyboost = 20,
			chipspen = -150,
		}
	},
	calculate = function(self,card,context)
		if not context.blueprint then
			if context.joker_main then
				local roll = pseudorandom("carminaroulette", 1, 6)
				if roll == 1 then
					return {
						card:speak("X5 Mult", G.C.MULT),
						Xmult_mod = card.ability.extra.posmult,
						card = card,
					}
				elseif roll == 2 then
					return {
						card:speak("X0.5 Mult", G.C.MULT),
						Xmult_mod = card.ability.extra.negmult,
						card = card,
					}
				elseif roll == 3 then
					return {
						card:speak("+1 Hand", G.C.BLUE),
						ease_hands_played(1),
						card = card,
					}
				elseif roll == 4 then
					if(G.GAME.current_round.discards_left > 0) then
						return {
							card:speak("-1 Discard", G.C.RED),
							ease_discard(-1),
							card = card,
						}
					else
						return {
							card:speak("Out of Discards", G.C.RED),
							card = card,
						}
					end
				elseif roll == 5 then
					return {
						card:speak("+$20", G.C.MONEY),
						ease_dollars(20),
						card = card,
					}
				elseif roll == 6 then
					return {
						card:speak("-150 Chips", G.C.CHIPS),
						chip_mod = card.ability.extra.chipspen,
						card = card,
					}
				end
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.posmult, center.ability.extra.negmult, center.ability.extra.handboost, center.ability.extra.discardpen, center.ability.extra.moneyboost, center.ability.extra.chipspen}}
	end,
}

SMODS.Joker{
	key = "asto",
	loc_txt = {
		name = "Astotheles",
		text = {
			"When selecting a {C:attention}Blind{},",
            "destroy a random {C:attention}Consumable{}",
			"and {C:planet}level up{} {C:attention}all hands #1# times{}",
			" ",
			"{C:inactive}You shall have an honorable fight.{}",
			"{C:inactive}Do your worst!{}",
		}
	},
	atlas = "bfasto",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	config = { 
		extra = {
			levels = 4,
		}
	},
	calculate = function(self,card,context)
		if context.setting_blind then
			local destructable_cons = {}
			local quota = 1
			for i = 1, #G.consumeables.cards do
				if
					not G.consumeables.cards[i].getting_sliced
					and not G.consumeables.cards[i].ability.eternal
				then
					destructable_cons[#destructable_cons + 1] = G.consumeables.cards[i]
				end
			end
			local card_to_destroy = #destructable_cons > 0
					and pseudorandom_element(destructable_cons, pseudoseed("astotheles"))
				or nil

			if card_to_destroy then
				if Incantation then
					quota = card_to_destroy:getEvalQty()
				end
				local incominglevels = card.ability.extra.levels * quota
				card_to_destroy.getting_sliced = true
				lvlupallhands(incominglevels, card)
				G.E_MANAGER:add_event(Event({
					func = function()
						card_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
						return true
					end,
				}))
				return nil, true
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.levels}}
	end,
}

SMODS.Joker{
	key = "venus",
	loc_txt = {
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
		}
	},
	atlas = "bfvenus",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	rarity = "cry_exotic",
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = false,
	immutable = true,
	config = { 
		extra = {
			slotsboost = 8,
			moneyboost = 10,
			moneyodds = 2,
			tarotodds = 2,
			spectralodds = 3,
			soulodds = 20,
			gatewayodds = 100,
		}
	},
	calculate = function(self,card,context)
		if not context.blueprint then
			if context.individual and context.cardarea == G.play then
				if context.other_card and context.other_card.ability.effect == 'Mult Card' then
					print('mult')
					if jl.chance('venusmoney', card.ability.extra.moneyodds, false) then
						card:speak('+$10', G.C.MONEY)
						ease_dollars(card.ability.extra.moneyboost)
						card:juice_up(0.3, 0.5)
					end
					if jl.chance('venustarot', card.ability.extra.tarotodds, false) then
						card:speak('+Tarot', G.C.SECONDARY_SET.Tarot)
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
							local card2 = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'venustarot')
							card2:add_to_deck()
							G.consumeables:emplace(card2)
							card:juice_up(0.3, 0.5)
							return true
						end }))
					end
					if jl.chance('venusspectral', card.ability.extra.spectralodds, false) then
						card:speak('+Spectral', G.C.SECONDARY_SET.Spectral)
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
							local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'venusspectral')
							card2:add_to_deck()
							G.consumeables:emplace(card2)
							card:juice_up(0.3, 0.5)
							return true
						end }))
					end
					if jl.chance('venussoul', card.ability.extra.soulodds, false) then
						card:speak('+Soul', G.C.CRY_TWILIGHT)
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
							local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_soul', 'venussoul')
							card2:add_to_deck()
							G.consumeables:emplace(card2)
							card:juice_up(0.3, 0.5)
							return true
						end }))
					end
					if jl.chance('venusgateway', card.ability.extra.gatewayodds, false) then
						card:speak('+Gateway', G.C.CRY_ASCENDANT)
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
							local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_cry_gateway', 'venusgateway')
							card2:add_to_deck()
							G.consumeables:emplace(card2)
							card:juice_up(0.3, 0.5)
							return true
						end }))
					end
					return nil, true
				end
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slotsboost
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slotsboost
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.slotsboost, "" .. (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.moneyboost, center.ability.extra.moneyodds, center.ability.extra.tarotodds, center.ability.extra.spectralodds, center.ability.extra.soulodds, center.ability.extra.gatewayodds}}
	end,
}

SMODS.Joker{
	key = "elizant2",
	loc_txt = {
		name = "Queen Elizant II",
		text = {
			"{C:attention}Each card held in hand{} gives {X:mult,C:white}X#1#{} Mult",
			" ",
			"{C:inactive}Time is precious. Let us not waste it.{}",
		}
	},
	atlas = "bfelizant2",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	config = { 
		extra = {
			Xmult = 4,
		}
	},
	calculate = function(self,card,context)
		if context.individual and not context.end_of_round then
			if context.cardarea == G.hand then
				if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = card,
                    }
                else
                    return {
                        x_mult = card.ability.extra.Xmult,
                        card = card
                    }
                end
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.Xmult}}
	end,
}

SMODS.Joker{
	key = "elizant1",
	loc_txt = {
		name = "Queen Elizant I",
		text = {
			" ",
			"{C:inactive}(She's taking a hard-earned rest.){}",
			" "
		}
	},
	atlas = "bfelizant1",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 1,
	rarity = 1,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = false,
	immutable = true,
	config = { 
		extra = {
		}
	},
	loc_vars = function(self,info_queue,center)
		return {vars = {}}
	end,
}

SMODS.Joker{
	key = "etq",
	loc_txt = {
		name = "The Eternal Queen",
		text = {
			"{C:attention}Queens{} of {C:hearts}Hearts{} give {X:dark_edition,C:white}^#1#{} Mult when scored",
			"{C:attention}Other Queens{} give {X:dark_edition,C:white}^#2#{} Mult when scored",
			"{C:attention}All other cards{} give {X:dark_edition,C:white}^#3#{} Mult when scored",
			" ",
			"{C:inactive}(She has nothing to say.){}"
		}
	},
	atlas = "bfetq",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	rarity = 'bf_everlasting',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	immutable = true,
	no_doe = true,
	config = { 
		extra = {
			heartqueenmult = 100,
			otherqueenmult = 10,
			othermult = 2,
		}
	},
	calculate = function(self,card,context)
		if context.individual then
			if context.cardarea == G.play then
				if context.other_card:get_id() == 12 and context.other_card:is_suit('Hearts') then
					return {
						e_mult = card.ability.extra.heartqueenmult,
						card = card
					}
				elseif context.other_card:get_id() == 12 and not context.other_card:is_suit('Hearts') then
					return {
						e_mult = card.ability.extra.otherqueenmult,
						card = card
					}
				else
					return {
						e_mult = card.ability.extra.othermult,
						card = card
					}
				end
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.heartqueenmult, center.ability.extra.otherqueenmult, center.ability.extra.othermult}}
	end,
}

SMODS.Joker{
	key = "scarlet",
	loc_txt = {
		name = "Monsieur Scarlet",
		text = {
			"When hand is played,",
			"fixed {C:green}25% chance{} to",
			"gain {C:attention}#1# hands{}",
			" ",
			"{C:inactive}Just...{} {C:inactive,E:1}relax{}{C:inactive}...~{}",
		}
	},
	atlas = "bfscarlet",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	config = { 
		extra = {
			hands = 2,
			chance = 4,
		}
	},
	calculate = function(self,card,context)
		if not context.blueprint then
			if context.joker_main then
				if jl.chance('scarlethands', card.ability.extra.chance, true) then
					card:speak('+'..card.ability.extra.hands..' Hands', G.C.BLUE)
					ease_hands_played(card.ability.extra.hands)
					card = card
				end
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.hands, center.ability.extra.chance}}
	end,
}

SMODS.Joker{
	key = "bianca",
	loc_txt = {
		name = "Queen Bianca",
		text = {
			"If played hand contains a {C:attention}Straight{},",
			"retrigger all Jokers {C:attention}once per card scored{}",
			" ",
			"{C:inactive}We all have our wonderful place in this world.{}",
		}
	},
	atlas = "bfbianca",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	immutable = true,
	config = { 
		extra = {
			isstraight = false,
			cardcount = 0,
		} 
	},
	calculate = function(self,card,context)
		if not card.ability.extra.cardcount then
			card.ability.extra.cardcount = 0
		end
		if context.before and not context.blueprint and not context.retrigger_joker_check and not context.retrigger_joker then
			if next(context.poker_hands['Straight']) then
				card.ability.extra.isstraight = true
				for i, v in pairs (context.scoring_hand) do
					card.ability.extra.cardcount = card.ability.extra.cardcount + 1
				end
			else
				card.ability.extra.isstraight = false
				card.ability.extra.cardcount = 0
			end
		end
		if card.ability.extra.isstraight and context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
			if card.ability.extra.cardcount > 0 then
				return {
					message = localize("k_again_ex"),
					repetitions = card.ability.extra.cardcount,
					card = card,
				}
			end
		end
		if context.after and not context.blueprint and not context.retrigger_joker_check and not context.retrigger_joker then
			card.ability.extra.cardcount = 0
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.isstraight, center.ability.extra.cardcount}}
	end,
}

local edref = ease_dollars
function ease_dollars(mod, instant)
	if mod == to_big(0) then return end
	if #SMODS.find_card('j_bf_vanessa') > 0 and to_big(mod) > to_big(0) then
		mod = mod * (3 ^ #SMODS.find_card('j_bf_vanessa'))
	end
	return edref(mod, instant)
end

SMODS.Joker{
	key = "vanessa",
	loc_txt = {
		name = "Queen Vanessa II",
		text = {
			"All {C:money}money{} earned is {C:attention}tripled{}",
			" ",
			"{C:inactive}Please, allow me to accompany you.{}",
		}
	},
	atlas = "bfvanessa",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = false,
	immutable = true,
	config = { 
		extra = {
		}
	},
	loc_vars = function(self,info_queue,center)
		return {vars = {}}
	end,
}

SMODS.Joker{
	key = "janet",
	loc_txt = {
		name = "Janet",
		text = {
			"All {C:attention}non-enhanced cards{} give",
			"{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult when scored",
			" ",
			"{C:inactive}I'll do my best, so you do too.{}",
		}
	},
	atlas = "bfjanet",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 4,
	rarity = 1,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	config = { 
		extra = {
			chipsboost = 30,
			multboost = 4,
		}
	},
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card and context.other_card.ability.effect == "Base" then
				return {
					chips = card.ability.extra.chipsboost,
					mult = card.ability.extra.multboost,
					card = card
				}
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.chipsboost, center.ability.extra.multboost}}
	end,
}

SMODS.Joker{
	key = "layra",
	loc_txt = {
		name = "Queen Layra II",
		text = {
			"Gives {C:attention}+1 Joker slot{} per",
			"card that is added to the deck",
			"{C:inactive}#2#{}",
			" ",
			"{C:inactive}I hope you can provide a good show!{}",
		}
	},
	atlas = "bflayra",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	immutable = true,
	config = { 
		extra = {
			slots = 0,
		}
	},
	calculate = function(self,card,context)
		if context.playing_card_added and not context.blueprint then
			card.ability.extra.slots = card.ability.extra.slots + #context.cards
			G.jokers.config.card_limit = G.jokers.config.card_limit + #context.cards
			if #context.cards == 1 then
				card:speak('+'..#context.cards..' Joker Slot', G.C.DARK_EDITION)
			else
				card:speak('+'..#context.cards..' Joker Slots', G.C.DARK_EDITION)
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.slots,center.ability.extra.slots == 1 and "(Currently +"..center.ability.extra.slots.." Joker slot)" or "(Currently +"..center.ability.extra.slots.." Joker slots)"}}
	end,
}