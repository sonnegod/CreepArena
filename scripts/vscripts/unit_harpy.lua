unit_harpy = class({})


function unit_spawner:OnSpellStart()
	local hCaster = self:GetCaster()
	local playerOwner = hCaster:GetPlayerOwner()
	local playerID = hCaster:GetPlayerOwnerID()


    self.playerUnitSelected[playerID] = "npc_dota_neutral_harpy_scout"



end