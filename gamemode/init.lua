GPYMOUSSS = GPYMOUSSS or {}

-- Module Responsive
AddCSLuaFile("libraries/resp/responsive.lua")
AddCSLuaFile("libraries/resp/panel.lua")
AddCSLuaFile("libraries/resp/materials.lua")
AddCSLuaFile("libraries/resp/anims.lua")

-- Module Debug
AddCSLuaFile("libraries/debug/config.lua")
AddCSLuaFile("libraries/debug/utils.lua")
include("libraries/debug/config.lua")
include("libraries/debug/utils.lua")
include("libraries/debug/sqlite.lua")
include("libraries/debug/mysql.lua")

-- Module SQLite
include("libraries/sqlite/utils.lua")
include("libraries/sqlite/create.lua")
include("libraries/sqlite/insert.lua")
include("libraries/sqlite/select.lua")
include("libraries/sqlite/update.lua")
include("libraries/sqlite/delete.lua")

-- Module MySQL
include("libraries/mysql/init.lua")
include("libraries/mysql/utils.lua")
include("libraries/mysql/connect.lua")
include("libraries/mysql/create.lua")
include("libraries/mysql/insert.lua")
include("libraries/mysql/select.lua")
include("libraries/mysql/update.lua")
include("libraries/mysql/delete.lua")

-- Module Anims
AddCSLuaFile("libraries/anims/anims.lua")
include("libraries/anims/anims.lua")

-- Module Spawn
AddCSLuaFile("modules/spawn/sh_utils.lua")
AddCSLuaFile("modules/spawn/vgui/cl_register.lua")
AddCSLuaFile("modules/spawn/vgui/cl_navbar.lua")
AddCSLuaFile("modules/spawn/vgui/cl_main.lua")
GPYMOUSSS.SpawnUtils = include("modules/spawn/sh_utils.lua")
include("modules/spawn/sv_data.lua")
include("modules/spawn/sv_net.lua")
include("modules/spawn/sv_hook.lua")

-- Module Admin
AddCSLuaFile("modules/admin/sh_init.lua")
AddCSLuaFile("modules/admin/vgui/cl_main.lua")
include("modules/admin/sh_init.lua")
include("modules/admin/sv_net.lua")
include("modules/admin/sv_hook.lua")