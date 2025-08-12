SMODS.Atlas {
	key = 'bffry',
	px = 71,
	py = 95,
	path = 'j_bf_fry.png'
}

SMODS.Joker{
	key = "fry",
	atlas = "bffry",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 16,
	order = 577,
	rarity = "cry_epic",
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
	config = { 
		extra = {
			spaghettis = 3,
		},
		immutable = {
			maxSpaghet = 100,
		}
	},
	calculate = function(self,card,context)
		if context.ending_shop then
			for i = 1, math.min(card.ability.extra.spaghettis, card.ability.immutable.maxSpaghet) do
				local spaget = create_card("Code", G.consumeables, nil, nil, nil, nil, "c_cry_spaghetti")
				spaget:set_edition({ negative = true })
				spaget:add_to_deck()
				G.consumeables:emplace(spaget)
			end
		end
		if context.forcetrigger then
			for i = 1, math.min(card.ability.extra.spaghettis, card.ability.immutable.maxSpaghet) do
				local spaget = create_card("Code", G.consumeables, nil, nil, nil, nil, "c_cry_spaghetti")
				spaget:set_edition({ negative = true })
				spaget:add_to_deck()
				G.consumeables:emplace(spaget)
			end
		end
	end,
	loc_vars = function(self,info_queue,center)
		info_queue[#info_queue + 1] = G.P_CENTERS.c_cry_spaghetti
		return {vars = {center.ability.extra.spaghettis, center.ability.immutable.maxSpaghet}}
	end,
}


SMODS.Atlas {
	key = 'bfkut',
	px = 71,
	py = 95,
	path = 'j_bf_kut.png'
}

SMODS.Joker{
	key = "kut",
	atlas = "bfkut",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 14,
	order = 578,
	rarity = "cry_epic",
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
	config = { 
		extra = {
			permult = 2,
		}
	},
	calculate = function(self,card,context)
		local food = countfoodjokers()
		if context.joker_main and not context.before and not context.after and food > 0 then
			local timesmult = lenient_bignum(card.ability.extra.permult) ^ food
			return {
				xmult = timesmult,
				card = card
			}
		end
		if context.forcetrigger then
			return {
				xmult = lenient_bignum(card.ability.extra.permult),
				card = card
			}
		end
	end,
	loc_vars = function(self,info_queue,center)
		info_queue[#info_queue + 1] = { set = "Other", key = "food_jokers" }
		return {vars = {center.ability.extra.permult, center.ability.extra.permult ^ countfoodjokers()}}
	end,
}

SMODS.Atlas {
	key = 'bfcrisbee',
	px = 71,
	py = 95,
	path = 'j_bf_crisbee.png'
}

SMODS.Joker{
	key = "crisbee",
	atlas = "bfcrisbee",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	pools = {["Bee"] = true},
	cost = 16,
	order = 579,
	rarity = 'cry_epic',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
	config = { 
		extra = {
			money = 8,
			bee = true,
			bold = 4,
		}
	},
	calculate = function(self,card,context)
		if context.other_joker then
			if Cryptid.safe_get(context.other_joker.config.center, "pools", "Food") or checkStringTable(context.other_joker.config.center_key, vanillafoods) then
				ease_dollars(lenient_bignum(card.ability.extra.money))
			end
		end
		if context.forcetrigger then
			ease_dollars(lenient_bignum(card.ability.extra.money))
		end
	end,
	loc_vars = function(self,info_queue,center)
		info_queue[#info_queue + 1] = { set = "Other", key = "food_jokers" }
		return {vars = {center.ability.extra.money, #SMODS.find_mod("Beelatro") > 0 and localize("k_onebee") or "", center.ability.extra.bee, center.ability.extra.bold}}
	end,
}


SMODS.Atlas {
	key = 'bfmimic',
	px = 71,
	py = 95,
	path = 'j_bf_mimic.png'
}

SMODS.Joker{
	key = "mimic",
	atlas = "bfmimic",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 18,
	order = 582,
	rarity = 'cry_epic',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = true,
	config = { 
		extra = {
			odds = 4,
		}
	},
	calculate = function(self,card,context)
		if context.using_consumeable and context.consumeable and context.consumeable.ability.name ~= "Death" then
			local rolls = 1
			if Incantation then
				rolls = context.consumeable:getEvalQty()
			elseif Overflow then
				rolls = context.consumeable:getQty()
			end
			for k = 1, rolls do
				if SMODS.pseudorandom_probability(card, 'mimicdeath', (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds, 'mimicdeath') then
					card:speak(localize("k_deathmade"), G.C.SECONDARY_SET.Tarot)
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
						local card2 = create_card('Tarot', G.consumeables, nil, nil, nil, nil, "c_death", 'mimicdeath')
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
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
				local card2 = create_card('Tarot', G.consumeables, nil, nil, nil, nil, "c_death", 'mimicdeath')
				card2:set_edition({negative = true}, true)
				card2:add_to_deck()
				G.consumeables:emplace(card2)
				card:juice_up(0.3, 0.5)
				return true
			end }))
		end
	end,
	loc_vars = function(self,info_queue,center)
		info_queue[#info_queue + 1] = G.P_CENTERS.c_death
		local num, denom = SMODS.get_probability_vars(center, G.GAME.probabilities.normal, center.ability.extra.odds, 'mimicdeath')
		return {vars = {num, denom}}
	end,
}


SMODS.Atlas {
	key = 'bfjaune',
	px = 71,
	py = 95,
	path = 'j_bf_jaune.png'
}

SMODS.Joker{
	key = "jaune",
	atlas = "bfjaune",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	pools = {["Bee"] = true},
	cost = 16,
	order = 585,
	rarity = 'cry_epic',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	demicoloncompat = false,
	config = { 
		extra = {
			retriggers = 1,
			bee = true,
			bold = 4,
		},
	},
	loc_vars = function(self,info_queue,center)
		return {vars = {math.min(40, center.ability.extra.retriggers), #SMODS.find_mod("Beelatro") > 0 and localize("k_onebee") or " ", center.ability.extra.bee, center.ability.extra.bold}}
	end,
	calculate = function(self,card,context)
		if context.repetition and context.cardarea == G.play then
			if context.other_card then
				local toRetrigger = 0
				if context.other_card:get_id() == 6 then
					toRetrigger = toRetrigger + card.ability.extra.retriggers
				end
				if context.other_card.ability.effect == 'Wild Card' then
					toRetrigger = toRetrigger + (2 * card.ability.extra.retriggers)
				elseif context.other_card.ability.effect ~= "Base" then
					toRetrigger = toRetrigger + card.ability.extra.retriggers
				end
				return {
					message = localize("k_again_ex"),
					repetitions = math.min(120, toRetrigger),
					card = card,
				}
			end
		end
	end,
}