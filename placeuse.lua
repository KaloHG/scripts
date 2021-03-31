rightclick = not rightclick
if not rightclick then return end

local lock_cam = true
--Made by Vespasian

--thanks for the support vesp! :<

local lock_slot = true

log("&aHolding right click")
local start = os.clock()

local yaw = getPlayer().yaw
local pitch = getPlayer().pitch
local slot = getPlayer().invSlot



while rightclick do
    if lock_cam then
        look(yaw, pitch)
    end
    if lock_slot then
        setHotbar(slot)
    end
    sneak(-1)
    use(-1)
    sleep(250)
end

use(1)
sneak(1)

local total = os.clock() - start
local minutes = math.floor(total / 60)
local seconds = math.floor(total % 60)
log("&cHeld right click for ", minutes, "m ", seconds, "s")