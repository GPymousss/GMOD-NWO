local SpawnUtils = GPYMOUSSS.SpawnUtils

util.AddNetworkString("Module:Spawn:OpenMainVGUI")
util.AddNetworkString("Module:Spawn:LoadingFinish")
util.AddNetworkString("Module:Spawn:RegisterPlayer")
util.AddNetworkString("Module:Spawn:RequestRegisterIsValid")
util.AddNetworkString("Module:Spawn:RequestRegisterConfirmation")

net.Receive("Module:Spawn:LoadingFinish", function(len, ply)
	ply:Spawn()
end)

net.Receive("Module:Spawn:RequestRegisterIsValid", function(len, ply)
	local steamid = ply:SteamID64()

	gSQLiteSelect("spawn_register", {"steamid"}, { steamid = steamid }, function(result, err)
		local isRegistered = (result and result ~= true and #result > 0)

		net.Start("Module:Spawn:RequestRegisterConfirmation")
		net.WriteBool(isRegistered)
		net.Send(ply)
	end)
end)

net.Receive("Module:Spawn:RegisterPlayer", function(len, ply)
	local steamid   = ply:SteamID64()
	local firstname = net.ReadString()
	local lastname  = net.ReadString()

	if not SpawnUtils.IsValidSteamID64(steamid) then return end

	local valid, errors = SpawnUtils.ValidateName(firstname, lastname)
	if not valid then
		net.Start("Module:Spawn:RequestRegisterConfirmation")
		net.WriteBool(false)
		net.Send(ply)
		return
	end

	firstname, lastname = SpawnUtils.SanitizeName(firstname, lastname)

	gSQLiteSelect("spawn_register", {"steamid"}, { steamid = steamid }, function(result, err)
		if result and result ~= true and #result > 0 then
			net.Start("Module:Spawn:RequestRegisterConfirmation")
			net.WriteBool(true)
			net.Send(ply)
			return
		end

		gSQLiteInsert("spawn_register", {
			steamid   = steamid,
			firstname = firstname,
			lastname  = lastname,
		}, function(success, insertErr)
			net.Start("Module:Spawn:RequestRegisterConfirmation")
			net.WriteBool(success == true)
			net.Send(ply)
		end)
	end)
end)