local edref = ease_dollars
function ease_dollars(mod, instant)
	if mod == to_big(0) then return end
	if #SMODS.find_card('j_bf_vanessa') > 0 and to_big(mod) > to_big(0) then
		mod = mod * (3 ^ #SMODS.find_card('j_bf_vanessa'))
	end
	if #SMODS.find_card("j_bf_kali") > 0 and to_big(mod) >= to_big(1) then
		for k, v in pairs(SMODS.find_card("j_bf_kali")) do
			v.ability.extra.activated = true
			v.ability.extra.mult = mod
		end
	end
	return edref(mod, instant)
end