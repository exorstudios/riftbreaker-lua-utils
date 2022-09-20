require("lua/utils/numeric_utils.lua")


-- NOTE:
-- Currently this script only supports 1x1 buildings, f.e a wall which can check if there are other walls around it
-- This scripts checks for Top, Right, Bottom, Left, nothing diagonally
--

local Adjacent = {}

local EMPTY_BLUEPRINT = ""

function Adjacent:HasAdjacentTop( building_entity )
    -- SenorRagequit 20.09.22
	local l_BuildingCoordinatesVec3 = EntityService:GetPosition( building_entity )
	
	if (BuildingService:IsSpaceOccupied( { x = l_BuildingCoordinatesVec3.x+2, y = l_BuildingCoordinatesVec3.y, z = l_BuildingCoordinatesVec3.z }, "", "" ) == false ) then
		return false
	else
		return true
	end
end

function Adjacent:HasAdjacentBottom( building_entity )
    -- SenorRagequit 20.09.22
	local l_BuildingCoordinatesVec3 = EntityService:GetPosition( building_entity )
	
	if (BuildingService:IsSpaceOccupied( { x = l_BuildingCoordinatesVec3.x-2, y = l_BuildingCoordinatesVec3.y, z = l_BuildingCoordinatesVec3.z }, "", "" ) == false ) then
		return false
	else
		return true
	end
end

function Adjacent:HasAdjacentRight( building_entity )
    -- SenorRagequit 20.09.22
	local l_BuildingCoordinatesVec3 = EntityService:GetPosition( building_entity )

	if (BuildingService:IsSpaceOccupied( { x = l_BuildingCoordinatesVec3.x, y = l_BuildingCoordinatesVec3.y, z = l_BuildingCoordinatesVec3.z+2 }, "", "" ) == false ) then
		return false
	else
		return true
	end
end

function Adjacent:HasAdjacentLeft( building_entity )
    -- SenorRagequit 20.09.22
	local l_BuildingCoordinatesVec3 = EntityService:GetPosition( building_entity )

	if (BuildingService:IsSpaceOccupied( { x = l_BuildingCoordinatesVec3.x, y = l_BuildingCoordinatesVec3.y, z = l_BuildingCoordinatesVec3.z-2 }, "", "" ) == false ) then
		return false
	else
		return true
	end
end



function Adjacent:GetAdjacentBuildingBlueprintTop( building_entity )
    -- SenorRagequit 20.09.22
	local l_BuildingCoordinatesVec3 = EntityService:GetPosition( building_entity )

	if self:HasAdjacentTop( building_entity ) == true then
		local l_BuildingBlueprint = self:GetBuildingBlueprintOnPosition( l_BuildingCoordinatesVec3.x+2, l_BuildingCoordinatesVec3.y, l_BuildingCoordinatesVec3.z )
		return l_BuildingBlueprint
	else
		return EMPTY_BLUEPRINT
	end
end

function Adjacent:GetAdjacentBuildingBlueprintBottom( building_entity )
    -- SenorRagequit 20.09.22
	local l_BuildingCoordinatesVec3 = EntityService:GetPosition( building_entity )

	if self:HasAdjacentBottom( building_entity ) == true then
		local l_BuildingBlueprint = self:GetBuildingBlueprintOnPosition( l_BuildingCoordinatesVec3.x-2, l_BuildingCoordinatesVec3.y, l_BuildingCoordinatesVec3.z )
		return l_BuildingBlueprint
	else
		return EMPTY_BLUEPRINT
	end
end

function Adjacent:GetAdjacentBuildingBlueprintRight( building_entity )
    -- SenorRagequit 20.09.22
	local l_BuildingCoordinatesVec3 = EntityService:GetPosition( building_entity )

	if self:HasAdjacentRight( building_entity ) == true then
		local l_BuildingBlueprint = self:GetBuildingBlueprintOnPosition( l_BuildingCoordinatesVec3.x, l_BuildingCoordinatesVec3.y, l_BuildingCoordinatesVec3.z+2 )
		return l_BuildingBlueprint
	else
		return EMPTY_BLUEPRINT
	end
end

function Adjacent:GetAdjacentBuildingBlueprintLeft( building_entity )
    -- SenorRagequit 20.09.22
	local l_BuildingCoordinatesVec3 = EntityService:GetPosition( building_entity )

	if self:HasAdjacentLeft( building_entity ) == true then
		local l_BuildingBlueprint = self:GetBuildingBlueprintOnPosition( l_BuildingCoordinatesVec3.x, l_BuildingCoordinatesVec3.y, l_BuildingCoordinatesVec3.z-2 )
		return l_BuildingBlueprint
	else
		return EMPTY_BLUEPRINT
	end
end



function Adjacent:DebugConsolePrintAdjacentBlueprintTop( building_entity )
    -- SenorRagequit 20.09.22
	local l_BuildingCoordinatesVec3 = EntityService:GetPosition( building_entity )

	ConsoleService:Write("---------------- ")
	ConsoleService:Write("---------------- ")
	ConsoleService:Write("- Adjacent Blueprint Top -")
	
	if self:HasAdjacentTop( building_entity ) == true then
		local l_BuildingBlueprint = self:GetBuildingBlueprintOnPosition( l_BuildingCoordinatesVec3.x+2, l_BuildingCoordinatesVec3.y, l_BuildingCoordinatesVec3.z )
		ConsoleService:Write(l_BuildingBlueprint)
	else
		ConsoleService:Write("Adjacent:DebugConsolePrintAdjacentBlueprintTop: No building found")
	end

	ConsoleService:Write("---------------- ")

end

function Adjacent:DebugConsolePrintAdjacentBlueprintBottom( building_entity )
    -- SenorRagequit 20.09.22
	local l_BuildingCoordinatesVec3 = EntityService:GetPosition( building_entity )

	ConsoleService:Write("---------------- ")
	ConsoleService:Write("---------------- ")
	ConsoleService:Write("- Adjacent Blueprint Bottom -")
	
	if self:HasAdjacentBottom( building_entity ) == true then
		local l_BuildingBlueprint = self:GetBuildingBlueprintOnPosition( l_BuildingCoordinatesVec3.x-2, l_BuildingCoordinatesVec3.y, l_BuildingCoordinatesVec3.z )
		ConsoleService:Write(l_BuildingBlueprint)
	else
		ConsoleService:Write("Adjacent:DebugConsolePrintAdjacentBlueprintBottom: No building found")
	end

	ConsoleService:Write("---------------- ")

end

function Adjacent:DebugConsolePrintAdjacentBlueprintRight( building_entity )
    -- SenorRagequit 20.09.22
	local l_BuildingCoordinatesVec3 = EntityService:GetPosition( building_entity )

	ConsoleService:Write("---------------- ")
	ConsoleService:Write("---------------- ")
	ConsoleService:Write("- Adjacent Blueprint Right -")
	
	if self:HasAdjacentRight( building_entity ) == true then
		local l_BuildingBlueprint = self:GetBuildingBlueprintOnPosition( l_BuildingCoordinatesVec3.x, l_BuildingCoordinatesVec3.y, l_BuildingCoordinatesVec3.z+2 )
		ConsoleService:Write(l_BuildingBlueprint)
	else
		ConsoleService:Write("Adjacent:DebugConsolePrintAdjacentBlueprintRight: No building found")
	end

	ConsoleService:Write("---------------- ")

end

function Adjacent:DebugConsolePrintAdjacentBlueprintLeft( building_entity )
    -- SenorRagequit 20.09.22
	local l_BuildingCoordinatesVec3 = EntityService:GetPosition( building_entity )

	ConsoleService:Write("---------------- ")
	ConsoleService:Write("---------------- ")
	ConsoleService:Write("- Adjacent Blueprint Left -")
	
	if self:HasAdjacentLeft( building_entity ) == true then
		local l_BuildingBlueprint = self:GetBuildingBlueprintOnPosition( l_BuildingCoordinatesVec3.x, l_BuildingCoordinatesVec3.y, l_BuildingCoordinatesVec3.z-2 )
		ConsoleService:Write(l_BuildingBlueprint)
	else
		ConsoleService:Write("Adjacent:DebugConsolePrintAdjacentBlueprintLeft: No building found")
	end

	ConsoleService:Write("---------------- ")

end

function Adjacent:DebugConsolePrintAdjacentMap( building_entity )
    -- SenorRagequit 20.09.22
	ConsoleService:Write("---------------- ")
	ConsoleService:Write("---------------- ")
	ConsoleService:Write("- Adjacent Building Drawing -")
	
	if (self:HasAdjacentTop( building_entity ) == true ) then
		ConsoleService:Write("[ ]|[X]|[ ]")
	else
		ConsoleService:Write("[ ]|[ ]|[ ]")
	end

	if (self:HasAdjacentLeft( building_entity ) == true and self:HasAdjacentRight( building_entity ) == false) then
		ConsoleService:Write("[X]|[X]|[ ]")
	elseif (self:HasAdjacentLeft( building_entity ) == false and self:HasAdjacentRight( building_entity ) == true) then
		ConsoleService:Write("[ ]|[X]|[X]")
	elseif (self:HasAdjacentLeft( building_entity ) == true and self:HasAdjacentRight( building_entity ) == true) then
		ConsoleService:Write("[X]|[X]|[X]")
	elseif (self:HasAdjacentLeft( building_entity ) == false and self:HasAdjacentRight( building_entity ) == false) then
		ConsoleService:Write("[ ]|[X]|[ ]")
	end

	if (self:HasAdjacentBottom( building_entity ) == true) then
		ConsoleService:Write("[ ]|[X]|[ ]")
	else
		ConsoleService:Write("[ ]|[ ]|[ ]")
	end

	ConsoleService:Write("---------------- ")

end



function Adjacent:CountAdjacent( building_entity )
    -- SenorRagequit 20.09.22
	local l_AdjacentCount = 0

	if self:HasAdjacentTop( building_entity ) then
		l_AdjacentCount = l_AdjacentCount+1
	end
	if self:HasAdjacentBottom( building_entity ) then
		l_AdjacentCount = l_AdjacentCount+1
	end
	if self:HasAdjacentRight( building_entity ) then
		l_AdjacentCount = l_AdjacentCount+1
	end
	if self:HasAdjacentLeft( building_entity ) then
		l_AdjacentCount = l_AdjacentCount+1
	end
	
	return l_AdjacentCount
end

------------------------------------------------------------------------------------------------------------
-- HELPER ---- HELPER ---- HELPER ---- HELPER ---- HELPER ---- HELPER ---- HELPER ---- HELPER ---- HELPER --
------------------------------------------------------------------------------------------------------------

function Adjacent:GetBuildingBlueprintOnPosition( PosX, PosY, PosZ )
    -- Lukaasm 19.09.22
    local min = { x = math.floor( PosX / 2.0 ) * 2.0 + 0.5, y = -10, z = math.floor( PosZ / 2.0 ) * 2.0 + 0.5 }
    local max = { x = min.x + 1.0, y = 10, z = min.z + 1.0 }

    local entities = FindService:FindGridOwnersByBox( min, max )
    for entity in Iter(entities) do
        local mode = BuildingService:GetBuildingMode(entity)
        if mode ~= BM_INVALID then
            return EntityService:GetBlueprintName( entity )
        end
    end

    return nil
end

return Adjacent