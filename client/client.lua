local recoil = true -- If you want the recoil to be enabled or disabled when you enter the server


RegisterCommand('recoil', function(source)
	recoil = not recoil
	if recoil then 
		TriggerEvent('chat:addMessage', { args = { '^1[Recoil]', '^7El recoil ahora esta desactivado' } })
	else
		TriggerEvent('chat:addMessage', { args = { '^1[Recoil]', '^7El recoil ahora esta activado' } })
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	while true do
		Citizen.Wait(sleep)
		if recoil then
			local sleep = 1000
			if IsPedArmed(PlayerPedId(), 6) then
				sleep = 500
				SetWeaponRecoilShakeAmplitude(GetSelectedPedWeapon(PlayerPedId()), 0)
			else sleep = 1000 end
		elseif recoil == false then
			if IsPedArmed(PlayerPedId(), 6) then
				sleep = 500
				SetWeaponRecoilShakeAmplitude(GetSelectedPedWeapon(PlayerPedId()), 0.333000) -- The recoil default of GTA5
			else sleep = 1000 end
		else sleep = 3500 end
	end
end) 
