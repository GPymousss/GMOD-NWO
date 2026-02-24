GPYMOUSSS = GPYMOUSSS or {}

-- Module Responsive
include("libraries/resp/responsive.lua")
include("libraries/resp/panel.lua")
include("libraries/resp/materials.lua")
include("libraries/resp/anims.lua")

-- Module Debug
include("libraries/debug/config.lua")
include("libraries/debug/utils.lua")

-- Module Anims
include("libraries/anims/anims.lua")

--  Module Spawn
GPYMOUSSS.SpawnUtils = include("modules/spawn/sh_utils.lua")
include("modules/spawn/vgui/cl_register.lua")
include("modules/spawn/vgui/cl_navbar.lua")
include("modules/spawn/vgui/cl_main.lua")