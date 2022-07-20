require("lua/utils/reflection.lua")
require("lua/utils/numeric_utils.lua")

local PlayStats = {}

local EMPTY_ENT_ID = INVALID_ID
local EMPTY_EFFECT = ""
local EMPTY_NUM = 0.0


function PlayStats:GetSumEnemyUnitsKilled( )
    -- SenorRagequit 20.07.22
    local campaignstatssystemcomponent = reflection_helper( EntityService:GetSingletonComponent("CampaignStatsSystemComponent") )
    if campaignstatssystemcomponent ~= nil then
       local sumenemyunitskilled = self:FindStatName("EnemyUnitsKilled")
       return sumenemyunitskilled
    end

    LogService:Log("PlayStats:GetSumEnemyUnitsKilled: Error - Invalid CampaignStatsSystemComponent")
    return EMPTY_NUM
end

function PlayStats:GetSumPlayerDeathCount( )
    -- SenorRagequit 20.07.22
    local campaignstatssystemcomponent = reflection_helper( EntityService:GetSingletonComponent("CampaignStatsSystemComponent") )
    if campaignstatssystemcomponent ~= nil then
       local sumplayerdeathcount = self:FindStatName("PlayerDeath")
       return sumplayerdeathcount
    end

    LogService:Log("PlayStats:GetSumPlayerDeathCount: Error - Invalid CampaignStatsSystemComponent")
    return EMPTY_NUM
end

function PlayStats:GetSumPlayerDamageDealt( )
    -- SenorRagequit 20.07.22
    local campaignstatssystemcomponent = reflection_helper( EntityService:GetSingletonComponent("CampaignStatsSystemComponent") )
    if campaignstatssystemcomponent ~= nil then
       local sumplayerdamagedealt = self:FindStatName("PlayerDamageDoneByTarget")
       return sumplayerdamagedealt
    end

    LogService:Log("PlayStats:GetSumPlayerDamageDealt: Error - Invalid CampaignStatsSystemComponent")
    return EMPTY_NUM
end

function PlayStats:GetSumPlayerDamageReceived( )
    -- SenorRagequit 20.07.22
    local campaignstatssystemcomponent = reflection_helper( EntityService:GetSingletonComponent("CampaignStatsSystemComponent") )
    if campaignstatssystemcomponent ~= nil then
       local sumplayerdamagereceived = self:FindStatName("PlayerDamageTakenByOwner")
       return sumplayerdamagereceived
    end

    LogService:Log("PlayStats:GetSumPlayerDamageReceived: Error - Invalid CampaignStatsSystemComponent")
    return EMPTY_NUM
end

function PlayStats:GetSumSkillUsed( )
    -- SenorRagequit 20.07.22
    local campaignstatssystemcomponent = reflection_helper( EntityService:GetSingletonComponent("CampaignStatsSystemComponent") )
    if campaignstatssystemcomponent ~= nil then
       local sumskillused = self:FindStatName("SkillUsed")
       return sumskillused
    end

    LogService:Log("PlayStats:GetSumSkillUsed: Error - Invalid CampaignStatsSystemComponent")
    return EMPTY_NUM
end

function PlayStats:GetSumBuildingCreated( )
    -- SenorRagequit 20.07.22
    local campaignstatssystemcomponent = reflection_helper( EntityService:GetSingletonComponent("CampaignStatsSystemComponent") )
    if campaignstatssystemcomponent ~= nil then
       local sumbuildingcreated = self:FindStatName("BuildingCreated")
       return sumbuildingcreated
    end

    LogService:Log("PlayStats:GetSumBuildingCreated: Error - Invalid CampaignStatsSystemComponent")
    return EMPTY_NUM
end

function PlayStats:GetSumBuildingUpgraded( )
    -- SenorRagequit 20.07.22
    local campaignstatssystemcomponent = reflection_helper( EntityService:GetSingletonComponent("CampaignStatsSystemComponent") )
    if campaignstatssystemcomponent ~= nil then
       local sumbuildingupgraded = self:FindStatName("BuildingUpgraded")
       return sumbuildingupgraded
    end

    LogService:Log("PlayStats:GetSumBuildingUpgraded: Error - Invalid CampaignStatsSystemComponent")
    return EMPTY_NUM
end

function PlayStats:GetSumBuildingSold( )
    -- SenorRagequit 20.07.22
    local campaignstatssystemcomponent = reflection_helper( EntityService:GetSingletonComponent("CampaignStatsSystemComponent") )
    if campaignstatssystemcomponent ~= nil then
       local sumbuildingsold = self:FindStatName("BuildingSold")
       return sumbuildingsold
    end

    LogService:Log("PlayStats:GetSumBuildingSold: Error - Invalid CampaignStatsSystemComponent")
    return EMPTY_NUM
end

function PlayStats:GetSumBuildingDestroyed( )
    -- SenorRagequit 20.07.22
    local campaignstatssystemcomponent = reflection_helper( EntityService:GetSingletonComponent("CampaignStatsSystemComponent") )
    if campaignstatssystemcomponent ~= nil then
       local sumbuildingdestroyed = self:FindStatName("BuildingDestroyed")
       return sumbuildingdestroyed
    end

    LogService:Log("PlayStats:GetSumBuildingDestroyed: Error - Invalid CampaignStatsSystemComponent")
    return EMPTY_NUM
end

function PlayStats:GetSumNeutralUnitsKilled( )
    -- SenorRagequit 20.07.22
    local campaignstatssystemcomponent = reflection_helper( EntityService:GetSingletonComponent("CampaignStatsSystemComponent") )
    if campaignstatssystemcomponent ~= nil then
       local sumneutralunitskilled = self:FindStatName("NeutralUnitsKilled")
       return sumneutralunitskilled
    end

    LogService:Log("PlayStats:GetSumNeutralUnitsKilled: Error - Invalid CampaignStatsSystemComponent")
    return EMPTY_NUM
end


------------------------------------------------------------------------------------------------------------
-- HELPER ---- HELPER ---- HELPER ---- HELPER ---- HELPER ---- HELPER ---- HELPER ---- HELPER ---- HELPER --
------------------------------------------------------------------------------------------------------------


function PlayStats:FindStatName( searched_stat_name )
    local campaignstatssystemcomponent = reflection_helper( EntityService:GetSingletonComponent("CampaignStatsSystemComponent") )
    local stats = campaignstatssystemcomponent.aggregates
    for i=1,stats.count do
        local stat = stats[i]
        local stat_name = self:GetStatName( stat.key )
        
        if stat_name == searched_stat_name then
            local stat_total = stat.value.total
            return stat_total
        end
    end
end

function PlayStats:GetStatName( stat_type )
    local names = {
        "PlaytimeElapsed",
        "ResourceProduced",
        "ResourceConsumed",
        "ResourceLooted",
        "BuildingCreated",
        "BuildingUpgraded",
        "BuildingSold",
        "BuildingDestroyed",
        "ObjectiveCompleted",
        "ObjectiveFailed",
        "MissionCompleted",
        "MissionFailed",
        "ItemCrafted",
        "ItemLooted",
        "ConsumableUsed",
        "SkillUsed",
        "ResearchCompleted",
        "PlayerDeath",
        "PlayerDamageTakenByType",
        "PlayerDamageTakenByOwner",
        "PlayerDamageDoneByType",
        "PlayerDamageDoneByTarget",
        "PlayerDamageDoneByCreator",
        "PlayerDamageDoneByOwner",
        "EnemyUnitsKilled",
        "NeutralUnitsKilled",
        "CheatsUsed",
        "DifficultyFinished",
        "CampaignFinished",
        "ItemLost",
        "BuildingsDamageDoneByCreator",
        "BuildingsDamageDoneByType",
        "BuildingsDamageTakenByType",
        "BuildingsDamageTakenByOwner"
    }

    return names[ stat_type + 1]
end

return PlayStats