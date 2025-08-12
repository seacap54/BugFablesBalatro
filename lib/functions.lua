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

local vanillafoods = {
	"j_gros_michel",
	"j_egg",
	"j_ice_cream",
	"j_cavendish",
	"j_turtle_bean",
	"j_diet_cola",
	"j_popcorn",
	"j_ramen",
	"j_selzer"
}

--WE LOVE STEALING CODE! Cryptid this time
function countfoodjokers()
	local foodcount = 0
	if G.jokers then
		for i = 1, #G.jokers.cards do
			if Cryptid.safe_get(G.jokers.cards[i].config.center, "pools", "Food") or jl.bf(G.jokers.cards[i].config.center_key, vanillafoods) then
				foodcount = foodcount + 1
			end
		end
	else 
		return 0
	end
	return foodcount
end

--Checks a string against a table of strings (stolen from JenLib)
function checkStringTable(needle, haystack)
	if type(needle) ~= 'string' then return false end
	if type(haystack) ~= 'table' then return false end
	for k, v in pairs(haystack) do
		if type(v) == 'string' and v == needle then return true end
	end
	return false
end

--stolen from Paperback
function get_suits_count(scoring_hand, bypass_debuff, flush_calc)
	-- Set each suit's count to 0
	local suits = {}

	for k, _ in pairs(SMODS.Suits) do
		suits[k] = 0
	end

	-- First we cover all the non Wild Cards in the hand
	for _, card in ipairs(scoring_hand) do
		if not SMODS.has_any_suit(card) then
			for suit, count in pairs(suits) do
				if card:is_suit(suit, bypass_debuff, flush_calc) and count == 0 then
					suits[suit] = count + 1
					break
				end
			end
		end
	end

	-- Then we cover Wild Cards, filling the missing suits
	for _, card in ipairs(scoring_hand) do
		if SMODS.has_any_suit(card) then
			for suit, count in pairs(suits) do
				if card:is_suit(suit, bypass_debuff, flush_calc) and count == 0 then
					suits[suit] = count + 1
					break
				end
			end
		end
	end

	-- Count the amount of suits that were found
	local num_suits = 0

	for _, v in pairs(suits) do
		if v > 0 then num_suits = num_suits + 1 end
	end

	return num_suits
end

--stolen from JenLib
--Gets the most-played hand
function mostPlayedHand()
	if not G.GAME or not G.GAME.current_round then return 'High Card' end
	local chosen_hand = 'High Card'
	local _handname, _played, _order = 'High Card', -1, -1
	for k, v in pairs(G.GAME.hands) do
		if v.played > _played or (v.played == _played and _order > v.order) then 
			_played = v.played
			_handname = k
		end
	end
	chosen_hand = _handname
	return chosen_hand
end

--A more minimalist function for changing the hand UI
function handupdate(name, chip, mul, lv, notif, snd, vol, pit, de)
	update_hand_text({sound = type(snd) == 'string' and snd or type(snd) == 'nil' and 'button', volume = vol or 0.7, pitch = pit or 0.8, delay = de or 0.3}, {handname=name or '????', chips = chip or '?', mult = mul or '?', level=lv or '?', StatusText = notif})
end

--Updates the hand text to a specified hand
function handtext(hand, notify)
	if hand == 'all' or hand == 'allhands' or hand == 'all_hands' then
		handupdate(localize('k_all_hands'), '...', '...', '', notify)
	elseif G.GAME.hands[hand or 'NO_HAND_SPECIFIED'] then
		handupdate(localize(hand, 'poker_hands'), G.GAME.hands[hand].chips, G.GAME.hands[hand].mult, G.GAME.hands[hand].level, notify)
	else
		handupdate('ERROR', 'ERROR', 'ERROR', 'ERROR', notify)
	end
end