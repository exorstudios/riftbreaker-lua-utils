
require("lua/utils/table_utils.lua")
require("lua/utils/reflection.lua")

local Research = {}

function Research:FindResearchNodesWithBlueprintAward( blueprint_name )
    local nodes = {}

    local research = reflection_helper( EntityService:GetSingletonComponent("ResearchSystemDataComponent") )
    local categories = research.research
    for i=1,categories.count do
        local category = categories[i]
        local category_nodes = category.nodes
        for j=1,category_nodes.count do
            local node = category_nodes[j]

            local awards = node.research_awards
            for k=1,awards.count do
                local award = awards[k]
                if award.blueprint == blueprint_name then
                    Insert( nodes, node.research_name )
                end
            end
        end
    end

    return nodes
end

function Research:FindChildNodesWithFlag(research_name, flag)
	local nodes = {}

	local IsNodeDependantOnMe = function( node )
		local requirements = node.requirements
		for i=1,requirements.count do
			local requirement = requirements[i]
			if requirement.research_name == research_name then
				return true
			end
		end

		return false
	end

	local research = reflection_helper( EntityService:GetSingletonComponent("ResearchSystemDataComponent") )
	local categories = research.research
	for i=1,categories.count do
		local category = categories[i]
		local category_nodes = category.nodes
		for j=1,category_nodes.count do
			local node = category_nodes[j]

			local is_valid = flag ~= 0 or bit.band( node.research_flags, flag ) == flag;
			if is_valid and IsNodeDependantOnMe( node ) then
				Insert( nodes, node.research_name )
			end
		end
	end

	return nodes
end

return Research;