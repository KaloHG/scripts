--Made by Vespasian
--Modified for spider grinder use by Kayla.

--MAKE SURE YOU HAVE FOOD IN YOUR OFFHAND

--Thanks for the support angel <3!

leftclick = not leftclick
if not leftclick then return end

local lock_cam = true -- lock camera in place while active?

local yaw = getPlayer().yaw
local pitch = getPlayer().pitch


log("&aHolding left click")
local start = os.clock()

while leftclick do
	attack(nil) --instant click
	sleep(1000) --one click a second.
	if lock_cam then
		look(yaw, pitch)
	end
    if getPlayer().hunger < 6 then
        use(6000) --Eat for 6 seconds
        sleep(6000)
    end
end

attack(1)
sneak(1)

local total = os.clock() - start
local minutes = math.floor(total / 60)
local seconds = math.floor(total % 60)
log("&cRan spider grinder for &f" .. minutes .. "m " .. seconds .. "s")
