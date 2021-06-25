--Made by Vespasian
--Modified for spider grinder use by Kayla.

--MAKE SURE YOU HAVE FOOD IN YOUR OFFHAND

--Thanks for the support angel <3!

leftclick = not leftclick
if not leftclick then return end

local lock_cam = true -- lock camera in place while active?

local yaw = getPlayer().yaw
local pitch = getPlayer().pitch


log("&aToggled Spider Grinder")
local start = os.clock()

function pick(obj)
    local inv = openInventory()
    
        -- Loops through hotbar for item
        for i = 37, 45 do
            -- Swaps to item and returns if found
            if inv.getSlot(i) and inv.getSlot(i).id == obj then
                setHotbar(i - 36)
                return inv.getSlot(i)
            end
        end
        
        -- Loops through inventory if item not found in hotbar
        for i = 1, inv.getTotalSlots() do
            -- Compares every item to see if it is the item we are searching for
            if inv.getSlot(i) and inv.getSlot(i).id == obj then
                  -- Puts the item in an empty spot on the hotbar and swaps to it
                  for hb = 37, 45 do
                    if not inv.getSlot(hb) then
                         inv.click(i)
                        sleep(50)
                          inv.click(hb)
                        setHotbar(hb - 36)
                        return inv.getSlot(i)
                    end
                end
            end
        end
    inv.close()
end

while leftclick do
    local hunger = getPlayer().hunger
    if hunger < 6 then
        use(6000) --Eat for 6 seconds
        sleep(6000)
    end
    local tool = pick('minecraft:diamond_sword')
    local dura = tool['maxDmg'] - tool['dmg']
    if dura < 32 then
        say("/logout")
        log("&cSword Dura too low to continue.")
        stopAllScripts()
    end
	attack(nil) --instant click
	sleep(1000) --one click a second.
	if lock_cam then
		look(yaw, pitch)
	end
end

attack(1)
sneak(1)

local total = os.clock() - start
local minutes = math.floor(total / 60)
local seconds = math.floor(total % 60)
log("&cRan spider grinder for &f" .. minutes .. "m " .. seconds .. "s")
