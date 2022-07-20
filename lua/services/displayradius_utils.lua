require("lua/utils/reflection.lua")
require("lua/utils/numeric_utils.lua")

local DisplayRadius = {}

local EMPTY_EFFECT = ""

function DisplayRadius:GetMinRadius( entity )
    -- SenorRagequit 19.07.22
    local displayradiuscomponent = reflection_helper( EntityService:GetComponent( entity, "DisplayRadiusComponent") )
    if displayradiuscomponent ~= nil then
        local minradius = displayradiuscomponent.min_radius
        return minradius
    end

    LogService:Log("DisplayRadius:GetMinRadius: Error - Invalid DisplayRadiusComponent")
    return 0.0
end

function DisplayRadius:SetMinRadius( entity, radius )
    -- SenorRagequit 19.07.22
    local displayradiuscomponent = reflection_helper( EntityService:GetComponent( entity, "DisplayRadiusComponent") )
    if displayradiuscomponent ~= nil then
        if radius >= 0 then
            displayradiuscomponent.min_radius = radius
        else
            LogService:Log("DisplayRadius:SetMinRadius: Error - Radius has to be greater or equal 0")
        end
    else
        LogService:Log("DisplayRadius:SetMinRadius: Error - Invalid DisplayRadiusComponent")
    end
end

function DisplayRadius:GetMinRadiusBlueprint( entity )
    -- SenorRagequit 19.07.22
    local displayradiuscomponent = reflection_helper( EntityService:GetComponent( entity, "DisplayRadiusComponent") )
    if displayradiuscomponent ~= nil then
        local minradiusblueprint = displayradiuscomponent.min_radius_blueprint
        return minradiusblueprint
    end

    LogService:Log("DisplayRadius:GetMinRadiusBlueprint: Error - Invalid DisplayRadiusComponent")
    return EMPTY_EFFECT
end

function DisplayRadius:SetMinRadiusBlueprint( entity, blueprint )
    -- SenorRagequit 19.07.22
    local displayradiuscomponent = reflection_helper( EntityService:GetComponent( entity, "DisplayRadiusComponent") )
    if displayradiuscomponent ~= nil then
        displayradiuscomponent.min_radius_blueprint = blueprint
    else
        LogService:Log("DisplayRadius:SetMinRadiusBlueprint: Error - Invalid DisplayRadiusComponent")
    end
end

function DisplayRadius:GetMaxRadius( entity )
    -- SenorRagequit 19.07.22
    local displayradiuscomponent = reflection_helper( EntityService:GetComponent( entity, "DisplayRadiusComponent") )
    if displayradiuscomponent ~= nil then
        local maxradius = displayradiuscomponent.max_radius
        return maxradius
    end

    LogService:Log("DisplayRadius:GetMaxRadius: Error - Invalid DisplayRadiusComponent")
    return 0.0
end

function DisplayRadius:SetMaxRadius( entity, radius )
    -- SenorRagequit 19.07.22
    local displayradiuscomponent = reflection_helper( EntityService:GetComponent( entity, "DisplayRadiusComponent") )
    if displayradiuscomponent ~= nil then
        if radius >= 0 then
            displayradiuscomponent.max_radius = radius
        else
            LogService:Log("DisplayRadius:SetMaxRadius: Error - Radius has to be greater or equal 0")
        end
    else
        LogService:Log("DisplayRadius:SetMaxRadius: Error - Invalid DisplayRadiusComponent")
    end
end

function DisplayRadius:GetMaxRadiusBlueprint( entity )
    -- SenorRagequit 19.07.22
    local displayradiuscomponent = reflection_helper( EntityService:GetComponent( entity, "DisplayRadiusComponent") )
    if displayradiuscomponent ~= nil then
        local maxradiusblueprint = displayradiuscomponent.min_radius_blueprint
        return maxradiusblueprint
    end

    LogService:Log("DisplayRadius:GetMaxRadiusBlueprint: Error - Invalid DisplayRadiusComponent")
    return EMPTY_EFFECT
end

function DisplayRadius:SetMaxRadiusBlueprint( entity, blueprint )
    -- SenorRagequit 19.07.22
    local displayradiuscomponent = reflection_helper( EntityService:GetComponent( entity, "DisplayRadiusComponent") )
    if displayradiuscomponent ~= nil then
        displayradiuscomponent.max_radius_blueprint = blueprint
    else
        LogService:Log("DisplayRadius:SetMaxRadiusBlueprint: Error - Invalid DisplayRadiusComponent")
    end
end


return DisplayRadius