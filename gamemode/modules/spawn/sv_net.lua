util.AddNetworkString("Module:Spawn:OpenMainVGUI")
util.AddNetworkString("Module:Spawn:LoadingFinish")

net.Receive("Module:Spawn:LoadingFinish", function(len, ply)
	-- ply:Spawn()
end)