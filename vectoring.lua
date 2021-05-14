vectoring = not vectoring
if not vectoring then 
    log('&8[&5Botting&8] &6* &cVECTORING...');
    forward(0);
    sprint(false)
    return 
end
--Don't touch, toggle statement.

local minfood = 10

local foods = {"cookie", "pumpkin_pie", "apple", "melon", "baked_potato", "cooked_chicken", "cooked_mutton", "mushroom_stew", "bread", "cooked_rabbit", "carrot", "cooked_salmon", "cooked_fish", "cooked_beef", "golden_carrot", "rabbit_stew"}


log('&8[&5Botting&8] &6* &aVECTORING...');

while vectoring do
    --AimLock statement
    local yaw = getPlayer().yaw;
    look(math.floor((yaw+22.5)/45)*45, 0)
    forward(-1)
    sprint(true)
    jump();

    local food = getPlayer().hunger;
    if food < minfood then
        for i=1,16 do
            pick(foods[i])
        end
        use(80);
    end
    sleep(90);
end

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