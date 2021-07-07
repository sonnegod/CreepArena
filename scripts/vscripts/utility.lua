function MoveToRallyPoint( event )
    local caster = event.caster
    local target = event.target

    local player = caster:GetPlayerOwner()
    local hero = player:GetAssignedHero()

    local playerID = player:GetPlayerID()
    --if GameMode:CheckUnitCount(playerID, player, target) == false then
    --    return
    --end

    target:SetOwner(hero)
    target:SetControllableByPlayer(playerID, true)

    -- Recolor the unit you spawned
    local color = TEAM_COLORS[caster:GetTeam()]

    -- target:SetRenderColor(color[1], color[2], color[3])
    -- target:GetChildren()[3]:SetRenderColor(color[1], color[2], color[3])
end

function GetInitialRallyPoint( event )
    local caster = event.caster
    local origin = caster:GetAbsOrigin()

    local result = {}
    if origin then
        table.insert(result,origin)
    else
        print("Error: Unit cannot be spawned.")
    end
    
    return result
end

