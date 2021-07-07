baseUnit3= class({})


function baseUnit3:OnSpellStart()
	local hCaster = self:GetCaster()
	local playerOwner = hCaster:GetPlayerOwner()
	local playerID = hCaster:GetPlayerOwnerID()
	
	GameMode.playerUnitSelected[playerID] = "npc_dota_neutral_dark_troll"
	
end

