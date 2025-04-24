-- Fill in which jobs you've created swaps for that you want to compare against as
-- well as your player name as these are used to load the correct files
local jobs = T{"BLM","RDM","GEO","COR","DRK","SCH","DRG","BRD"}
local playerName = 'Layshpoljah'
mysets = {}
 
-- To use your PLAYER-Items.lua file set this to true then edit your PLAYER-Items.lua file
-- and wrap a function around those sets called GetGlobalItems(), then call it again
-- at the bottom of the PLAYER-Items.lua after the function to ensure it runs when sel libs load
useGlobalItems = false
 
function InitializeSetsForSelindrile()
    sets.precast = {}
    sets.precast.FC = {}
    sets.precast.JA = {}
    sets.precast.WS = {}
    sets.precast.RA = {}
    sets.precast.Item = {}
    sets.midcast = {}
    sets.midcast.RA = {}
    sets.midcast.Pet = {}
    sets.idle = {}
    sets.resting = {}
    sets.engaged = {}
    sets.defense = {}
    sets.buff = {}
    sets.element = {}
    sets.passive = {}
    sets.weapons = {}
    sets.DuskIdle = {}
    sets.DayIdle = {}
    sets.NightIdle = {}
    sets.buff = {}  
    gear = {}
    gear.default = {}
    gear.ElementalGorget = {name=""}
    gear.ElementalBelt = {name=""}
    gear.ElementalObi = {name=""}
    gear.ElementalCape = {name=""}
    gear.ElementalRing = {name=""}
    gear.FastcastStaff = {name=""}
    gear.RecastStaff = {name=""}
end
 
if useGlobalItems then
    InitializeSetsForSelindrile()
    include(playerName .. '-Items.lua')
end
 
for k,v in pairs(jobs) do
    InitializeSetsForSelindrile()               -- Must set each time after clearing out the sets list
    if useGlobalItems then GetGlobalItems() end
    include(playerName .. '_' .. v .. '_Gear.lua')
    init_gear_sets()                            -- Selindrile uses this rather than get_sets
    mysets[v] = sets
    sets = {}
end
 
function get_sets()
    for k,v in pairs(mysets) do sets[k] = v end
end
