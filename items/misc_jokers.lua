SMODS.Atlas {
	key = 'bfhoaxe',
	px = 71,
	py = 95,
	path = 'j_bf_hoaxe.png'
}

SMODS.Joker{
	key = "hoaxe",
	atlas = "bfhoaxe",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	order = 554,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	demicoloncompat = true,
	immutable = true,
	config = { 
		extra = {
			blindmult = 0.85,
		}
	},
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 13 then
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * lenient_bignum(card.ability.extra.blindmult))
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

                local chips_UI = G.hand_text_area.blind_chips
                G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                 G.HUD_blind:recalculate() 
                chips_UI:juice_up()

                if not silent then play_sound('chips2') end
				return true end }))
			end
		end
		if context.forcetrigger then
			G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * lenient_bignum(card.ability.extra.blindmult))
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

                local chips_UI = G.hand_text_area.blind_chips
                G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                 G.HUD_blind:recalculate() 
                chips_UI:juice_up()

                if not silent then play_sound('chips2') end
			return true end }))
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.blindmult}}
	end,
}


SMODS.Atlas {
	key = 'bfcarmina',
	px = 71,
	py = 95,
	path = 'j_bf_carmina.png'
}

SMODS.Joker{
	key = "carmina",
	atlas = "bfcarmina",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	order = 556,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
	immutable = true,
	config = { 
		extra = {
			posmult = 5,
			negmult = 0.5,
			handboost = 1,
			discardpen = 1,
			moneyboost = 20,
			chipspen = 150,
		}
	},
	calculate = function(self,card,context)
		if not context.blueprint and not context.retrigger_joker_check and not context.retrigger_joker then
			if context.joker_main or context.forcetrigger then
				local roll = pseudorandom("carminaroulette", 1, 6)
				if roll == 1 then
					return {
						card:speak(localize({type='variable',key='a_xmult',vars={card.ability.extra.posmult}}), G.C.RED),
						Xmult_mod = card.ability.extra.posmult,
						card = card,
					}
				elseif roll == 2 then
					return {
						card:speak(localize({type='variable',key='a_xmult',vars={card.ability.extra.negmult}}), G.C.RED),
						Xmult_mod = card.ability.extra.negmult,
						card = card,
					}
				elseif roll == 3 then
					return {
						card:speak(localize({type='variable',key='k_carminahands',vars={card.ability.extra.handboost}}), G.C.BLUE),
						ease_hands_played(1),
						card = card,
					}
				elseif roll == 4 then
					if(G.GAME.current_round.discards_left > 0) then
						return {
							card:speak(localize({type='variable',key='k_carminadiscardsyes',vars={card.ability.extra.discardpen}}), G.C.RED),
							ease_discard(-1),
							card = card,
						}
					else
						return {
							card:speak(localize("k_carminadiscardsno"), G.C.RED),
							card = card,
						}
					end
				elseif roll == 5 then
					return {
						card:speak(localize({type='variable',key='k_carminamoney',vars={card.ability.extra.moneyboost}}), G.C.MONEY),
						ease_dollars(20),
						card = card,
					}
				elseif roll == 6 then
					return {
						card:speak(localize({type='variable',key='a_chips_minus',vars={card.ability.extra.chipspen}}), G.C.CHIPS),
						chip_mod = -card.ability.extra.chipspen,
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


SMODS.Atlas {
	key = 'bfasto',
	px = 71,
	py = 95,
	path = 'j_bf_asto.png'
}

SMODS.Joker{
	key = "asto",
	atlas = "bfasto",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	order = 557,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
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
				elseif Overflow then
					quota = card_to_destroy:getQty()
				end
				local incominglevels = math.floor(card.ability.extra.levels * quota)
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
		if context.forcetrigger then
			local incominglevels = math.floor(card.ability.extra.levels)
			lvlupallhands(incominglevels, card)
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.levels}}
	end,
}


SMODS.Atlas {
	key = 'bfelizant2',
	px = 71,
	py = 95,
	path = 'j_bf_elizant2.png'
}

SMODS.Joker{
	key = "elizant2",
	atlas = "bfelizant2",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	order = 559,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
	config = { 
		extra = {
			Xmult = 2,
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
                        x_mult = lenient_bignum(card.ability.extra.Xmult),
                        card = card
                    }
                end
			end
		end
		if context.forcetrigger then
            return {
                x_mult = lenient_bignum(card.ability.extra.Xmult),
                card = card
            }
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.Xmult}}
	end,
}


SMODS.Atlas {
	key = 'bfelizant1',
	px = 71,
	py = 95,
	path = 'j_bf_elizant1.png'
}

SMODS.Joker{
	key = "elizant1",
	atlas = "bfelizant1",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 1,
	order = 560,
	rarity = 1,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = false,
	immutable = true,
	config = { 
		extra = {
		}
	},
	loc_vars = function(self,info_queue,center)
		return {vars = {}}
	end,
}


SMODS.Atlas {
	key = 'bfscarlet',
	px = 71,
	py = 95,
	path = 'j_bf_scarlet.png'
}

SMODS.Joker{
	key = "scarlet",
	atlas = "bfscarlet",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	order = 562,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
	config = { 
		extra = {
			hands = 2,
		}
	},
	calculate = function(self,card,context)
		if not context.blueprint then
			if context.joker_main then
				if pseudorandom("scarlethands") < (1 / 4) then
					card:speak('+'..card.ability.extra.hands..' Hands', G.C.BLUE)
					ease_hands_played(lenient_bignum(card.ability.extra.hands))
					card = card
				end
			end
		end
		if context.forcetrigger then
			card:speak('+'..card.ability.extra.hands..' Hands', G.C.BLUE)
			ease_hands_played(lenient_bignum(card.ability.extra.hands))
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.hands}}
	end,
}


SMODS.Atlas {
	key = 'bfbianca',
	px = 71,
	py = 95,
	path = 'j_bf_bianca.png'
}

SMODS.Joker{
	key = "bianca",
	atlas = "bfbianca",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	pools = {["Bee"] = true},
	cost = 20,
	order = 563,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = false,
	immutable = true,
	config = { 
		extra = {
			isstraight = false,
			cardcount = 0,
			bee = true,
			bold = 5,
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
		return {vars = {center.ability.extra.isstraight, center.ability.extra.cardcount, #SMODS.find_mod("Beelatro") > 0 and localize("k_onebee") or "", center.ability.extra.bee, center.ability.extra.bold}}
	end,
}


SMODS.Atlas {
	key = 'bfvanessa',
	px = 71,
	py = 95,
	path = 'j_bf_vanessa.png'
}

SMODS.Joker{
	key = "vanessa",
	atlas = "bfvanessa",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	order = 564,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = false,
	immutable = true,
	config = { 
		extra = {
		}
	},
	loc_vars = function(self,info_queue,center)
		return {vars = {}}
	end,
}


SMODS.Atlas {
	key = 'bfjanet',
	px = 71,
	py = 95,
	path = 'j_bf_janet.png'
}

SMODS.Joker{
	key = "janet",
	atlas = "bfjanet",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 4,
	order = 565,
	rarity = 1,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
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
					chips = lenient_bignum(card.ability.extra.chipsboost),
					mult = lenient_bignum(card.ability.extra.multboost),
					card = card
				}
			end
		end
		if context.forcetrigger then
			return {
				chips = lenient_bignum(card.ability.extra.chipsboost),
				mult = lenient_bignum(card.ability.extra.multboost),
				card = card
			}
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.chipsboost, center.ability.extra.multboost}}
	end,
}


SMODS.Atlas {
	key = 'bflayra',
	px = 71,
	py = 95,
	path = 'j_bf_layra.png'
}

SMODS.Joker{
	key = "layra",
	atlas = "bflayra",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	order = 566,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = false,
	immutable = true,
	config = { 
		extra = {
			slots = 0,
		}
	},
	calculate = function(self,card,context)
		if context.playing_card_added and not context.blueprint and not context.retrigger_joker_check and not context.retrigger_joker then
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


SMODS.Atlas {
	key = 'bfhector',
	px = 71,
	py = 95,
	path = 'j_bf_hector.png'
}

SMODS.Joker{
	key = "hector",
	atlas = "bfhector",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	order = 567,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
	config = { 
		extra = {
			percardmult = 1.5,
		}
	},
	loc_vars = function(self,info_queue,center)
		return {vars = {G.GAME.starting_deck_size and G.GAME.starting_deck_size or 52, center.ability.extra.percardmult, center.ability.extra.percardmult ^ math.max((G.GAME.starting_deck_size - (G.playing_cards and #G.playing_cards or G.GAME.starting_deck_size)), 0)}}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			return {
				xmult = lenient_bignum(card.ability.extra.percardmult) ^ (math.max(G.GAME.starting_deck_size - #G.playing_cards, 0)),
				card = card
			}
		end
		if context.forcetrigger then
			return {
				xmult = lenient_bignum(card.ability.extra.percardmult),
				card = card
			}
		end
	end,
}


SMODS.Atlas {
	key = 'bfkali',
	px = 71,
	py = 95,
	path = 'j_bf_kali.png'
}

SMODS.Joker{
	key = "kali",
	atlas = "bfkali",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 8,
	order = 568,
	rarity = 3,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
	immutable = true,
	config = { 
		extra = {
			activated = false,
			mult = 1,
		}
	},
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.activated and "active" or "inactive", center.ability.extra.mult or 1}}
	end,
	calculate = function(self,card,context)
		if context.joker_main and G.GAME.blind.boss and card.ability.extra.activated then
			return {
				xmult = lenient_bignum(card.ability.extra.mult),
				card = card
			}
		end
		if context.forcetrigger then
			return {
				xmult = lenient_bignum(card.ability.extra.mult),
				card = card
			}
		end
	end,
}


SMODS.Atlas {
	key = 'bfmothiva',
	px = 71,
	py = 95,
	path = 'j_bf_mothiva.png'
}

SMODS.Joker{
	key = "mothiva",
	atlas = "bfmothiva",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	order = 569,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = false,
	immutable = true,
	calculate = function(self,card,context)
		if context.before and not context.blueprint and not context.retrigger_joker_check and not context.retrigger_joker then
			if #context.scoring_hand >= 4 then
				for k, v in pairs(context.scoring_hand) do
					pseudoStrength(v)
				end
			end
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if #SMODS.find_card("j_bf_zasp") > 0 then
			for k, v in pairs(SMODS.find_card("j_bf_zasp")) do
				if from_debuff then
					v.ability.extra.mult = lenient_bignum(v.ability.extra.mult) * 2
				else
					v.ability.extra.mult = lenient_bignum(v.ability.extra.mult) * 4
				end
			end
		end
	end,
}


SMODS.Atlas {
	key = 'bfzasp',
	px = 71,
	py = 95,
	path = 'j_bf_zasp.png'
}

SMODS.Joker{
	key = "zasp",
	atlas = "bfzasp",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	order = 570,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = { 
		extra = {
			mult = 11,
		}
	},
	loc_vars = function(self,info_queue,center)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_bf_mothiva
		return {vars = {center.ability.extra.mult}}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 14 then
				return {
					xmult = lenient_bignum(card.ability.extra.mult),
					card = card
				}
			end
		end
		if context.forcetrigger then
			return {
				xmult = lenient_bignum(card.ability.extra.mult),
				card = card
			}
		end
	end,
}


SMODS.Atlas {
	key = 'bfcharmy',
	px = 71,
	py = 95,
	path = 'j_bf_charmy.png'
}

local charmyconsums = {
	"Planet",
	"Tarot",
	"Spectral"
}

SMODS.Joker{
	key = "charmy",
	atlas = "bfcharmy",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 8,
	order = 571,
	rarity = 2,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
	immutable = true,
	config = { 
		extra = {
		}
	},
	loc_vars = function(self,info_queue,center)
		return {vars = { }}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			if pseudorandom("charmychance") < (1 / 2) then
				card:speak("Now you're all charmed up.", G.C.BLUE)
				local roll = charmyconsums[pseudorandom("charmy", 1, #charmyconsums)]
				if roll == "Planet" then
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
						local card2 = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'charmyplanet')
						card2:add_to_deck()
						G.consumeables:emplace(card2)
						card:juice_up(0.3, 0.5)
						return true
					end }))
				elseif roll == "Tarot" then
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
						local card2 = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'charmytarot')
						card2:add_to_deck()
						G.consumeables:emplace(card2)
						card:juice_up(0.3, 0.5)
						return true
					end }))
				elseif roll == "Spectral" then
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
						local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'charmyspectral')
						card2:add_to_deck()
						G.consumeables:emplace(card2)
						card:juice_up(0.3, 0.5)
						return true
					end }))
				end
			end
		end
		if context.forcetrigger then
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
				local card2 = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'charmyplanet')
				card2:add_to_deck()
				G.consumeables:emplace(card2)
				card:juice_up(0.3, 0.5)
				return true
			end }))
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
				local card2 = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'charmytarot')
				card2:add_to_deck()
				G.consumeables:emplace(card2)
				card:juice_up(0.3, 0.5)
				return true
			end }))
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
				local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'charmyspectral')
				card2:add_to_deck()
				G.consumeables:emplace(card2)
				card:juice_up(0.3, 0.5)
				return true
			end }))
		end
	end,
}


SMODS.Atlas {
	key = 'bfabomihoney',
	px = 71,
	py = 95,
	path = 'j_bf_abomihoney.png'
}

SMODS.Joker{
	key = "abomihoney",
	atlas = "bfabomihoney",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 8,
	order = 581,
	rarity = 3,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = false,
	config = { 
		extra = {
			odds = 2,
		}
	},
	calculate = function(self,card,context)
		if context.before then
			for k, v in ipairs(context.scoring_hand) do
				if SMODS.pseudorandom_probability(card, 'abomihoney', (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds, 'abomihoneyseal') then
					if not v.seal then
						v:set_seal("Gold")
						v:juice_up()
					end
				end
			end
		end
		if context.repetition and context.cardarea == G.play then
			if context.other_card.seal == "Gold" then
				return {
					message = localize("k_again_ex"),
					repetitions = 1,
					card = card,
				}
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		local num, denom = SMODS.get_probability_vars(center, (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, "abomihoney")
		return {vars = {num, denom}}
	end,
}


SMODS.Atlas {
	key = 'bfneolith',
	px = 71,
	py = 95,
	path = 'j_bf_neolith.png'
}

SMODS.Joker{
	key = "neolith",
	atlas = "bfneolith",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 8,
	order = 583,
	rarity = 2,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
	config = { 
		extra = {
			spectrals = 1,
		}
	},
	calculate = function(self,card,context)
		if context.before then
			if get_suits_count(context.full_hand) >= 3 then
				for i = 1, card.ability.extra.spectrals do
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
						local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'neolith')
						card2:set_edition({negative = true}, true)
						card2:add_to_deck()
						G.consumeables:emplace(card2)
						card:juice_up(0.3, 0.5)
						return true
					end }))
				end
			end
		end
		if context.forcetrigger then
			for i = 1, card.ability.extra.spectrals do
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'neolith')
					card2:set_edition({negative = true}, true)
					card2:add_to_deck()
					G.consumeables:emplace(card2)
					card:juice_up(0.3, 0.5)
					return true
				end }))
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.spectrals}}
	end,
}


SMODS.Atlas {
	key = 'bfchompy',
	px = 71,
	py = 95,
	path = 'j_bf_chompy.png'
}

SMODS.Joker{
	key = "chompybase",
	atlas = "bfchompy",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	order = 584,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = { 
		extra = {
			xmult = 10,
		}
	},
	calculate = function(self,card,context)
		if context.joker_main or context.blueprint or context.forcetrigger then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.xmult}}
	end,
}

SMODS.Joker{
	key = "chompypretty",
	atlas = "bfchompy",
	pos = { x = 0, y = 1 },
	soul_pos = { x = 1, y = 1 },
	cost = 20,
	order = 585,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = { 
		extra = {
			xmult = 100,
		}
	},
	calculate = function(self,card,context)
		if context.joker_main or context.blueprint or context.forcetrigger then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.xmult}}
	end,
}

SMODS.Joker{
	key = "chompyvenom",
	atlas = "bfchompy",
	pos = { x = 0, y = 2 },
	soul_pos = { x = 1, y = 2 },
	cost = 20,
	order = 586,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	immutable = true,
	config = { 
		extra = {
			xmult = 10,
			blindmult = 0.25,
		}
	},
	calculate = function(self,card,context)
		if context.joker_main or context.blueprint or context.forcetrigger then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
		if context.using_consumeable and context.consumeable and context.consumeable.ability.set == 'Tarot' then
			if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
					G.GAME.blind.chips = math.floor(G.GAME.blind.chips * card.ability.extra.blindmult)
					G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
					local chips_UI = G.hand_text_area.blind_chips
					G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
					G.HUD_blind:recalculate() 
					chips_UI:juice_up()
					play_sound('chips2')
					G.E_MANAGER:add_event(Event({
						func = function()
							G.E_MANAGER:add_event(Event({
								func = function()
									G.GAME.blind:disable()
									play_sound('timpani')
									delay(0.4)
									return true
								end
							}))
                            SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
                        return true
                        end
                    }))
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.xmult, center.ability.extra.blindmult}}
	end,
}

SMODS.Joker{
	key = "chompyshocking",
	atlas = "bfchompy",
	pos = { x = 0, y = 3 },
	soul_pos = { x = 1, y = 3 },
	cost = 20,
	order = 587,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = { 
		extra = {
			xmult = 10,
		}
	},
	calculate = function(self,card,context)
		if context.joker_main or context.blueprint or context.forcetrigger then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
		if context.using_consumeable and context.consumeable and context.consumeable.ability.set == 'Planet' and not (context.consumeable.edition or {}).negative then
			handtext(mostPlayedHand())
			level_up_hand(card, mostPlayedHand(), false, 1)
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.xmult}}
	end,
}

SMODS.Joker{
	key = "chompydrowsy",
	atlas = "bfchompy",
	pos = { x = 0, y = 4 },
	soul_pos = { x = 1, y = 4 },
	cost = 20,
	order = 588,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = { 
		extra = {
			xmult = 10,
			permamult = 0.5,
		}
	},
	calculate = function(self,card,context)
		if context.joker_main or context.blueprint or context.forcetrigger then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
		if context.using_consumeable and context.consumeable and context.consumeable.ability.set == 'Spectral' then
			for i, v in pairs(G.playing_cards) do
				v.ability.perma_x_mult = v.ability.perma_x_mult or 0
				v.ability.perma_x_mult = v.ability.perma_x_mult + card.ability.extra.permamult
			end
			return {
				message = localize('k_upgrade_ex'), 
				colour = G.C.CHIPS,
				card = card
			}
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.xmult, center.ability.extra.permamult}}
	end,
}

SMODS.Joker{
	key = "chompyteam",
	atlas = "bfchompy",
	pos = { x = 0, y = 5 },
	soul_pos = { x = 1, y = 5 },
	cost = 20,
	order = 589,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = { 
		extra = {
			xmult = 10,
			money = 0.05,
		}
	},
	calculate = function(self,card,context)
		if context.joker_main or context.blueprint or context.forcetrigger then
			return {
				xmult = card.ability.extra.xmult,
				ease_dollars(lenient_bignum(G.GAME.dollars * card.ability.extra.money)),
			}
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.xmult, center.ability.extra.money * 100}}
	end,
}