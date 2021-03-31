leftclick = not leftclick
if not leftclick then return end

local lock_cam = true -- lock camera in place while active?

local yaw = getPlayer().yaw
local pitch = getPlayer().pitch


log("&aHolding left click")
local start = os.clock()

while leftclick do
	sneak(-1)
	attack(50)
	sleep(50)
	if lock_cam then
		look(yaw, pitch)
	end
end

attack(1)
sneak(1)

local total = os.clock() - start
local minutes = math.floor(total / 60)
local seconds = math.floor(total % 60)
log("&cHeld left click for &f" .. minutes .. "m " .. seconds .. "s")
