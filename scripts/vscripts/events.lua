-- This file contains all barebones-registered events and has already set up the passed-in parameters for your use.

-- Cleanup a player when they leave
function GameMode:OnDisconnect(keys)
  DebugPrint('[BAREBONES] Player Disconnected ' .. tostring(keys.userid))
  DebugPrintTable(keys)

  local name = keys.name
  local networkid = keys.networkid
  local reason = keys.reason
  local userid = keys.userid

end
-- The overall game state has changed
function GameMode:OnGameRulesStateChange(keys)
  DebugPrint("[BAREBONES] GameRules State Changed")
  DebugPrintTable(keys)

  local newState = GameRules:State_Get()
end

-- An NPC has spawned somewhere in game.  This includes heroes
function GameMode:OnNPCSpawned(keys)
  DebugPrint("[BAREBONES] NPC Spawned")
  DebugPrintTable(keys)

  local npc = EntIndexToHScript(keys.entindex)
end

-- An entity somewhere has been hurt.  This event fires very often with many units so don't do too many expensive
-- operations here
function GameMode:OnEntityHurt(keys)
  --DebugPrint("[BAREBONES] Entity Hurt")
  --DebugPrintTable(keys)

  local damagebits = keys.damagebits -- This might always be 0 and therefore useless
  if keys.entindex_attacker ~= nil and keys.entindex_killed ~= nil then
    local entCause = EntIndexToHScript(keys.entindex_attacker)
    local entVictim = EntIndexToHScript(keys.entindex_killed)

    -- The ability/item used to damage, or nil if not damaged by an item/ability
    local damagingAbility = nil

    if keys.entindex_inflictor ~= nil then
      damagingAbility = EntIndexToHScript( keys.entindex_inflictor )
    end
  end
end

-- An item was picked up off the ground
function GameMode:OnItemPickedUp(keys)
  DebugPrint( '[BAREBONES] OnItemPickedUp' )
  DebugPrintTable(keys)

  local unitEntity = nil
  if keys.UnitEntitIndex then
    unitEntity = EntIndexToHScript(keys.UnitEntitIndex)
  elseif keys.HeroEntityIndex then
    unitEntity = EntIndexToHScript(keys.HeroEntityIndex)
  end

  local itemEntity = EntIndexToHScript(keys.ItemEntityIndex)
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local itemname = keys.itemname
end

-- A player has reconnected to the game.  This function can be used to repaint Player-based particles or change
-- state as necessary
function GameMode:OnPlayerReconnect(keys)
  DebugPrint( '[BAREBONES] OnPlayerReconnect' )
  DebugPrintTable(keys) 
end

-- An item was purchased by a player
function GameMode:OnItemPurchased( keys )
  DebugPrint( '[BAREBONES] OnItemPurchased' )
  DebugPrintTable(keys)

  -- The playerID of the hero who is buying something
  local plyID = keys.PlayerID
  if not plyID then return end

  -- The name of the item purchased
  local itemName = keys.itemname 
  
  -- The cost of the item purchased
  local itemcost = keys.itemcost
  
end

-- An ability was used by a player
function GameMode:OnAbilityUsed(keys)
  DebugPrint('[BAREBONES] AbilityUsed')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local abilityname = keys.abilityname
end

-- A non-player entity (necro-book, chen creep, etc) used an ability
function GameMode:OnNonPlayerUsedAbility(keys)
  DebugPrint('[BAREBONES] OnNonPlayerUsedAbility')
  DebugPrintTable(keys)

  local abilityname=  keys.abilityname
end

-- A player changed their name
function GameMode:OnPlayerChangedName(keys)
  DebugPrint('[BAREBONES] OnPlayerChangedName')
  DebugPrintTable(keys)

  local newName = keys.newname
  local oldName = keys.oldName
end

-- A player leveled up an ability
function GameMode:OnPlayerLearnedAbility( keys)
  DebugPrint('[BAREBONES] OnPlayerLearnedAbility')
  DebugPrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local abilityname = keys.abilityname
end

-- A channelled ability finished by either completing or being interrupted
function GameMode:OnAbilityChannelFinished(keys)
  DebugPrint('[BAREBONES] OnAbilityChannelFinished')
  DebugPrintTable(keys)

  local abilityname = keys.abilityname
  local interrupted = keys.interrupted == 1
end

-- A player leveled up
function GameMode:OnPlayerLevelUp(keys)
  DebugPrint('[BAREBONES] OnPlayerLevelUp')
  DebugPrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local level = keys.level
end

-- A player last hit a creep, a tower, or a hero
function GameMode:OnLastHit(keys)
  DebugPrint('[BAREBONES] OnLastHit')
  DebugPrintTable(keys)

  local isFirstBlood = keys.FirstBlood == 1
  local isHeroKill = keys.HeroKill == 1
  local isTowerKill = keys.TowerKill == 1
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local killedEnt = EntIndexToHScript(keys.EntKilled)
end

-- A tree was cut down by tango, quelling blade, etc
function GameMode:OnTreeCut(keys)
  DebugPrint('[BAREBONES] OnTreeCut')
  DebugPrintTable(keys)

  local treeX = keys.tree_x
  local treeY = keys.tree_y
end

-- A rune was activated by a player
function GameMode:OnRuneActivated (keys)
  DebugPrint('[BAREBONES] OnRuneActivated')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local rune = keys.rune

  --[[ Rune Can be one of the following types
  DOTA_RUNE_DOUBLEDAMAGE
  DOTA_RUNE_HASTE
  DOTA_RUNE_HAUNTED
  DOTA_RUNE_ILLUSION
  DOTA_RUNE_INVISIBILITY
  DOTA_RUNE_BOUNTY
  DOTA_RUNE_MYSTERY
  DOTA_RUNE_RAPIER
  DOTA_RUNE_REGENERATION
  DOTA_RUNE_SPOOKY
  DOTA_RUNE_TURBO
  ]]
end

-- A player took damage from a tower
function GameMode:OnPlayerTakeTowerDamage(keys)
  DebugPrint('[BAREBONES] OnPlayerTakeTowerDamage')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local damage = keys.damage
end

-- A player picked a hero
function GameMode:OnPlayerPickHero(keys)
  DebugPrint('[BAREBONES] OnPlayerPickHero')
  DebugPrintTable(keys)

  local heroClass = keys.hero
  local heroEntity = EntIndexToHScript(keys.heroindex)
  local player = EntIndexToHScript(keys.player)
  local playerID = heroEntity:GetPlayerID()
  
  --initialize values for later use
  self.players[playerID] = player
  
  self.unitCount[playerID] = 0
  
  self.playerUnitSelected[playerID] = "npc_dota_neutral_harpy_scout"
  
  --these for the triggers
  self.unitsCenter[playerID] = 0
  
  self.unitsTOne[playerID] = 0
  self.unitsTTwo[playerID] = 0
  self.unitsTThree[playerID] = 0
  self.unitsTFour[playerID] = 0

  
  local teamIndex = 1
  
  for baseNum = 1, 1 do
	local teamNum = self.teamNumbers[teamIndex]
	local baseExisting = Entities:FindByName(nil, "barrack " .. teamIndex)
	
	local base = nil
	
	local baseEntityNearSpawner = Entities:FindAllInSphere(baseExisting:GetOrigin(), 100)
	
	for _, unit in pairs(baseEntityNearSpawner) do
		if unit:GetName() == "npc_dota_creature" then
			if unit:GetUnitName() == "base" then
				base = unit
			end
		end
	end
	
	if(base == nil) then
		print("******** Error finding base for player " .. baseNum)
	end
	
	if(base:GetTeam() == heroEntity:GetTeam()) then
	
		local newBasePosition = base:GetOrigin()
		local newBase = CreateUnitByName("base", newBasePosition, true, heroEntity, heroEntity, heroEntity:GetTeam())
	
		newBase:SetOwner(heroEntity)
		newBase:SetControllableByPlayer(playerID, true)
		
		
		local spawnUnit = newBase:FindAbilityByName("unit_trainer")
		
		print(spawnUnit)
		
		newBase:CastAbilityNoTarget(spawnUnit, -1)
	
	end
	
	base:Destroy()
	
	
	
	local selectorExisting = Entities:FindByName(nil, "unitSelector" .. teamIndex)
	
	local selector = nil
	
	local selectorEntityNearSpawner = Entities:FindAllInSphere(selectorExisting:GetOrigin(), 100)
	
	for _, unit in pairs(selectorEntityNearSpawner) do
		if unit:GetName() == "npc_dota_creature" then
			if unit:GetUnitName() == "base_unit_selector" then
				selector = unit
			end
		end
	end
	
	if(selector == nil) then
		print("******** Error finding base for player " .. baseNum)
	end
	
	if(selector:GetTeam() == heroEntity:GetTeam()) then
	
		local newSelectorPosition = selector:GetOrigin()
		local newSelector = CreateUnitByName("base_unit_selector", newSelectorPosition, true, heroEntity, heroEntity, heroEntity:GetTeam())
		DebugPrintTable(newSelector)
		newSelector:SetOwner(heroEntity)
		newSelector:SetControllableByPlayer(playerID, true)
	
	end
	
	selector:Destroy()
	
	
  end
  

  
end

--function to set up the players based
function GameMode:SetUpBases()

	DebugPrint("***************PREPARING TO SETUP BASES**************")

	local teamIndex = 1
	
	DebugPrint("***************BASE**************")
	for baseNum = 1, 4 do
		local teamNum = self.teamNumbers[teamIndex]
		
		local currBarrack = Entities:FindByName(nil, "barrack " .. teamIndex)
		
		DebugPrint(currBarrack:GetOrigin())
		
		local makeBarrack = CreateUnitByName("base", currBarrack:GetOrigin(), false, nil, nil, teamNum)
		
		
		DebugPrint("Accessing Ability Count")
		DebugPrint(makeBarrack:GetAbilityCount())
		DebugPrint(makeBarrack:GetAbilityByIndex(0))

		
		DebugPrint("Accessing Unit Data")
		DebugPrintTable(makeBarrack)

		makeBarrack:SetTeam(teamNum)
		
		
		teamIndex = teamIndex + 1
	end
	DebugPrint("***************DONE WITH SETUP BASES**************")
	
	

end

function GameMode:SetUpUnitSelectors()

DebugPrint("***************PREPARING TO SETUP Selectors**************")

	local teamIndex = 1
	
	DebugPrint("***************Selectors**************")
	for baseNum = 1, 4 do
		local teamNum = self.teamNumbers[teamIndex]
		
		local currSelector = Entities:FindByName(nil, "unitSelector" .. teamIndex)
		
		
		local makeSelector = CreateUnitByName("base_unit_selector", currSelector:GetOrigin(), false, nil, nil, teamNum)
		
	

		makeSelector:SetTeam(teamNum)
		
		
		teamIndex = teamIndex + 1
	end
	DebugPrint("***************DONE WITH SETUP Selectors**************")
	

end

--function to set up the outposts
function GameMode:SetUpOutposts()

	DebugPrint("***************PREPARING TO SETUP OUTPOSTS**************")

	
	for baseNum = 1, 4 do
		
		local currTower = Entities:FindByName(nil, "tower " .. baseNum)
		
		
		local makeTower = CreateUnitByName("creeparena_custom_outpost", currTower:GetOrigin(), false, nil, nil, -1)


	end
	DebugPrint("***************DONE WITH SETUP OUTPOSTS**************")
	
	

end

-- A player killed another player in a multi-team context
function GameMode:OnTeamKillCredit(keys)
  DebugPrint('[BAREBONES] OnTeamKillCredit')
  DebugPrintTable(keys)

  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local victimPlayer = PlayerResource:GetPlayer(keys.victim_userid)
  local numKills = keys.herokills
  local killerTeamNumber = keys.teamnumber
end

-- An entity died
function GameMode:OnEntityKilled( keys )
  DebugPrint( '[BAREBONES] OnEntityKilled Called' )
  DebugPrintTable( keys )
  

  -- The Unit that was Killed
  local killedUnit = EntIndexToHScript( keys.entindex_killed )
  -- The Killing entity
  local killerEntity = nil

  if keys.entindex_attacker ~= nil then
    killerEntity = EntIndexToHScript( keys.entindex_attacker )
  end

  -- The ability/item used to kill, or nil if not killed by an item/ability
  local killerAbility = nil

  if keys.entindex_inflictor ~= nil then
    killerAbility = EntIndexToHScript( keys.entindex_inflictor )
  end

  local damagebits = keys.damagebits -- This might always be 0 and therefore useless

  -- Put code here to handle when an entity gets killed
end



-- This function is called 1 to 2 times as the player connects initially but before they 
-- have completely connected
function GameMode:PlayerConnect(keys)
  DebugPrint('[BAREBONES] PlayerConnect')
  DebugPrintTable(keys)
end

-- This function is called once when the player fully connects and becomes "Ready" during Loading
function GameMode:OnConnectFull(keys)
  DebugPrint('[BAREBONES] OnConnectFull')
  DebugPrintTable(keys)
  
  local entIndex = keys.index+1
  -- The Player entity of the joining user
  local ply = EntIndexToHScript(entIndex)
  
  -- The Player ID of the joining player
  local playerID = ply:GetPlayerID()
end

-- This function is called whenever illusions are created and tells you which was/is the original entity
function GameMode:OnIllusionsCreated(keys)
  DebugPrint('[BAREBONES] OnIllusionsCreated')
  DebugPrintTable(keys)

  local originalEntity = EntIndexToHScript(keys.original_entindex)
end

-- This function is called whenever an item is combined to create a new item
function GameMode:OnItemCombined(keys)
  DebugPrint('[BAREBONES] OnItemCombined')
  DebugPrintTable(keys)

  -- The playerID of the hero who is buying something
  local plyID = keys.PlayerID
  if not plyID then return end
  local player = PlayerResource:GetPlayer(plyID)

  -- The name of the item purchased
  local itemName = keys.itemname 
  
  -- The cost of the item purchased
  local itemcost = keys.itemcost
end

-- This function is called whenever an ability begins its PhaseStart phase (but before it is actually cast)
function GameMode:OnAbilityCastBegins(keys)
  DebugPrint('[BAREBONES] OnAbilityCastBegins')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local abilityName = keys.abilityname
end

-- This function is called whenever a tower is killed
function GameMode:OnTowerKill(keys)
  DebugPrint('[BAREBONES] OnTowerKill')
  DebugPrintTable(keys)

  local gold = keys.gold
  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local team = keys.teamnumber
end

-- This function is called whenever a player changes there custom team selection during Game Setup 
function GameMode:OnPlayerSelectedCustomTeam(keys)
  DebugPrint('[BAREBONES] OnPlayerSelectedCustomTeam')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.player_id)
  local success = (keys.success == 1)
  local team = keys.team_id
end

-- This function is called whenever an NPC reaches its goal position/target
function GameMode:OnNPCGoalReached(keys)
  DebugPrint('[BAREBONES] OnNPCGoalReached')
  DebugPrintTable(keys)

  local goalEntity = EntIndexToHScript(keys.goal_entindex)
  local nextGoalEntity = EntIndexToHScript(keys.next_goal_entindex)
  local npc = EntIndexToHScript(keys.npc_entindex)
end

-- This function is called whenever any player sends a chat message to team or All
function GameMode:OnPlayerChat(keys)
  local teamonly = keys.teamonly
  local userID = keys.userid
  local playerID = self.vUserIds[userID]:GetPlayerID()

  local text = keys.text
end

function GameMode:CheckUnitCount(playerID, player)
    --print ("This player " .. playerID .. " has: " .. self.unitCount[playerID] .. " many units")
    if self.unitCount[playerID] > UNITS_PER_PLAYER - 1 then
        
       -- CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(playerID), "player_unit_cap_reached", nil)
        return false
    end
    self.unitCount[playerID] = self.unitCount[playerID] + 1

    -- Fire event to the UI that a player count has changed
    local unitCountEventData =
    {
      playerID = playerID,
      newUnitCount = self.unitCount[playerID],
    }
    CustomGameEventManager:Send_ServerToAllClients( "player_unit_count_changed", unitCountEventData )
    return true
end