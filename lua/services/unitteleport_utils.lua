require("lua/utils/reflection.lua")
require("lua/utils/numeric_utils.lua")

local UnitTeleport = {}

local EMPTY_ENT_ID = INVALID_ID
local EMPTY_EFFECT = ""
local EMPTY_NUM = 0.0

function UnitTeleport:TeleportUnitToPlayerIfPlayerInDistance( entity, player, distance )
    -- SenorRagequit 22.03.23
    -- Teleports the unit to the player, if the player is in X distance around the unit

    if entity == "" or entity == nil then
        LogService:Log("UnitTeleport:TeleportUnitToPlayerIfPlayerInDistance: Error - No entity entered")
        return
    end

    if player == "" or player == nil then
        player = PlayerService:GetPlayerControlledEnt(0)
        LogService:Log("UnitTeleport:TeleportUnitToPlayerIfPlayerInDistance: Error - No player entered")
    end

    if distance == "" or distance == nil then
        distance = 3.0
        LogService:Log("UnitTeleport:TeleportUnitToPlayerIfPlayerInDistance: Error - No distance entered")
    end

    local actual_distance = EntityService:GetDistanceBetween( entity, player )

    if ( actual_distance <= distance ) then
        local emptyspot = FindService:FindEmptySpotInRadius( player, 1, 5, "", "")
        PlayerService:TeleportPlayer( entity, emptyspot.second , 0.2, 0.1, 0.2 )
        return true
    end

end

function UnitTeleport:TeleportUnitToPlayerIfPlayerInDistanceBetween( entity, player, distance_min, distance_max )
    -- SenorRagequit 23.03.23
    -- Teleports the unit to the player, if the player is in X distance_max around the unit but not closer than Y distance_min

    if entity == "" or entity == nil then
        LogService:Log("UnitTeleport:TeleportUnitToPlayerIfPlayerInDistanceBetween: Error - No entity entered")
        return
    end

    if player == "" or player == nil then
        player = PlayerService:GetPlayerControlledEnt(0)
        LogService:Log("UnitTeleport:TeleportUnitToPlayerIfPlayerInDistanceBetween: Error - No player entered")
    end

    if distance_min == "" or distance_min == nil then
        distance_min = 5.0
        LogService:Log("UnitTeleport:TeleportUnitToPlayerIfPlayerInDistanceBetween: Error - No distance_min entered")
    end

    if distance_max == "" or distance_max == nil then
        distance_max = 10.0
        LogService:Log("UnitTeleport:TeleportUnitToPlayerIfPlayerInDistanceBetween: Error - No distance_max entered")
    end

    local actual_distance = EntityService:GetDistanceBetween( entity, player )

    if ( actual_distance >= distance_min and actual_distance <= distance_max ) then
        local emptyspot = FindService:FindEmptySpotInRadius( player, 1, 5, "", "")
        PlayerService:TeleportPlayer( entity, emptyspot.second , 0.2, 0.1, 0.2 )
        return true
    end

end

return UnitTeleport