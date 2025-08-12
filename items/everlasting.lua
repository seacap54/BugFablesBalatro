SMODS.Atlas {
	key = 'bfelk',
	px = 71,
	py = 95,
	path = 'j_bf_elk.png'
}

SMODS.Joker{
	key = "elk",
	atlas = "bfelk",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	order = 555,
	rarity = 'bf_everlasting',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
	no_doe = true,
	config = { 
		immutable = {
			blindmult = 0.75,
		},
		extra = {
			discardmult = 3,
		},
	},
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 13 then
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * card.ability.immutable.blindmult)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

                local chips_UI = G.hand_text_area.blind_chips
                G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                G.HUD_blind:recalculate() 
                chips_UI:juice_up()

                if not silent then play_sound('chips2') end
				return true end }))
			end
		end
		if context.joker_main then
			card:speak('X'..card.ability.extra.discardmult..' Discards', G.C.RED)
			ease_discard(G.GAME.current_round.discards_left * (card.ability.extra.discardmult - 1))
		end
		if context.forcetrigger then
			card:speak('X'..card.ability.extra.discardmult..' Discards', G.C.RED)
			ease_discard(G.GAME.current_round.discards_left * (card.ability.extra.discardmult - 1))
			G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * card.ability.immutable.blindmult)
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
		return {vars = {center.ability.immutable.blindmult, center.ability.extra.discardmult}}
	end,
}


SMODS.Atlas {
	key = 'bfetq',
	px = 71,
	py = 95,
	path = 'j_bf_etq.png'
}

SMODS.Joker{
	key = "etq",
	atlas = "bfetq",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 50,
	order = 561,
	rarity = 'bf_everlasting',
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	demicoloncompat = true,
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
						e_mult = lenient_bignum(card.ability.extra.heartqueenmult),
						card = card
					}
				elseif context.other_card:get_id() == 12 and not context.other_card:is_suit('Hearts') then
					return {
						e_mult = lenient_bignum(card.ability.extra.otherqueenmult),
						card = card
					}
				else
					return {
						e_mult = lenient_bignum(card.ability.extra.othermult),
						card = card
					}
				end
			end
		end
		if context.forcetrigger then
			return {
				e_mult = lenient_bignum(card.ability.extra.othermult),
				card = card
			}
		end
	end,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.heartqueenmult, center.ability.extra.otherqueenmult, center.ability.extra.othermult}}
	end,
}