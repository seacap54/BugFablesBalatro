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
	'layra',
	'hector',
	'kali',
	'mothiva',
	'zasp',
	'charmy',
	'stratos',
	'delilah',
	'maki',
	'kina',
	'yin'
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

--this and lvlupallhands stolen from Jen's Almanac
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
					if not context.blueprint and jl.njr(context) then
						card.ability.extra.Emult = card.ability.extra.Emult + card.ability.extra.Emult_change
					end
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
		if context.debuffed_hand then
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
		if context.remove_playing_cards and not context.blueprint and jl.njr(context) then
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
		atlas = "bfsapling",
		unlocked = true,
		discovered = true,
        loc_vars = function(self, info_queue, card)
            return {vars = {card.fusiondetails or ""}}
        end,
        can_use = function(self, card, area, copier)
			card.fusiondetails = ""
			local joker = G.jokers.highlighted[1]
			if joker then
				if (joker.config.center_key == "j_bf_hoaxe" or joker.config.center_key == "j_bf_elizant1") then
					card.fusiondetails = "(This action costs $1,000)"
					if G.GAME.dollars > to_big(1000) then
						return true
					end
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
				elk:start_materialize()
				G.jokers:emplace(elk)
			elseif joker.config.center_key == "j_bf_elizant1" then
				local etq = create_card('Joker',G.jokers, nil, nil, nil, nil, 'j_bf_etq')
				joker:start_dissolve()
				etq:add_to_deck()
				etq:start_materialize()
				G.jokers:emplace(etq)
			end
			ease_dollars(-1000)
        end,
}

SMODS.Joker{
	key = "elk",
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
			heartqueenmult = 25,
			otherqueenmult = 8,
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
		if context.before and not context.blueprint and jl.njr(context) then
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
		if context.after and not context.blueprint and jl.njr(context) then
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
	if G.GAME.blind.boss and #SMODS.find_card("j_bf_kali") > 0 and to_big(mod) > to_big(1) then
		for k, v in pairs(SMODS.find_card("j_bf_kali")) do
			v.ability.extra.activated = true
			v.ability.extra.mult = mod
		end
	end
	return edref(mod, instant)
end

SMODS.Joker{
	key = "vanessa",
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
		if context.playing_card_added and not context.blueprint and jl.njr(context) then
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

SMODS.Joker{
	key = "hector",
	atlas = "bfhector",
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
			percardmult = 1.5,
		}
	},
	loc_vars = function(self,info_queue,center)
		return {vars = {G.GAME.starting_deck_size and G.GAME.starting_deck_size or 52, center.ability.extra.percardmult, center.ability.extra.percardmult ^ math.max((G.GAME.starting_deck_size - (G.playing_cards and #G.playing_cards or G.GAME.starting_deck_size)), 0)}}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.percardmult ^ (math.max(G.GAME.starting_deck_size - #G.playing_cards, 0)),
				card = card
			}
		end
	end,
}

SMODS.Joker{
	key = "kali",
	atlas = "bfkali",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 8,
	rarity = 3,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	immutable = false,
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
		if context.joker_main and card.ability.extra.activated then
			return {
				xmult = card.ability.extra.mult,
				card = card
			}
		end
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint and jl.njr(context) then
			card.ability.extra.activated = false
			card.ability.extra.mult = 1
			return {
				message = localize("k_reset"),
				card = card,
			}
		end
	end,
}

function pseudoStrength(card)
	--Stolen from SMODS version of Strength
    local _card = card
    local rank_data = SMODS.Ranks[_card.base.value]
    local behavior = rank_data.strength_effect or { fixed = 1, ignore = false, random = false }
    local new_rank
    if behavior.ignore or not next(rank_data.next) then
        return true
	elseif behavior.random then
		-- TODO doesn't respect in_pool
		new_rank = pseudorandom_element(rank_data.next, pseudoseed('mothiva'))
	else
		local ii = (behavior.fixed and rank_data.next[behavior.fixed]) and behavior.fixed or 1
		new_rank = rank_data.next[ii]
	end
	if not SMODS.has_no_rank(card) and SMODS.Ranks[new_rank].nominal >= rank_data.nominal then
		assert(SMODS.change_base(_card, nil, new_rank))
	end
	return true
end

SMODS.Joker{
	key = "mothiva",
	atlas = "bfmothiva",
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
	calculate = function(self,card,context)
		if context.before and not context.blueprint and jl.njr(context) then
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
					v.ability.extra.mult = v.ability.extra.mult * 2
				else
					v.ability.extra.mult = v.ability.extra.mult * 4
				end
			end
		end
	end,
}

SMODS.Joker{
	key = "zasp",
	atlas = "bfzasp",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
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
					xmult = card.ability.extra.mult,
					card = card
				}, true
			end
		end
	end,
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
	rarity = 3,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
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
			if jl.chance("charmychance", 2, true) then
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
	end,
}

SMODS.Joker{
	key = "stratos",
	atlas = "bfstratos",
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
				e_mult = 1 + card.ability.extra.emult,
				card = card
			}
		end
		if context.end_of_round and context.cardarea == G.jokers and G.GAME.blind.boss and not context.blueprint and jl.njr(context) then
			card.ability.extra.emult = card.ability.extra.emult * 2
			return {
				message = localize("k_upgrade_ex"),
				colour = G.C.DARK_EDITION,
				card = card
			}
		end
	end,
}

SMODS.Joker{
	key = "delilah",
	atlas = "bfdelilah",
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
		extra = {
		}
	},
	loc_vars = function(self,info_queue,center)
		return {vars = {G.GAME and G.GAME.current_round.discards_left + G.GAME.current_round.hands_left or 2}}
	end,
	calculate = function(self,card,context)
		if context.setting_blind then
			if not G.GAME.blind.boss then
				if jl.chance("delilahhit", 3, true) then
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
	end,
}

SMODS.Joker{
	key = "maki",
	atlas = "bfmaki",
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
		extra = {
			Emult = 1.5,
		}
	},
	calculate = function(self,card,context)
		if context.individual and not context.end_of_round then
			if context.cardarea == G.hand then
				if context.other_card and context.other_card.ability.effect == 'Steel Card' then 
					if context.other_card.debuff then
						return {
							message = localize('k_debuffed'),
							colour = G.C.RED,
							card = card,
						}
					else
						return {
							e_mult = card.ability.extra.Emult,
							card = card
						}
					end
                end
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.Emult}}
	end,
}

SMODS.Joker{
	key = "kina",
	atlas = "bfkina",
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
		extra = {
			Emult = 1.25,
		}
	},
	loc_vars = function(self,info_queue,center)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_bf_maki
		return {vars = {center.ability.extra.Emult, #SMODS.find_card("j_bf_maki") > 0 and "You always run off without me!" or "Oh no... Maki went off by himself? Again!?"}}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 11 then
				return {
					e_mult = card.ability.extra.Emult,
					colour = G.C.DARK_EDITION,
					card = card
				}, true
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
	end,
}

SMODS.Joker{
	key = "yin",
	atlas = "bfyin",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	rarity = 'cry_exotic',
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = false,
	config = { 
		extra = {
		}
	},
	loc_vars = function(self,info_queue,center)
		info_queue[#info_queue + 1] = { key = "e_negative_consumable", set = "Edition", config = { extra = 1 } }
		return {vars = {}}
	end,
	calculate = function(self,card,context)
		if jl.njr(context) and not context.blueprint and context.using_consumeable and context.consumeable and not (context.consumeable.edition or {}).negative then
			local quota = 1
			if Incantation then
				quota = context.consumeable:getEvalQty()
			end
			local card_key = context.consumeable:gc().key
			local makes = 0
			for i = 1, quota do
				if jl.chance("yindupe", 4, true) then
					makes = makes + 1
				end
			end
			if makes > 0 then
				card:speak("Ma...magic!", G.C.FILTER)
				Q(function()
					local yin = copy_card(context.consumeable)
					if quota > 1 and Incantation then
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