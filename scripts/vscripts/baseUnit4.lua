baseUnit4 = class({})


function baseUnit4:OnSpellStart()
	local hCaster = self:GetCaster()
	local playerOwner = hCaster:GetPlayerOwner()
	local playerID = hCaster:GetPlayerOwnerID()
	
	GameMode.playerUnitSelected[playerID] = "npc_dota_neutral_ghost"
	
end

