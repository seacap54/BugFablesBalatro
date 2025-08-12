local files = {
	"lib/functions",
	"lib/content",
	"lib/hooks",
	"items/exotics",
	"items/everlasting",
	"items/epics",
	"items/misc_jokers",
	"items/consumables",
}

for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end

Cryptid.pointerblistifytype("rarity", "bf_everlasting", true)