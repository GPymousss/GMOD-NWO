local function InitDatabaseModuleSpawn()
    gSQLiteCreateTable("spawn_register", {
        steamid   = "VARCHAR(17) NOT NULL PRIMARY KEY",
        firstname = "VARCHAR(64) NOT NULL",
        lastname  = "VARCHAR(64) NOT NULL",
    })
end

InitDatabaseModuleSpawn()