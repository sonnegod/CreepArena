unit_harpy = class({})


function unit_harpy:OnSpellStart()
	local hCaster = self:GetCaster()
	local playerOwner = hCaster:GetPlayerOwner()
	local playerID = hCaster:GetPlayerOwnerID()

	if(GameMode.playerUnitSelected[playerID] ~= 'npc_dota_neutral_harpy_scout')
	then
    	GameMode.playerUnitSelected[playerID] = "npc_dota_neutral_harpy_scout"
	end
	print(GameMode.playerUnitSelected[playerID])


end