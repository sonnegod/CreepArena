unit_spawner = class({})


function unit_spawner:OnSpellStart()
	local hCaster = self:GetCaster()
	local playerOwner = hCaster:GetPlayerOwner()
	local playerID = hCaster:GetPlayerOwnerID()
	
	Timers:RemoveTimer("unitSpawn")

	Timers:CreateTimer("unitSpawn", {
	
		useGameTime = true,
		
	
		callback = function()
			
			if GameMode:CheckUnitCount(playerID, playerOwner) == true then
				local newUnit = CreateUnitByName(GameMode.playerUnitSelected[playerID] , hCaster:GetOrigin() -75,true, playerOwner,playerOwner,hCaster:GetTeam())
				newUnit:SetOwner(playerOwner)
				newUnit:SetControllableByPlayer(playerID, true)
			end
			return 1.0

		end
		
	
	})

end

function unit_spawner:OnToggleOn()

	print("THE SPELL IS WORKING FOR TOGGLE")

	
	

end

function unit_spawner:OnToggleOff()

end