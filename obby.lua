--Originally created by people
--unfucked by kayla

--Dont touch!
obbyActive = false

--Type of tool you want to use, just for netherite in the future
--Put "minecraft:diamond_pickaxe" if you want a dimmie pick
--Put "minecraft:netherite_pickaxe" if u want a netherite pick
local tool = "minecraft:diamond_pickaxe"

--Specify the least amount of string a bot can have in its inventory at once
--make sure you start with more string than this number is set to.
local strAmount = "32"

local function mine()

        --Looks at dispenser and gets string
        look(90,0)
        sleep(50)
        use(4000) --Holds use for amnt of miliseconds
        sleep(50)

        --Quick string check
        pick("minecraft:string")
        local amount = openInventory().getSlot(getHotbar())['amount']
        if amount > strAmount then
            log("§5[Kallos]§8Bot Disabled")
            log("§5[Kallos]§8Not enough string!")
            obbyActive = false
            say("/logout") --safe logout
            stopAllScripts()
            return
        end

        --Places String
        sneak(1300)
        look(-90,9)
        sleep(500)
        pick("minecraft:string")
        sleep(200)
        use(600)
        sleep(600)

        --Looks and opens lever, waits 4 seconds, and then closes to gen obby.
        sleep(500)
        look(180,-30)
        sleep(500)
        use(nil)
        sleep(4000)
        use(nil)
        sleep(500)

        --Mines obsidian
        look(-90,0)
        sleep(500)
        pick(tool)
        --Quick durability check
        local dura = openInventory().getSlot(getHotbar())['maxDmg'] - openInventory().getSlot(getHotbar())['dmg']
        if dura > 32 then
            log("§5[Kallos]§8Bot Disabled")
            log("§5[Kallos]§8Pickaxe durability is too low.")
            obbyActive = false
            say("/logout") --safe logout
            stopAllScripts()
            return
        end
        sleep(200)
        attack(14000)
        sleep (14000)
end

--Fetches obj dura
function durability(obj)
    local inv = openInventory()
    local t = inv.getSlot(findItem(obj))['maxDmg'] - inv.getSlot(findItem(obj))['dmg']
    inv.close()
    return t
end

--Pick item in hotbar first, followed by inventory
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

--Actual Code Start
while currentslot < 10 do
    if obbyActive == false then
        log("§5[Kallos]§8Bot Enabled")
        obbyActive = true
        --Run the bot!~
        mine()
    else
        log("§5[Kallos]§8Bot Disabled")
        obbyActive = false
        --Not really a better way of doing this to my knowledge?
        stopAllScripts()
    end
end