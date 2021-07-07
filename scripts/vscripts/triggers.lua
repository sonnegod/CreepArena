function CenterOnStartTouch(trigger)

	--print(trigger.activator)
	--print(trigger.caller)
	
	local hUnit = trigger.activator
	local player = hUnit:GetOwner()
	local playerID = player:GetPlayerID()
	
	
	
	

	
	if GameMode.unitsCenter[playerID] == 0 then
		Timers:CreateTimer("giveGold " .. playerID,{
		
			useGameTime = true,
			
			callback = function()
			PlayerResource:SetGold(playerID, PlayerResource:GetGold(playerID) +1 , false)

					
				return 1.0
			end
		
		
		})
	end
	
	GameMode.unitsCenter[playerID] = GameMode.unitsCenter[playerID] + 1

	
end

function CenterOnEndTouch(trigger)

	print(trigger.activator)
	print(trigger.caller)
	
	local hUnit = trigger.activator
	local player = hUnit:GetOwner()
	local playerID = player:GetPlayerID()
	
	
	GameMode.unitsCenter[playerID] = GameMode.unitsCenter[playerID] - 1
	
	if 	GameMode.unitsCenter[playerID] == 0 then

		Timers:RemoveTimer("giveGold " .. playerID)
		print("No more units removing timer")

	end
	
end

function WhileTouching(trigger)

	local hUnit = trigger.activator
	local player = hUnit:GetPlayerOwner()
	local playerID = hUnit:GetPlayerOwnerID()
	
	--DebugPrintTable(hUnit)
	--DebugPrintTable(player)
	DebugPrint(playerID)
	
	PlayerResource:SetGold(playerID, PlayerResource:GetGold(playerID) +1 , false)
	
end

function TowerOneOnStartTouch(trigger)
		
		local hUnit = trigger.activator
		local player = hUnit:GetPlayerOwner()
		local playerID = hUnit:GetPlayerOwnerID()
		
		local outpost = nil
	
		local towerTriggered = Entities:FindByName(nil, "tower_trigger 1")
		
		local towerEntityNearSpawner = Entities:FindAllInSphere(towerTriggered:GetOrigin(), 100)
		
		for _, unit in pairs(towerEntityNearSpawner) do
			if unit:GetName() == "npc_dota_tower" then
				if unit:GetUnitName() == "creeparena_custom_outpost" then
					outpost = unit
				end
			end
		end
		
		if(outpost == nil) then
			print("******** Error finding tower 1*******")
		end
			
		GameMode.unitsTOne[playerID] = GameMode.unitsTOne[playerID] + 1

		DebugPrintTable(outpost)
		DebugPrint(outpost:GetTeam())
		DebugPrint(player:GetTeam())
	
		if(outpost:GetTeam() == 255) then
		
			outpost:SetTeam(player:GetTeam())
			outpost:SetOwner(player)
			
		else
		
			local outpostCurrOwnerID = outpost:GetPlayerOwnerID()

			if(GameMode.unitsTOne[outpostCurrOwnerID] < GameMode.unitsTOne[playerID]) then
				
				outpost:SetTeam(player:GetTeam())
				outpost:SetOwner(player)

			end
		end
		
		Timers:CreateTimer("tower1Vision", {
			
			useGameTime = true,
				
			callback = function()
					local add = AddFOWViewer(player:GetTeam(), outpost:GetOrigin(), 1600, 1, false)
					print("Added")
					print(add)
				return 1.0

			end
		})


	
end

function TowerOneOnEndTouch(trigger)

		local hUnit = trigger.activator
		local player = hUnit:GetPlayerOwner()
		local playerID = hUnit:GetPlayerOwnerID()
		
		local outpost = nil
	
		local towerTriggered = Entities:FindByName(nil, "tower_trigger 1")
		
		local towerEntityNearSpawner = Entities:FindAllInSphere(towerTriggered:GetOrigin(), 100)
		
		for _, unit in pairs(towerEntityNearSpawner) do
			if unit:GetName() == "npc_dota_tower" then
				if unit:GetUnitName() == "creeparena_custom_outpost" then
					outpost = unit
				end
			end
		end
		
		if(outpost == nil) then
			print("******** Error finding tower 1*******")
		end
			
		GameMode.unitsTOne[playerID] = GameMode.unitsTOne[playerID] - 1

		local maxUnits = GameMode.unitsTOne[0]
		local currPlayerOwner = 0
		
		for player = 1, 3 do
			if(GameMode.unitsTOne[player] > maxUnits) then
					
				local maxUnits = GameMode.unitsTOne[player]
				currPlayerOwner = player
				
			end
			
		end
		
		if(currPlayerOwner == 0 and GameMode.unitsTOne[currPlayerOwner] == 0) then
			
			Timers:RemoveTimer("tower1Vision")
			outpost:SetTeam(255)
			
		else
		
		if not outpost:GetTeam() == player:GetTeam() then
			Timers:RemoveTimer("tower1Vision")
		end
			
			
		outpost:SetTeam(player:GetTeam())
		outpost:SetOwner(player)
		end
end


function TowerTwoOnStartTouch(trigger)

		
		
		
		local hUnit = trigger.activator
		local player = hUnit:GetPlayerOwner()
		local playerID = hUnit:GetPlayerOwnerID()
		
		local outpost = nil
	
		local towerTriggered = Entities:FindByName(nil, "tower_trigger 2")
		
		local towerEntityNearSpawner = Entities:FindAllInSphere(towerTriggered:GetOrigin(), 100)
		
		for _, unit in pairs(towerEntityNearSpawner) do
			if unit:GetName() == "npc_dota_tower" then
				if unit:GetUnitName() == "creeparena_custom_outpost" then
					outpost = unit
				end
			end
		end
		
		if(outpost == nil) then
			print("******** Error finding tower 2*******")
		end
			
		GameMode.unitsTTwo[playerID] = GameMode.unitsTTwo[playerID] + 1

		DebugPrintTable(outpost)
		DebugPrint(outpost:GetTeam())
		DebugPrint(player:GetTeam())
	
		if(outpost:GetTeam() == 255) then
		
			outpost:SetTeam(player:GetTeam())
			outpost:SetOwner(player)
			
		else
		
			local outpostCurrOwnerID = outpost:GetPlayerOwnerID()

			if(GameMode.unitsTTwo[outpostCurrOwnerID] < GameMode.unitsTTwo[playerID]) then
				
				outpost:SetTeam(player:GetTeam())
				outpost:SetOwner(player)

			end
		end
		
		Timers:CreateTimer("tower2Vision", {
			
			useGameTime = true,
				
			callback = function()
					local add = AddFOWViewer(player:GetTeam(), outpost:GetOrigin()+200, 1600, 1, false)
					print("Added")
					print(add)
				return 1.0

			end
		})


		--if towerTriggered:GetPlayerOwner() == -1 then
	
end

function TowerTwoOnEndTouch(trigger)

		local hUnit = trigger.activator
		local player = hUnit:GetPlayerOwner()
		local playerID = hUnit:GetPlayerOwnerID()
		
		local outpost = nil
	
		local towerTriggered = Entities:FindByName(nil, "tower_trigger 2")
		
		local towerEntityNearSpawner = Entities:FindAllInSphere(towerTriggered:GetOrigin(), 100)
		
		for _, unit in pairs(towerEntityNearSpawner) do
			if unit:GetName() == "npc_dota_tower" then
				if unit:GetUnitName() == "creeparena_custom_outpost" then
					outpost = unit
				end
			end
		end
		
		if(outpost == nil) then
			print("******** Error finding tower 2*******")
		end
			
		GameMode.unitsTTwo[playerID] = GameMode.unitsTTwo[playerID] - 1

		local maxUnits = GameMode.unitsTTwo[0]
		local currPlayerOwner = 0
		
		for player = 1, 1 do
			if(GameMode.unitsTTwo[player] > maxUnits) then
					
				local maxUnits = GameMode.unitsTTwo[player]
				currPlayerOwner = player
				
			end
			
		end
		
		if(currPlayerOwner == 0 and GameMode.unitsTTwo[currPlayerOwner] == 0) then

			Timers:RemoveTimer("tower2Vision")
			outpost:SetTeam(255)
			
		else
		
		if not outpost:GetTeam() == player:GetTeam() then
			Timers:RemoveTimer("tower2Vision")
		end
			
		outpost:SetTeam(player:GetTeam())
		outpost:SetOwner(player)
		end
end


function TowerThreeOnStartTouch(trigger)

		
		
		
		local hUnit = trigger.activator
		local player = hUnit:GetPlayerOwner()
		local playerID = hUnit:GetPlayerOwnerID()
		
		local outpost = nil
	
		local towerTriggered = Entities:FindByName(nil, "tower_trigger 3")
		
		local towerEntityNearSpawner = Entities:FindAllInSphere(towerTriggered:GetOrigin(), 100)
		
		for _, unit in pairs(towerEntityNearSpawner) do
			if unit:GetName() == "npc_dota_tower" then
				if unit:GetUnitName() == "creeparena_custom_outpost" then
					outpost = unit
				end
			end
		end
		
		if(outpost == nil) then
			print("******** Error finding tower 3*******")
		end
			
		GameMode.unitsTThree[playerID] = GameMode.unitsTThree[playerID] + 1

		DebugPrintTable(outpost)
		DebugPrint(outpost:GetTeam())
		DebugPrint(player:GetTeam())
	
		if(outpost:GetTeam() == 255) then
		
			outpost:SetTeam(player:GetTeam())
			outpost:SetOwner(player)
			
		else
		
			local outpostCurrOwnerID = outpost:GetPlayerOwnerID()

			if(GameMode.unitsTThree[outpostCurrOwnerID] < GameMode.unitsTThree[playerID]) then
				
				outpost:SetTeam(player:GetTeam())
				outpost:SetOwner(player)

			end
		end
		
		Timers:CreateTimer("tower3Vision", {
			
			useGameTime = true,
				
			callback = function()
					local add = AddFOWViewer(player:GetTeam(), outpost:GetOrigin()-200, 1600, 1, false)
					print("Added")
					print(add)
				return 1.0

			end
		})
		


		--if towerTriggered:GetPlayerOwner() == -1 then
	
end

function TowerThreeOnEndTouch(trigger)

		local hUnit = trigger.activator
		local player = hUnit:GetPlayerOwner()
		local playerID = hUnit:GetPlayerOwnerID()
		
		local outpost = nil
	
		local towerTriggered = Entities:FindByName(nil, "tower_trigger 3")
		
		local towerEntityNearSpawner = Entities:FindAllInSphere(towerTriggered:GetOrigin(), 100)
		
		for _, unit in pairs(towerEntityNearSpawner) do
			if unit:GetName() == "npc_dota_tower" then
				if unit:GetUnitName() == "creeparena_custom_outpost" then
					outpost = unit
				end
			end
		end
		
		if(outpost == nil) then
			print("******** Error finding tower 3*******")
		end
			
		GameMode.unitsTThree[playerID] = GameMode.unitsTThree[playerID] - 1

		local maxUnits = GameMode.unitsTThree[0]
		local currPlayerOwner = 0
		
		for player = 1, 1 do
			if(GameMode.unitsTThree[player] > maxUnits) then
					
				local maxUnits = GameMode.unitsTThree[player]
				currPlayerOwner = player
				
			end
			
		end
		
		if(currPlayerOwner == 0 and GameMode.unitsTThree[currPlayerOwner] == 0) then
			
			Timers:RemoveTimer("tower3Vision")
			outpost:SetTeam(255)
			
		else
		
			
		if not outpost:GetTeam() == player:GetTeam() then
			Timers:RemoveTimer("tower3Vision")
		end
			
		outpost:SetTeam(player:GetTeam())
		outpost:SetOwner(player)
		end
end

function TowerFourOnStartTouch(trigger)

		
		
		
		local hUnit = trigger.activator
		local player = hUnit:GetPlayerOwner()
		local playerID = hUnit:GetPlayerOwnerID()
		
		local outpost = nil
	
		local towerTriggered = Entities:FindByName(nil, "tower_trigger 4")
		
		local towerEntityNearSpawner = Entities:FindAllInSphere(towerTriggered:GetOrigin(), 100)
		
		for _, unit in pairs(towerEntityNearSpawner) do
			if unit:GetName() == "npc_dota_tower" then
				if unit:GetUnitName() == "creeparena_custom_outpost" then
					outpost = unit
				end
			end
		end
		
		if(outpost == nil) then
			print("******** Error finding tower 4*******")
		end
			
		GameMode.unitsTFour[playerID] = GameMode.unitsTFour[playerID] + 1

		DebugPrintTable(outpost)
		DebugPrint(outpost:GetTeam())
		DebugPrint(player:GetTeam())
	
		if(outpost:GetTeam() == 255) then
		
			outpost:SetTeam(player:GetTeam())
			outpost:SetOwner(player)
			
			
		else
		
			local outpostCurrOwnerID = outpost:GetPlayerOwnerID()

			if(GameMode.unitsTFour[outpostCurrOwnerID] < GameMode.unitsTFour[playerID]) then
				
				outpost:SetTeam(player:GetTeam())
				outpost:SetOwner(player)

			end
		end


	
		Timers:CreateTimer("tower4Vision", {
			
			useGameTime = true,
				
			callback = function()
					local add = AddFOWViewer(player:GetTeam(), outpost:GetOrigin()-200, 1600, 1, false)
					print("Added")
					print(add)
				return 1.0

			end
		})
		

		--if towerTriggered:GetPlayerOwner() == -1 then
	
end

function TowerFourOnEndTouch(trigger)

		local hUnit = trigger.activator
		local player = hUnit:GetPlayerOwner()
		local playerID = hUnit:GetPlayerOwnerID()
		
		local outpost = nil
	
		local towerTriggered = Entities:FindByName(nil, "tower_trigger 4")
		
		local towerEntityNearSpawner = Entities:FindAllInSphere(towerTriggered:GetOrigin(), 100)
		
		for _, unit in pairs(towerEntityNearSpawner) do
			if unit:GetName() == "npc_dota_tower" then
				if unit:GetUnitName() == "creeparena_custom_outpost" then
					outpost = unit
				end
			end
		end
		
		if(outpost == nil) then
			print("******** Error finding tower 4*******")
		end
			
		GameMode.unitsTFour[playerID] = GameMode.unitsTFour[playerID] - 1

		local maxUnits = GameMode.unitsTFour[0]
		local currPlayerOwner = 0
		
		--MAX_NUMBER OF TEAMS
		for player = 1, 1 do
			if(GameMode.unitsTFour[player] > maxUnits) then
					
				local maxUnits = GameMode.unitsTFour[player]
				currPlayerOwner = player
				
			end
			
		end
		
		if(currPlayerOwner == 0 and GameMode.unitsTFour[currPlayerOwner] == 0) then
			
			Timers:RemoveTimer("tower4Vision")
			outpost:SetTeam(255)
			
		else
		
		if not outpost:GetTeam() == player:GetTeam() then
			Timers:RemoveTimer("tower4Vision")
		end
			
		outpost:SetTeam(player:GetTeam())
		outpost:SetOwner(player)
		end
end