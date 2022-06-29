local ox_inventory = exports.ox_inventory

AddEventHandler('onServerResourceStart', function(resourceName)
	if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
		for k,v in pairs(Personal) do
			ox_inventory:RegisterStash(k,v.name, v.slot, v.weight, false)
		end
	end
end)