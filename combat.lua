local _, _, formatted, plain, actions = ...
--DO NOT TOUCH ABOVE!

--Put the group you want to broadcast to below.
local group = "K-I"

--Set to true if you want to ping as well.
local ping = false

if plain:match('^You have engaged in combat with (%w+)') then
    local player = string.match(plain ,'^You have engaged in combat with (%w+)')

    local x, y, z = getPlayerBlockPos();
    local mcPlayer = getPlayer()
    log('&8[&5Combat&8] ON &7(' .. player .. ')')
    if(ping) then
        say('/g ' .. group .. ' Engaged in combat with ' .. player .. ' at [x:'.. x .. ', y:' .. y ..', z:' .. z ..']. Health: ' .. mcPlayer.health .. " @here");
    else
        say('/g ' .. group .. ' Engaged in combat with ' .. player .. ' at [x:'.. x .. ', y:' .. y ..', z:' .. z ..']. Health: ' .. mcPlayer.health);
    end
end
