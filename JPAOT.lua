
local files = {
    "lib/atlas",
    "lib/sounds",
	  "items/blinds",
    "items/globals",
    "items/jokers",
}

local crossmodfiles = {
   "finity",

}

for i, v in pairs(files) do
    assert(SMODS.load_file(v..".lua"))()
end

for i, v in pairs(crossmodfiles) do
 if next(SMODS.find_mod(v)) then
     assert(SMODS.load_file("crossmod/" .. v .. ".lua"))()
 end
end