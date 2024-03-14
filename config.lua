Config = {}

Config.Debug = false -- Setting true will enable visual of target zones
Config.Cops = 1 -- Amount of cops required to be allowed to hack a vault
Config.PoliceJob = "police" -- Name of police job
Config.SecurityMaxLevel = 5 -- How many times can a vault security level be upgrade (It starts at 0 per restart)

----------------
--Items Needed--
----------------

Config.SecurityUpgradeItem = "phone" -- Item needed to upgrade a vaults security level
Config.HackerItem = "raspberrypi" -- Item needed to hack a vault
Config.LockerItem = "drill" -- Item needed to break into lockers

Config.PoliceMainframe = { -- Location where police can view cameras and acquire the mainframe code, needed to upgrade the vault secuirty (Code changes per restart)
    [1] = {
        ["coords"] = vector3(440.59, -995.84, 35.09),
    }
}

Config.Banks = {
    [1] = {
        ["label"] = "Alta Street Fleeca", -- Name of bank (Unique)
        ["coords"] = vector3(311.15, -284.49, 54.16), -- Location of vault keypad
        ["security"] = {
            pedModel = "cs_casey", -- Ped model for armed guard
            spawnLocation = vector4(309.62, -278.95, 54.16, 64.86), -- Location where armed guard spawn
            hallwayCoords = vector3(307.56, -281.33, 54.16), -- Location for turning point in peds path to vault when opening door
            vaultAccessDuration = 1, -- How long the vault stays open for when requested by police
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey", -- Ped model of ped that unlocks vault for police
            spawnLocation = vector3(309.62, -278.95, 54.16), -- Spawn location of ped model that unlocks vault for police
        },
        ["object"] = `v_ilev_gb_vauldr`, -- Vault door (Don't change unless using different banks)
        ["heading"] = {
            closed = 250.0, -- Heading of door when closed
            open = 160.0 -- Heading of door when open
        },
        ["camId"] = 21, -- Camera ID of interior of vault
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(314.2, -283.2, 54.0), -- Location of locker target zone
                ["size"] = vec3(0.70000000000001, 2.4, 4.0), -- Size of locker target zone
                ["rotation"] = 70.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)} -- Rewards for this epcific locker
                }
            },
            [2] = {
                ["coords"] = vector3(315.6, -284.95, 54.0),
                ["size"] = vec3(0.55000000000001, 2.1, 2.35),
                ["rotation"] = 340.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [3] = {
                ["coords"] = vector3(315.0, -288.25, 54.0),
                ["size"] = vec3(0.85, 2.55, 3.0),
                ["rotation"] = 340.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [4] = {
                ["coords"] = vector3(312.4, -289.2, 54.0),
                ["size"] = vec3(4.0, 0.8, 4.0),
                ["rotation"] = 340.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [5] = {
                ["coords"] = vector3(311.0, -286.85, 54.0),
                ["size"] = vec3(0.95, 2.65, 4.0),
                ["rotation"] = 160.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
        }
    },
    [2] = {
        ["label"] = "Legion Square Fleeca",
        ["coords"] = vector3(146.85, -1046.06, 29.36),
        ["security"] = {
            pedModel = "cs_casey",
            spawnLocation = vector4(145.0, -1041.13, 29.36, 65.19),
            hallwayCoords = vector3(143.1, -1043.15, 29.36),
            vaultAccessDuration = 1, -- Time in minutes
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(145.0, -1041.13, 29.36),
        },
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 250.0,
            open = 160.0
        },
        ["camId"] = 22,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(149.9, -1044.75, 29.0),
                ["size"] = vec3(0.85000000000001, 3.0, 4.0),
                ["rotation"] = 70.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [2] = {
                ["coords"] = vector3(151.3, -1046.7, 29.0),
                ["size"] = vec3(0.75000000000001, 1.8, 4.0),
                ["rotation"] = 341.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [3] = {
                ["coords"] = vector3(150.7, -1050.0, 29.0),
                ["size"] = vec3(0.70000000000001, 2.85, 4.0),
                ["rotation"] = 340.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [4] = {
                ["coords"] = vector3(148.05, -1051.0, 29.0),
                ["size"] = vec3(0.85000000000001, 3.75, 4.0),
                ["rotation"] = 67.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [5] = {
                ["coords"] = vector3(146.6, -1048.4, 29.0),
                ["size"] = vec3(0.85000000000001, 2.85, 4.0),
                ["rotation"] = 338.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
        }
    },
    [3] = {
        ["label"] = "Great Ocean Highway Fleeca",
        ["coords"] = vector3(-2956.60, 481.71, 15.69),
        ["security"] = {
            pedModel = "cs_casey",
            spawnLocation = vector4(-2960.77, 478.65, 15.69, 177.21),
            hallwayCoords = vector3(-2958.39, 477.62, 15.69),
            vaultAccessDuration = 1, -- Time in minutes
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(-2960.77, 478.65, 15.69),
        },
        ["object"] = `hei_prop_heist_sec_door`,
        ["heading"] = {
            closed = 360.0,
            open = 270.0
        },
        ["camId"] = 25,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(-2958.9, 484.2, 16.0),
                ["size"] = vec3(0.90000000000001, 2.75, 4.0),
                ["rotation"] = 358.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [2] = {
                ["coords"] = vector3(-2957.25, 486.2, 15.25),
                ["size"] = vec3(1.75, 0.5, 4.0),
                ["rotation"] = 341.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [3] = {
                ["coords"] = vector3(-2954.0, 486.55, 16.0),
                ["size"] = vec3(2.6, 0.90000000000001, 4.0),
                ["rotation"] = 358.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [4] = {
                ["coords"] = vector3(-2952.25, 484.2, 16.0),
                ["size"] = vec3(0.55, 3.6, 4.0),
                ["rotation"] = 357.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [5] = {
                ["coords"] = vector3(-2954.3, 482.1, 16.0),
                ["size"] = vec3(3, 1, 4.0),
                ["rotation"] = 357.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
        }
    },
    [4] = {
        ["label"] = "Hawick Drive Fleeca",
        ["coords"] = vector3(-353.86, -55.29, 49.03),
        ["security"] = {
            pedModel = "cs_casey",
            spawnLocation = vector4(-355.58, -50.44, 49.03, 98.7),
            hallwayCoords = vector3(-357.65, -52.31, 49.03),
            vaultAccessDuration = 1, -- Time in minutes
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(-355.58, -50.44, 49.03),
        },
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 250.0,
            open = 160.0
        },
        ["camId"] = 23,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(-350.9, -53.8, 49.0),
                ["size"] = vec3(2.9, 0.6, 3),
                ["rotation"] = 340.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [2] = {
                ["coords"] = vector3(-349.4, -55.85, 48.5),
                ["size"] = vec3(0.5, 2.0, 4.0),
                ["rotation"] = 341.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [3] = {
                ["coords"] = vector3(-349.95, -59.1, 49.0),
                ["size"] = vec3(0.45, 3.0, 4.0),
                ["rotation"] = 340.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [4] = {
                ["coords"] = vector3(-352.6, -60.1, 48.65),
                ["size"] = vec3(0.6, 3.7, 4.0),
                ["rotation"] = 67.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [5] = {
                ["coords"] = vector3(-354.05, -57.7, 49.0),
                ["size"] = vec3(0.55, 2.8, 4.0),
                ["rotation"] = 338.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
        }
    },
    [5] = {
        ["label"] = "Del Perro Fleeca",
        ["coords"] = vector3(-1210.82, -336.59, 37.78),
        ["security"] = {
            pedModel = "cs_casey",
            spawnLocation = vector4(-1215.46, -334.55, 37.77, 98.7),
            hallwayCoords = vector3(-1215.26, -337.24, 37.78),
            vaultAccessDuration = 1, -- Time in minutes
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(-1215.46, -334.55, 37.77),
        },
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 300.0,
            open = 200.0
        },
        ["camId"] = 24,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(-1209.8, -333.35, 38.0),
                ["size"] = vec3(2.75, 0.55, 4.0),
                ["rotation"] = 26.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000, 2000) }
                }
            },
            [2] = {
                ["coords"] = vector3(-1207.25, -333.7, 38.0),
                ["size"] = vec3(0.5, 1.7, 4.0),
                ["rotation"] = 26.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000, 2000) } 
                }
            },
            [3] = {
                ["coords"] = vector3(-1205.15, -336.3, 38.0),
                ["size"] = vec3(0.7, 2.8, 2),
                ["rotation"] = 27.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000, 2000) }
                }
            },
            [4] = {
                ["coords"] = vector3(-1206.25, -339.25, 38.0),
                ["size"] = vec3(0.75, 4.0, 4.0),
                ["rotation"] = 117.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000, 2000) }
                }
            },
            [5] = {
                ["coords"] = vector3(-1209.5, -338.5, 38.0),
                ["size"] = vec3(0.75, 3.0, 4.0),
                ["rotation"] = 27.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000, 2000) }
                }
            },
        }
    },
    [6] = {
        ["label"] = "Sandy Fleeca",
        ["coords"] = vector3(1176.02, 2712.86, 38.08),
        ["security"] = {
            pedModel = "cs_casey",
            spawnLocation = vector4(1179.27, 2708.9, 38.08, 241.55),
            hallwayCoords = vector3(1180.53, 2711.11, 38.08),
            vaultAccessDuration = 1, -- Time in minutes
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(1179.27, 2708.9, 38.08),
        },
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 90.0,
            open = 160.0
        },
        ["camId"] = 25,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(1173.65, 2710.55, 38.0),
                ["size"] = vec3(2.75, 0.40000000000001, 4.0),
                ["rotation"] = 0.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [2] = {
                ["coords"] = vector3(1171.6, 2711.9, 38.0),
                ["size"] = vec3(0.45, 1.8, 4.0),
                ["rotation"] = 0.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [3] = {
                ["coords"] = vector3(1171.05, 2715.15, 38.0),
                ["size"] = vec3(0.40000000000001, 2.85, 4.0),
                ["rotation"] = 0.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [4] = {
                ["coords"] = vector3(1173.35, 2717.05, 38.0),
                ["size"] = vec3(3.6, 0.5, 4.0),
                ["rotation"] = 0.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
            [5] = {
                ["coords"] = vector3(1175.6, 2715.2, 38.0),
                ["size"] = vec3(0.5, 3.0, 4.0),
                ["rotation"] = 0.0,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(1000,2000)}
                }
            },
        }
    },
}