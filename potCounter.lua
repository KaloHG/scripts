local playerinv = openInventory();
local potAmnt = 0;
local map = playerinv.mapping.inventory;
for a, b in pairs(map.main) do
    local item = playerinv.getSlot(b);
    if item and item.id == 'minecraft:splash_potion' then
        if item.nbt.tag.Potion == 'minecraft:strong_healing' then
            potAmnt = potAmnt+1;
        end
    end
end
log(potAmnt);