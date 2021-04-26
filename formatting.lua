local _, _, formatted, plain, actions = ...
local msg = {...}
if plain:match('Enemy (%a+) prevent you from building') then
    local type = string.match(plain, 'Enemy (%a+) prevent you from building')
    log(type)
    return '&8[&5Bastion&8] ('..type..') %8[&4Enemy%8]'
elseif plain:match('Allied (%a+) prevent others from building') then
    local type = string.match(plain, 'Allied (%a+) prevent others from building')
    return '&8[&5Bastion&8] ('..type..') &8[&aFriendly&8]'
elseif plain:match('You are no longer in combat.') then
    return '&8[&5Combat&8] OFF'
elseif plain:match('^Reinforced at %d+%% (%(%d+%/%d+%)) health with (%w+)') then
    local health, rein = string.match(plain, '^Reinforced at %d+%% (%(%d+%/%d+%)) health with (%w+)');
    local group = string.match(plain, '^Reinforced at %d+%% %(%d+%/%d+%) health with %w+ on (.+)')
    if(group == nil) then
        return '&8[&5Citadel&8] (&4Enemy&8) '..rein..'-Reinforced &9'..health
    end
    return '&8[&5Citadel&8] (&6'..group..'&8) '..rein..'-Reinforced &9'..health..''
else

--DO NOT TOUCH THIS RETURN STATEMENT U WILL BREAK UR ENTIRE CHAT--
return formatted
end