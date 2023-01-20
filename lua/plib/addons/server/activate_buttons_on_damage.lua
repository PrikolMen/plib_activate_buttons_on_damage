local USE_TOGGLE = USE_TOGGLE
local IsValid = IsValid

local function getButton( ent )
    if IsValid( ent ) then
        if ent:IsButton() then
            return ent
        end

        return getButton( ent:GetParent() )
    end
end

hook.Add('EntityTakeDamage', 'Activate Buttons on Damage', function( ent, dmg )
    local button = getButton( ent )
    if IsValid( button ) then
        button:Use( dmg:GetAttacker(), dmg:GetInflictor(), USE_TOGGLE )
    end
end)
