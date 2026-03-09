hook.Add("PlayerSay", "Module:Admin:HandleInitial", function (ply, text, team)
	if string.lower( text ) == "!admin" and ply:SteamID64() == GPYMOUSSS.configOwner[1][1] or ply:SteamID() == GPYMOUSSS.configOwner[1][2] then
			net.Start("Module:Admin:OpenMainVGUI")
			net.Send(ply)
		return ""
	end
end)