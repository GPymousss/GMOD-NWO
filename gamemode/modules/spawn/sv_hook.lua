hook.Add("PlayerInitialSpawn", "Module:Spawn:HandleInitial", function (ply)
	timer.Simple(0, function()
		net.Start("Module:Spawn:OpenMainVGUI")
		net.Send(ply)

		ply:KillSilent()
	end)
end)