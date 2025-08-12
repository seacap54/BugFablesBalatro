SMODS.Atlas {
	key = 'bfsapling',
	px = 71,
	py = 95,
	path = 'c_bf_sapling.png'
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
					if G.GAME.dollars >= to_big(1000) then
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
				joker.getting_sliced = true
				joker:start_dissolve()
				elk:add_to_deck()
				elk:start_materialize()
				G.jokers:emplace(elk)
			elseif joker.config.center_key == "j_bf_elizant1" then
				local etq = create_card('Joker',G.jokers, nil, nil, nil, nil, 'j_bf_etq')
				joker.getting_sliced = true
				joker:start_dissolve()
				etq:add_to_deck()
				etq:start_materialize()
				G.jokers:emplace(etq)
			end
			ease_dollars(-1000)
        end,
}


SMODS.Atlas {
	key = 'bfribbons',
	px = 71,
	py = 95,
	path = 'c_bf_ribbons.png'
}

SMODS.Consumable{
        key = 'prettyribbon',
        set = 'Spectral',
        pos = {x = 0, y = 0},
        cost = 4,
		atlas = "bfribbons",
		unlocked = true,
		discovered = true,
        loc_vars = function(self, info_queue, card)
			info_queue[#info_queue + 1] = { set = "Other", key = "bf_prettyribbon" }
            return {vars = {}}
        end,
        can_use = function(self, card, area, copier)
			if #SMODS.find_card("j_bf_chompybase") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompyvenom") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompyshocking") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompydrowsy") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompyteam") > 0 then return true
			else return false end
        end,
        use = function(self, card)
			for i = 1, #G.jokers.cards do
				local v = G.jokers.cards[i]
				if (v.config.center_key == "j_bf_chompybase" or v.config.center_key == "j_bf_chompyvenom" or v.config.center_key == "j_bf_chompyshocking" or v.config.center_key == "j_bf_chompydrowsy" or v.config.center_key == "j_bf_chompyteam") then
					G.E_MANAGER:add_event(Event({
					delay = 0.1,
					func = function()
						v:flip()
						play_sound('card1')
						return true
					end
				}))
				G.E_MANAGER:add_event(Event({
					delay = 1,
					func = function()
						v:flip()
						v:juice_up(1, 1)
						play_sound('card1')
						v:set_ability(G.P_CENTERS['j_bf_chompypretty'])
						return true
					end
				}))
				end
			end
        end,
}

SMODS.Consumable{
        key = 'venomribbon',
        set = 'Spectral',
        pos = {x = 1, y = 0},
        cost = 4,
		atlas = "bfribbons",
		unlocked = true,
		discovered = true,
        loc_vars = function(self, info_queue, card)
			info_queue[#info_queue + 1] = { set = "Other", key = "bf_venomribbon" }
            return {vars = {}}
        end,
        can_use = function(self, card, area, copier)
			if #SMODS.find_card("j_bf_chompybase") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompypretty") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompyshocking") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompydrowsy") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompyteam") > 0 then return true
			else return false end
        end,
        use = function(self, card)
			for i = 1, #G.jokers.cards do
				local v = G.jokers.cards[i]
				if (v.config.center_key == "j_bf_chompybase" or v.config.center_key == "j_bf_chompypretty" or v.config.center_key == "j_bf_chompyshocking" or v.config.center_key == "j_bf_chompydrowsy" or v.config.center_key == "j_bf_chompyteam") then
					G.E_MANAGER:add_event(Event({
					delay = 0.1,
					func = function()
						v:flip()
						play_sound('card1')
						return true
					end
				}))
				G.E_MANAGER:add_event(Event({
					delay = 1,
					func = function()
						v:flip()
						v:juice_up(1, 1)
						play_sound('card1')
						v:set_ability(G.P_CENTERS['j_bf_chompyvenom'])
						return true
					end
				}))
				end
			end
        end,
}

SMODS.Consumable{
        key = 'shockingribbon',
        set = 'Spectral',
        pos = {x = 2, y = 0},
        cost = 4,
		atlas = "bfribbons",
		unlocked = true,
		discovered = true,
        loc_vars = function(self, info_queue, card)
			info_queue[#info_queue + 1] = { set = "Other", key = "bf_shockingribbon" }
            return {vars = {}}
        end,
        can_use = function(self, card, area, copier)
			if #SMODS.find_card("j_bf_chompybase") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompypretty") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompyvenom") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompydrowsy") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompyteam") > 0 then return true
			else return false end
        end,
        use = function(self, card)
			for i = 1, #G.jokers.cards do
				local v = G.jokers.cards[i]
				if (v.config.center_key == "j_bf_chompybase" or v.config.center_key == "j_bf_chompypretty" or v.config.center_key == "j_bf_chompyvenom" or v.config.center_key == "j_bf_chompydrowsy" or v.config.center_key == "j_bf_chompyteam") then
					G.E_MANAGER:add_event(Event({
					delay = 0.1,
					func = function()
						v:flip()
						play_sound('card1')
						return true
					end
				}))
				G.E_MANAGER:add_event(Event({
					delay = 1,
					func = function()
						v:flip()
						v:juice_up(1, 1)
						play_sound('card1')
						v:set_ability(G.P_CENTERS['j_bf_chompyshocking'])
						return true
					end
				}))
				end
			end
        end,
}

SMODS.Consumable{
        key = 'drowsyribbon',
        set = 'Spectral',
        pos = {x = 3, y = 0},
        cost = 4,
		atlas = "bfribbons",
		unlocked = true,
		discovered = true,
        loc_vars = function(self, info_queue, card)
			info_queue[#info_queue + 1] = { set = "Other", key = "bf_drowsyribbon" }
        end,
        can_use = function(self, card, area, copier)
			if #SMODS.find_card("j_bf_chompybase") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompyvenom") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompyshocking") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompypretty") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompyteam") > 0 then return true
			else return false end
        end,
        use = function(self, card)
			for i = 1, #G.jokers.cards do
				local v = G.jokers.cards[i]
				if (v.config.center_key == "j_bf_chompybase" or v.config.center_key == "j_bf_chompyvenom" or v.config.center_key == "j_bf_chompyshocking" or v.config.center_key == "j_bf_chompypretty" or v.config.center_key == "j_bf_chompyteam") then
					G.E_MANAGER:add_event(Event({
					delay = 0.1,
					func = function()
						v:flip()
						play_sound('card1')
						return true
					end
				}))
				G.E_MANAGER:add_event(Event({
					delay = 1,
					func = function()
						v:flip()
						v:juice_up(1, 1)
						play_sound('card1')
						v:set_ability(G.P_CENTERS['j_bf_chompydrowsy'])
						return true
					end
				}))
				end
			end
        end,
}

SMODS.Consumable{
        key = 'teamribbon',
        set = 'Spectral',
        pos = {x = 4, y = 0},
        cost = 4,
		atlas = "bfribbons",
		unlocked = true,
		discovered = true,
        loc_vars = function(self, info_queue, card)
			info_queue[#info_queue + 1] = { set = "Other", key = "bf_teamribbon" }
            return {vars = {}}
        end,
        can_use = function(self, card, area, copier)
			if #SMODS.find_card("j_bf_chompybase") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompyvenom") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompyshocking") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompydrowsy") > 0 then return true
			elseif #SMODS.find_card("j_bf_chompypretty") > 0 then return true
			else return false end
        end,
        use = function(self, card)
			for i = 1, #G.jokers.cards do
				local v = G.jokers.cards[i]
				if (v.config.center_key == "j_bf_chompybase" or v.config.center_key == "j_bf_chompyvenom" or v.config.center_key == "j_bf_chompyshocking" or v.config.center_key == "j_bf_chompydrowsy" or v.config.center_key == "j_bf_chompypretty") then
					G.E_MANAGER:add_event(Event({
					delay = 0.1,
					func = function()
						v:flip()
						play_sound('card1')
						return true
					end
				}))
				G.E_MANAGER:add_event(Event({
					delay = 1,
					func = function()
						v:flip()
						v:juice_up(1, 1)
						play_sound('card1')
						v:set_ability(G.P_CENTERS['j_bf_chompyteam'])
						return true
					end
				}))
				end
			end
        end,
}