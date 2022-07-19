require("lua/utils/reflection.lua")
require("lua/utils/numeric_utils.lua")

local Projectile = {}

function Projectile:GetWorldHitEffect( entity )
    -- SenorRagequit 19.07.22
    local projectileammocomponent = reflection_helper( EntityService:GetComponent( entity, "ProjectileAmmoComponent") )
    if projectileammocomponent ~= nil then
        local worldhiteffect = projectileammocomponent.on_world_hit_effect
        return worldhiteffect
    else
        projectileammocomponent = INVALID_ID
        LogService:Log("Projectile:GetWorldHitEffect: Error - Invalid projectileammocomponent")
        return projectileammocomponent
    end
end

function Projectile:GetResistedHitEffect( entity )
    -- SenorRagequit 19.07.22
    local projectileammocomponent = reflection_helper( EntityService:GetComponent( entity, "ProjectileAmmoComponent") )
    if projectileammocomponent ~= nil then
        local resistedhiteffect = projectileammocomponent.on_resisted_hit_effect
        return resistedhiteffect
    else
        projectileammocomponent = INVALID_ID
        LogService:Log("Projectile:GetResistedHitEffect: Error - Invalid projectileammocomponent")
        return projectileammocomponent
    end
end

function Projectile:GetShieldHitEffect( entity )
    -- SenorRagequit 19.07.22
    local projectileammocomponent = reflection_helper( EntityService:GetComponent( entity, "ProjectileAmmoComponent") )
    if projectileammocomponent ~= nil then
        local shieldhiteffect = projectileammocomponent.on_shield_hit_effect
        return shieldhiteffect
    else
        projectileammocomponent = INVALID_ID
        LogService:Log("Projectile:GetShieldHitEffect: Error - Invalid projectileammocomponent")
        return projectileammocomponent
    end
end

function Projectile:GetEnemyHitEffect( entity )
    -- SenorRagequit 19.07.22
    local projectileammocomponent = reflection_helper( EntityService:GetComponent( entity, "ProjectileAmmoComponent") )
    if projectileammocomponent ~= nil then
        local enemyhiteffect = projectileammocomponent.on_enemy_hit_effect
        return enemyhiteffect
    else
        projectileammocomponent = INVALID_ID
        LogService:Log("Projectile:GetEnemyHitEffect: Error - Invalid projectileammocomponent")
        return projectileammocomponent
    end
end

function Projectile:GetTargetId( entity )
    -- SenorRagequit 19.07.22
    local projectileammocomponent = reflection_helper( EntityService:GetComponent( entity, "ProjectileAmmoComponent") )
    if projectileammocomponent ~= nil then
        local targetid = projectileammocomponent.target
        return targetid
    else
        projectileammocomponent = INVALID_ID
        LogService:Log("Projectile:GetTargetId: Error - Invalid projectileammocomponent")
        return projectileammocomponent
    end
end

return Projectile