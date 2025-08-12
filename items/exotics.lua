SMODS.Atlas {
	key = 'bfvi',
	px = 71,
	py = 95,
	path = 'j_bf_vi.png'
}

SMODS.Joker{
	key = "vi",
	atlas = "bfvi",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	pools = {["Bee"] = true},
	cost = 50,
	order = 551,
	rarity = 'cry_exotic',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = { 
		extra = {
			Emult = 1,
			Emult_change = 0.06,
			bee = true,
			total_bees = 4,
			bold = 4,
		},
	},
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 6 then
				card.ability.extra.Emult = lenient_bignum(to_big(card.ability.extra.Emult) + to_big(card.ability.extra.Emult_change))
				return {
					e_mult = lenient_bignum(card.ability.extra.Emult),
					colour = G.C.DARK_EDITION,
					card = card
				}
			end
		end
		if context.forcetrigger then
			card.ability.extra.Emult = lenient_bignum(to_big(card.ability.extra.Emult) + to_big(card.ability.extra.Emult_change))
			return {
				e_mult = lenient_bignum(card.ability.extra.Emult),
				colour = G.C.DARK_EDITION,
				card = card
			}
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.Emult, center.ability.extra.Emult_change, #SMODS.find_mod("Beelatro") > 0 and localize({
					type = "variable",
					key = "k_multibees",
					vars = {
						number_format(center.ability.extra.total_bees),
					},
				}) or "", center.ability.extra.bee, center.ability.extra.total_bees, center.ability.extra.bold}}
	end,
}


SMODS.Atlas {
	key = 'bfkabbu',
	px = 71,
	py = 95,
	path = 'j_bf_kabbu.png'
}

SMODS.Joker{
	key = "kabbu",
	atlas = "bfkabbu",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	order = 552,
	rarity = 'cry_exotic',
	immutable = true,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = { 
		extra = {
			Emult = 3,
			money = 40,
		}
	},
	calculate = function(self,card,context)
		if context.debuffed_hand then
            ease_dollars(card.ability.extra.money)
		end
		if context.joker_main and G.GAME.blind.boss and not context.before and not context.after then
			return {
				message = localize{type='variable',key='a_powmult',vars={number_format(card.ability.extra.Emult)}},
				Emult_mod = lenient_bignum(card.ability.extra.Emult),
				colour = G.C.DARK_EDITION,
			}
		end
		if context.forcetrigger then
			ease_dollars(card.ability.extra.money)
			return {
				message = localize{type='variable',key='a_powmult',vars={number_format(card.ability.extra.Emult)}},
				Emult_mod = lenient_bignum(card.ability.extra.Emult),
				colour = G.C.DARK_EDITION,
			}
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.Emult, center.ability.extra.money}}
	end,
}


SMODS.Atlas {
	key = 'bfleif',
	px = 71,
	py = 95,
	path = 'j_bf_leif.png'
}

SMODS.Joker{
	key = "leif",
	atlas = "bfleif",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	order = 553,
	rarity = 'cry_exotic',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = {
		extra = {
			Emult = 2,
			Emult_change = 0.5,
		}
	},
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card and context.other_card.ability.name == 'Glass Card' then
				return {
					e_mult = lenient_bignum(card.ability.extra.Emult),
					card = card
				}
			end
		end
		if context.remove_playing_cards and not context.blueprint and not context.retrigger_joker_check and not context.retrigger_joker then
			for k, v in ipairs(context.removed) do
				if v.shattered then
					card.ability.extra.Emult = lenient_bignum(to_big(card.ability.extra.Emult + to_big(card.ability.extra.Emult_change)))
				end
			end
		end
		if context.forcetrigger then
			card.ability.extra.Emult = lenient_bignum(to_big(card.ability.extra.Emult + to_big(card.ability.extra.Emult_change)))
			return {
				e_mult = lenient_bignum(card.ability.extra.Emult),
				card = card
			}
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.Emult, center.ability.extra.Emult_change}}
	end,
}


SMODS.Atlas {
	key = 'bfvenus',
	px = 71,
	py = 95,
	path = 'j_bf_venus.png'
}

SMODS.Joker{
	key = "venus",
	atlas = "bfvenus",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	order = 558,
	rarity = "cry_exotic",
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
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
					if SMODS.pseudorandom_probability(card, 'venusmoney', (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.moneyodds, 'venusmoney') then
						card:speak(localize("k_venusmoney"), G.C.MONEY)
						ease_dollars(card.ability.extra.moneyboost)
						card:juice_up(0.3, 0.5)
					end
					if SMODS.pseudorandom_probability(card, 'venustarot', (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.tarotodds, 'venustarot') then
						card:speak(localize("k_venustarot"), G.C.SECONDARY_SET.Tarot)
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
							local card2 = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'venustarot')
							card2:add_to_deck()
							G.consumeables:emplace(card2)
							card:juice_up(0.3, 0.5)
							return true
						end }))
					end
					if SMODS.pseudorandom_probability(card, 'venusspectral', (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.spectralodds, 'venusspectral') then
						card:speak(localize("k_venusspectral"), G.C.SECONDARY_SET.Spectral)
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
							local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'venusspectral')
							card2:add_to_deck()
							G.consumeables:emplace(card2)
							card:juice_up(0.3, 0.5)
							return true
						end }))
					end
					if SMODS.pseudorandom_probability(card, 'venussoul', (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.soulodds, 'venussoul') then
						card:speak(localize("k_venussoul"), G.C.CRY_TWILIGHT)
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
							local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_soul', 'venussoul')
							card2:add_to_deck()
							G.consumeables:emplace(card2)
							card:juice_up(0.3, 0.5)
							return true
						end }))
					end
					if SMODS.pseudorandom_probability(card, 'venusgateway', (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.gatewayodds, 'venusgateway') then
						card:speak(localize("k_venusgateway"), G.C.CRY_ASCENDANT)
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
			if context.forcetrigger then
				card:speak(localize("k_venusmoney"), G.C.MONEY)
				ease_dollars(card.ability.extra.moneyboost)
				card:juice_up(0.3, 0.5)
				card:speak(localize("k_venustarot"), G.C.SECONDARY_SET.Tarot)
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card2 = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'venustarot')
					card2:add_to_deck()
					G.consumeables:emplace(card2)
					card:juice_up(0.3, 0.5)
				return true
				end }))
				card:speak(localize("k_venusspectral"), G.C.SECONDARY_SET.Spectral)
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'venusspectral')
					card2:add_to_deck()
					G.consumeables:emplace(card2)
					card:juice_up(0.3, 0.5)
					return true
				end }))
				card:speak(localize("k_venussoul"), G.C.CRY_TWILIGHT)
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_soul', 'venussoul')
					card2:add_to_deck()
					G.consumeables:emplace(card2)
					card:juice_up(0.3, 0.5)
					return true
				end }))
				card:speak(localize("k_venusgateway"), G.C.CRY_ASCENDANT)
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_cry_gateway', 'venusgateway')
					card2:add_to_deck()
					G.consumeables:emplace(card2)
					card:juice_up(0.3, 0.5)
					return true
				end }))
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
		local moneynum, moneydenom = SMODS.get_probability_vars(center, (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.moneyodds, "venusmoney")
		local tarotnum, tarotdenom = SMODS.get_probability_vars(center, (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.tarotodds, "venustarot")
		local spectnum, spectdenom = SMODS.get_probability_vars(center, (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.spectralodds, "venusspectral")
		local soulnum, souldenom = SMODS.get_probability_vars(center, (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.soulodds, "venussoul")
		local gatewaynum, gatewaydenom = SMODS.get_probability_vars(center, (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.gatewayodds, "venusgateway")
		return {vars = {center.ability.extra.slotsboost, center.ability.extra.moneyboost, moneynum, moneydenom, tarotnum, tarotdenom, spectnum, spectdenom, soulnum, souldenom, gatewaynum, gatewaydenom}}
	end,
}


SMODS.Atlas {
	key = 'bfstratos',
	px = 71,
	py = 95,
	path = 'j_bf_stratos.png'
}

SMODS.Joker{
	key = "stratos",
	atlas = "bfstratos",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	order = 572,
	rarity = 'cry_exotic',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = { 
		extra = {
			emult = 0.1,
		}
	},
	loc_vars = function(self,info_queue,center)
		return {vars = {1 + center.ability.extra.emult}}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			return {
				e_mult = 1 + lenient_bignum(card.ability.extra.emult),
				card = card
			}
		end
		if context.end_of_round and context.cardarea == G.jokers and G.GAME.blind.boss and not context.blueprint and not context.retrigger_joker_check and not context.retrigger_joker then
			card.ability.extra.emult = card.ability.extra.emult * 2
			return {
				message = localize("k_upgrade_ex"),
				colour = G.C.DARK_EDITION,
				card = card
			}
		end
		if context.forcetrigger then
			card.ability.extra.emult = card.ability.extra.emult * 2
			return {
				e_mult = 1 + lenient_bignum(card.ability.extra.emult),
				card = card
			}
		end
	end,
}


SMODS.Atlas {
	key = 'bfdelilah',
	px = 71,
	py = 95,
	path = 'j_bf_delilah.png'
}

SMODS.Joker{
	key = "delilah",
	atlas = "bfdelilah",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	order = 573,
	rarity = 'cry_exotic',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = { 
		extra = {
		}
	},
	loc_vars = function(self,info_queue,center)
		return {vars = {G.GAME and G.GAME.current_round.discards_left + G.GAME.current_round.hands_left or 2}}
	end,
	calculate = function(self,card,context)
		if context.setting_blind then
			if not G.GAME.blind.boss then
				if pseudorandom("delilahhit") < (1 / 3) then
					card:speak("That was fun!", G.C.CHIPS)
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
						G.GAME.blind.chips = math.floor(G.GAME.blind.chips ^ (1 / (G.GAME.current_round.discards_left + G.GAME.current_round.hands_left)))
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
		if context.forcetrigger then
			G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips ^ (1 / (G.GAME.current_round.discards_left + G.GAME.current_round.hands_left)))
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

				local chips_UI = G.hand_text_area.blind_chips
				G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
				G.HUD_blind:recalculate() 
				chips_UI:juice_up()

				if not silent then play_sound('chips2') end
			return true end }))
		end
	end,
}


SMODS.Atlas {
	key = 'bfmaki',
	px = 71,
	py = 95,
	path = 'j_bf_maki.png'
}

SMODS.Joker{
	key = "maki",
	atlas = "bfmaki",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	order = 574,
	rarity = 'cry_exotic',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = { 
		extra = {
			Emult = 1.5,
		}
	},
	calculate = function(self,card,context)
		if context.individual and not context.end_of_round then
			if context.cardarea == G.hand or context.cardarea == G.play then
				if context.other_card and context.other_card.ability.effect == 'Steel Card' then 
					if context.other_card.debuff then
						return {
							message = localize('k_debuffed'),
							colour = G.C.RED,
							card = card,
						}
					else
						return {
							e_mult = lenient_bignum(card.ability.extra.Emult),
							card = card
						}
					end
                end
			end
		end
		if context.forcetrigger then
			return {
				e_mult = lenient_bignum(card.ability.extra.Emult),
				card = card
			}
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.Emult}}
	end,
}


SMODS.Atlas {
	key = 'bfkina',
	px = 71,
	py = 95,
	path = 'j_bf_kina.png'
}

SMODS.Joker{
	key = "kina",
	atlas = "bfkina",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	order = 575,
	rarity = 'cry_exotic',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	config = { 
		extra = {
			Emult = 1.25,
		}
	},
	loc_vars = function(self,info_queue,center)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_bf_maki
		return {vars = {center.ability.extra.Emult, #SMODS.find_card("j_bf_maki") > 0 and localize("k_kinawithmaki") or localize("k_kinawithoutmaki")}}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 11 then
				return {
					e_mult = lenient_bignum(card.ability.extra.Emult),
					colour = G.C.DARK_EDITION,
					card = card
				}
			end
		end
		if context.repetition and context.cardarea == G.play then
			if context.other_card:get_id() == 11 then
				if #SMODS.find_card("j_bf_maki") > 0 then
					return {
						message = localize("k_again_ex"),
						repetitions = #SMODS.find_card("j_bf_maki"),
						card = card,
					}
				end
			end
		end
		if context.forcetrigger then
			return {
				e_mult = lenient_bignum(card.ability.extra.Emult),
				colour = G.C.DARK_EDITION,
				card = card
			}
		end
	end,
}


SMODS.Atlas {
	key = 'bfyin',
	px = 71,
	py = 95,
	path = 'j_bf_yin.png'
}

SMODS.Joker{
	key = "yin",
	atlas = "bfyin",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	order = 576,
	rarity = 'cry_exotic',
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = false,
	config = { 
		extra = {
		}
	},
	loc_vars = function(self,info_queue,center)
		info_queue[#info_queue + 1] = { key = "e_negative_consumable", set = "Edition", config = { extra = 1 } }
		return {vars = {}}
	end,
	calculate = function(self,card,context)
		if not context.retrigger_joker_check and not context.retrigger_joker and not context.blueprint and context.using_consumeable and context.consumeable and not (context.consumeable.edition or {}).negative then
			local quota = 1
			if Incantation then
				quota = context.consumeable:getEvalQty()
			elseif Overflow then
				quota = context.consumeable:getQty()
			end
			local card_key = context.consumeable:gc().key
			local makes = 0
			for i = 1, quota do
				if pseudorandom("yindupe") < (1 / 4) then
					makes = makes + 1
				end
			end
			if makes > 0 then
				card:speak("Ma...magic!", G.C.FILTER)
				Q(function()
					local yin = copy_card(context.consumeable)
					if quota > 1 and (Incantation or Overflow) then
						yin:setQty(makes)
					end
					yin:set_edition({negative = true}, true)
					yin:add_to_deck()
					G.consumeables:emplace(yin)
				return true end, 1)
			end	
		end
	end,
}


SMODS.Atlas {
	key = 'bfhologram',
	px = 71,
	py = 95,
	path = 'j_bf_hologram.png'
}

SMODS.Joker{
	key = "hologram",
	atlas = "bfhologram",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	order = 580,
	rarity = "cry_exotic",
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	immutable = true,
	config = { 
		extra = {
			codesleft = 10,
			basereq = 10,
			reqmult = 1,
			usesleft = 2,
		}
	},
	calculate = function(self,card,context)
		if card.ability.extra.usesleft > 0 and context.using_consumeable and context.consumeable and context.consumeable.ability.set == 'Code' and not (context.consumeable.edition or {}).negative and not context.blueprint and not context.retrigger_joker_check and not context.retrigger_joker then
			local codesused = 1
			if Incantation then
				codesused = context.consumeable:getEvalQty()
			elseif Overflow then
				codesused = context.consumeable:getQty()
			end
			card.ability.extra.codesleft = card.ability.extra.codesleft - codesused
			if card.ability.extra.codesleft <= 0 then
				local soul = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_soul', 'hologram')
				soul:add_to_deck()
				G.consumeables:emplace(soul)
				card.ability.extra.reqmult = card.ability.extra.reqmult + 1
				card.ability.extra.codesleft = card.ability.extra.basereq * card.ability.extra.reqmult
				card.ability.extra.usesleft = card.ability.extra.usesleft - 1
				return {
					message = localize("k_soulmade"),
					colour = G.C.SET.Code,
					card = card
				}
			end
		end
		if context.end_of_round and G.GAME.blind.boss and context.cardarea == G.jokers and not context.blueprint and not context.retrigger_joker_check and not context.retrigger_joker then
			card.ability.extra.usesleft = 2
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_reset"), colour = G.C.SET.Code})
		end
		if context.forcetrigger then
			local soul = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_soul', 'hologram')
			soul:add_to_deck()
			G.consumeables:emplace(soul)
		end
	end,
	loc_vars = function(self,info_queue,center)
		info_queue[#info_queue + 1] = G.P_CENTERS.c_soul
		return {vars = {center.ability.extra.codesleft, center.ability.extra.basereq, center.ability.extra.reqmult, center.ability.extra.usesleft, center.ability.extra.reqmult * center.ability.extra.basereq}}
	end,
}


SMODS.Atlas {
	key = 'bfsamira',
	px = 71,
	py = 95,
	path = 'j_bf_samira.png'
}

SMODS.Joker{
	key = "samira",
	atlas = "bfsamira",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	order = 584,
	rarity = 'cry_exotic',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
	config = { 
		extra = {
			chipsmult = 10,
			money = 8,
			retriggers = 2,
		}
	},
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.chipsmult, center.ability.extra.money, math.min(40, center.ability.extra.retriggers)}}
	end,
	calculate = function(self,card,context)
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self and context.other_card == G.jokers.cards[#G.jokers.cards] then
			return {
				message = localize("k_again_ex"),
				repetitions = math.min(40, card.ability.extra.retriggers),
				card = card,
			}
		end
		if context.joker_main then
			return {
				message = localize("k_samira"),
				Xchip_mod = lenient_bignum(card.ability.extra.chipsmult),
				Xmult_mod = lenient_bignum(card.ability.extra.chipsmult),
			}
		end
		if context.forcetrigger then
			ease_dollars(lenient_bignum(card.ability.extra.money))
			return {
				message = localize("k_samira"),
				Xchip_mod = lenient_bignum(card.ability.extra.chipsmult),
				Xmult_mod = lenient_bignum(card.ability.extra.chipsmult),
			}
		end
	end,
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.money > 0 then
			return lenient_bignum(card.ability.extra.money)
		end
	end,
}