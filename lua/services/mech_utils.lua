require("lua/utils/reflection.lua")
require("lua/utils/numeric_utils.lua")

local Mech = {}

function Mech:GetCurrentSpeed( mech_entity )
    -- SenorRagequit 18.07.22
    local mechcomponent = reflection_helper( EntityService:GetComponent( mech_entity, "MechComponent") )
	if mechcomponent ~= nil then
		local speed = Length( mechcomponent.velocity )
        return speed
    else
        mechcomponent = INVALID_ID
        LogService:Log("Mech:GetCurrentSpeed: Error - Invalid mechcomponent")
        return mechcomponent
    end
end

function Mech:SetCurrentSpeed( mech_entity, speed )
    -- SenorRagequit 18.07.22
    local mechcomponent = reflection_helper( EntityService:GetComponent( mech_entity, "MechComponent") )
    if mechcomponent ~= nil then
        if speed >= 0 then
            mechcomponent.max_speed = speed
        else
            mechcomponent = INVALID_ID
            LogService:Log("Mech:SetCurrentSpeed: Error - Speed has to be greater or equal 0")
        end
    else
        mechcomponent = INVALID_ID
        LogService:Log("Mech:SetCurrentSpeed: Error - Invalid mechcomponent")
    end
end

function Mech:GetDefaultWeapon( mech_entity )
    -- SenorRagequit 18.07.22
    local mechcomponent = reflection_helper( EntityService:GetComponent( mech_entity, "MechComponent") )
	if mechcomponent ~= nil then
		local defaultweapon = mechcomponent.default_weapon
        return defaultweapon
    else
        mechcomponent = INVALID_ID
        LogService:Log("Mech:GetDefaultWeapon: Error - Invalid mechcomponent")
        return mechcomponent
    end
end

function Mech:SetDefaultWeapon( mech_entity, weapon_item_bp )
    -- SenorRagequit 18.07.22
    if string.match(weapon_item_bp, "_item") then
        local mechcomponent = reflection_helper( EntityService:GetComponent( mech_entity, "MechComponent") )
        if mechcomponent ~= nil then
            mechcomponent.default_weapon = weapon_item_bp
        else
            mechcomponent = INVALID_ID
            LogService:Log("Mech:SetDefaultWeapon: Error - Invalid mechcomponent")
        end
    else
        mechcomponent = INVALID_ID
        LogService:Log("Mech:SetDefaultWeapon: Error - Weapon BP with _item required ")
    end
end

return Mech