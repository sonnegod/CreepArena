unit_kobold = class({})


function unit_kobold:OnSpellStart()
	local hCaster = self:GetCaster()
	local playerOwner = hCaster:GetPlayerOwner()
	local playerID = hCaster:GetPlayerOwnerID()

    self.playerUnitSelected[playerID] = "npc_dota_neutral_kobold"

    
	

	
end