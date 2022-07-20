require("lua/utils/reflection.lua")
require("lua/utils/numeric_utils.lua")

local Projectile = {}

local EMPTY_EFFECT = ""

function Projectile:GetWorldHitEffect( entity )
    -- SenorRagequit 19.07.22
    local projectileammocomponent = reflection_helper( EntityService:GetComponent( entity, "ProjectileAmmoComponent") )
    if projectileammocomponent ~= nil then
        local worldhiteffect = projectileammocomponent.on_world_hit_effect
        return worldhiteffect
    end

    LogService:Log("Projectile:GetWorldHitEffect: Error - Invalid projectileammocomponent")
    return EMPTY_EFFECT
end

function Projectile:GetResistedHitEffect( entity )
    -- SenorRagequit 19.07.22
    local projectileammocomponent = reflection_helper( EntityService:GetComponent( entity, "ProjectileAmmoComponent") )
    if projectileammocomponent ~= nil then
        local resistedhiteffect = projectileammocomponent.on_resisted_hit_effect
        return resistedhiteffect
    end

    LogService:Log("Projectile:GetResistedHitEffect: Error - Invalid projectileammocomponent")
    return EMPTY_EFFECT
end

function Projectile:GetShieldHitEffect( entity )
    -- SenorRagequit 19.07.22
    local projectileammocomponent = reflection_helper( EntityService:GetComponent( entity, "ProjectileAmmoComponent") )
    if projectileammocomponent ~= nil then
        local shieldhiteffect = projectileammocomponent.on_shield_hit_effect
        return shieldhiteffect
    end

    LogService:Log("Projectile:GetShieldHitEffect: Error - Invalid projectileammocomponent")
    return EMPTY_EFFECT
end

function Projectile:GetEnemyHitEffect( entity )
    -- SenorRagequit 19.07.22
    local projectileammocomponent = reflection_helper( EntityService:GetComponent( entity, "ProjectileAmmoComponent") )
    if projectileammocomponent ~= nil then
        local enemyhiteffect = projectileammocomponent.on_enemy_hit_effect
        return enemyhiteffect
    end

    LogService:Log("Projectile:GetEnemyHitEffect: Error - Invalid projectileammocomponent")
    return EMPTY_EFFECT
end

function Projectile:GetTargetId( entity )
    -- SenorRagequit 19.07.22
    local projectileammocomponent = reflection_helper( EntityService:GetComponent( entity, "ProjectileAmmoComponent") )
    if projectileammocomponent ~= nil then
        local targetid = projectileammocomponent.target
        return targetid.id
    end

    LogService:Log("Projectile:GetTargetId: Error - Invalid projectileammocomponent")
    return INVALID_ID
end

return Projectile