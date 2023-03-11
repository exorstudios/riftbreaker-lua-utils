require("lua/utils/reflection.lua")
require("lua/utils/numeric_utils.lua")

local UnitSpawner = {}

local EMPTY_ENT_ID = INVALID_ID
local EMPTY_EFFECT = ""
local EMPTY_NUM = 0.0

function UnitSpawner:SpawnUnitOnceByRange( entity_to_spawn, target_entity_to_spawn_around, min_range, max_range, team )
    -- SenorRagequit 10.03.23

    if entity_to_spawn == "" or entity_to_spawn == nil then
        entity_to_spawn = "units/ground/canoptrix"
        LogService:Log("UnitSpawner:SpawnUnitOnceByRange: Error - No entity to spawn entered")
    end

    if target_entity_to_spawn_around == "" or target_entity_to_spawn_around == nil then
        target_entity_to_spawn_around = PlayerService:GetPlayerControlledEnt(0)
        LogService:Log("UnitSpawner:SpawnUnitOnceByRange: Error - No target entity to spawn around entered")
    end

    if min_range == "" or min_range == nil then
        min_range = 3.0
        LogService:Log("UnitSpawner:SpawnUnitOnceByRange: Error - No minimal range entered")
    end

    if max_range == "" or max_range == nil then
        max_range = 5.0
        LogService:Log("UnitSpawner:SpawnUnitOnceByRange: Error - No maximal range entered")
    end

    if team == "" or team == nil then
        team = PlayerService:GetPlayerControlledEnt(0) 
        LogService:Log("UnitSpawner:SpawnUnitOnceByRange: Error - No team entered")
    end

    local l_emptyspot = FindService:FindEmptySpotInRadius( target_entity_to_spawn_around, min_range, max_range, "", "")
    local l_spawnedentity = EntityService:SpawnEntity( entity_to_spawn, l_emptyspot.second, EntityService:GetTeam( team ) )
    if team == "enemy" or team == "wave_enemy" then
        UnitService:SetInitialState( l_spawnedentity, UNIT_AGGRESSIVE)
        LogService:Log("UnitSpawner:SpawnUnitOnceByRange: Warning - Team equals enemy or wave_enemy, entity state set to aggressive")
    end

end


return UnitSpawner