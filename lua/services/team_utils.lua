require("lua/utils/numeric_utils.lua")

local team_utils = {}

-- Count number of players in team X
function team_utils:GetTeamPlayerCount(team)
    local l_players = PlayerService:GetPlayersFromTeam(team)
    return #l_players
end


-- Remove a player from their team
function team_utils:RemovePlayerFromTeam(player)
    l_team = EntityService:GetTeam("none")
    PlayerService:SetPlayerTeam(player, l_team)
end


-- Get the team with the least amount of players out of 2 given teams
function team_utils:GetTeamWithFewerPlayersAB(team1, team2)
    local l_teamA = EntityService:GetTeam(team1)
    local l_teamB = EntityService:GetTeam(team2)

    local teamAPlayerCount = self:GetTeamPlayerCount(l_teamA)
    local teamBPlayerCount = self:GetTeamPlayerCount(l_teamB)
    
    if teamBPlayerCount < teamAPlayerCount then
        return EntityService:GetTeam(team2)
    else
        return EntityService:GetTeam(team1)
    end

    return nil
end


-- Write console output of team members
function team_utils:ConsoleWritePlayersFromTeamsAB(team1, team2)
    local l_teamA = EntityService:GetTeam(team1)
    local l_teamB = EntityService:GetTeam(team2)

    local l_teamA_players = PlayerService:GetPlayersFromTeam(l_teamA)
    local l_teamB_players = PlayerService:GetPlayersFromTeam(l_teamB)

    if #l_teamA_players > 0 then
        ConsoleService:Write(" -- " .. tostring(team1) .. " -- ")
        for _, player in pairs(l_teamA_players) do

            ConsoleService:Write("playerId: " .. tostring(player))

        end
    else
        ConsoleService:Write("Team " .. tostring(team1) .. " is empty")
    end

    if #l_teamB_players > 0 then
        ConsoleService:Write(" -- " .. tostring(team2) .. " -- ")
        for _, player in pairs(l_teamB_players) do

            ConsoleService:Write("playerId: " .. tostring(player))
        end
    else
        ConsoleService:Write("Team " .. tostring(team2) .. " is empty")
    end

end


-- Get the team with the least amount of players
-- Not active yet, missing something like EntityService:GetTeams() to get all teams
-- function team_utils:GetTeamWithFewerPlayers()
--     local l_allTeams = EntityService:GetTeams()
--     local l_playerCount = 9999
--     local l_chosenTeam = ""

--     for _, team in pairs(l_allTeams) do
--         local l_team = EntityService:GetTeam(team)
--         local l_teamPlayerCount = self:GetTeamPlayerCount(l_team)

--         if l_teamPlayerCount < l_playerCount then
--             l_playerCount = l_teamPlayerCount
--             l_chosenTeam = l_team
--         end
--     end

--     if l_chosenTeam ~= "" then
--         return l_chosenTeam
--     end

--     return nil
-- end

return team_utils