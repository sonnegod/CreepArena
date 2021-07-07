baseUnit2 = class({})


function baseUnit2:OnSpellStart()
	local hCaster = self:GetCaster()
	local playerOwner = hCaster:GetPlayerOwner()
	local playerID = hCaster:GetPlayerOwnerID()
	
	GameMode.playerUnitSelected[playerID] = "npc_dota_neutral_satyr_soulstealer"
	
end

