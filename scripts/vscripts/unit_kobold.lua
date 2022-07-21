unit_kobold = class({})


function unit_kobold:OnSpellStart()
	local hCaster = self:GetCaster()
	local playerOwner = hCaster:GetPlayerOwner()
	local playerID = hCaster:GetPlayerOwnerID()


	if(GameMode.playerUnitSelected[playerID] ~= 'npc_dota_neutral_kobold')
	then
		GameMode.playerUnitSelected[playerID] = "npc_dota_neutral_kobold"
	end
	print(GameMode.playerUnitSelected[playerID])
	
end