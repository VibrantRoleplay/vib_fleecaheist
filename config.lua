Config = {}

Config.Debug = true -- Setting true will enable visual of target zones
Config.Cops = 0 -- Amount of cops required to be allowed to hack a vault
Config.PoliceJob = "police" -- Name of police job
Config.SecurityMaxLevel = 5 -- How many times can a vault security level be upgrade (It starts at 0 per restart)

----------------
--Items Needed--
----------------

Config.SecurityUpgradeItem = "bankssecuritydevice" -- Item needed to upgrade a vaults security level
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
            vaultAccessDuration = 1, -- How long the vault stays open for when requested by police (In minutes)
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
                ["coords"] = vector3(311.25, -285.75, 54.6), -- Location of locker target zone
                ["size"] = vec3(0.30, 0.5, 0.65), -- Size of locker target zone
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)} -- Rewards for this specific locker
                }
            },
            [2] = {
                ["coords"] = vector3(310.5, -287.8, 54.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [3] = {
                ["coords"] = vector3(310.95, -288.9, 54.5),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [4] = {
                ["coords"] = vector3(313.45, -289.7, 54.55),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [5] = {
                ["coords"] = vector3(314.8, -289.25, 54.5),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [6] = {
                ["coords"] = vector3(315.5, -287.5, 54.5),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [7] = {
                ["coords"] = vector3(315.55, -285.55, 54.55),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [8] = {
                ["coords"] = vector3(315.15, -283.3, 54.65),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [9] = {
                ["coords"] = vector3(313.5, -282.7, 54.7),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
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
            vaultAccessDuration = 1,
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
                ["coords"] = vector3(149.05, -1044.3, 30.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [2] = {
                ["coords"] = vector3(150.45, -1044.85, 29.85),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [3] = {
                ["coords"] = vector3(151.6, -1046.2, 30.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [4] = {
                ["coords"] = vector3(151.05, -1049.1, 29.9),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [5] = {
                ["coords"] = vector3(150.5, -1050.75, 30.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [6] = {
                ["coords"] = vector3(149.1, -1051.4, 29.9),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [7] = {
                ["coords"] = vector3(146.9, -1050.6, 30.1),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [8] = {
                ["coords"] = vector3(146.2, -1049.2, 29.9),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [9] = {
                ["coords"] = vector3(146.75, -1047.75, 29.8),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
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
            vaultAccessDuration = 1,
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
                ["coords"] = vector3(-2958.9, 483.4, 16.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [2] = {
                ["coords"] = vector3(-2958.8, 484.9, 16.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [3] = {
                ["coords"] = vector3(-2957.35, 486.25, 16.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [4] = {
                ["coords"] = vector3(-2954.8, 486.7, 16.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [5] = {
                ["coords"] = vector3(-2953.1, 486.6, 16.15),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [6] = {
                ["coords"] = vector3(-2952.2, 485.4, 16.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [7] = {
                ["coords"] = vector3(-2952.3, 483.2, 16.3),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [8] = {
                ["coords"] = vector3(-2953.45, 482.1, 16.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [9] = {
                ["coords"] = vector3(-2955.0, 482.2, 16.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
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
            vaultAccessDuration = 1,
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
                ["coords"] = vector3(-351.7, -53.55, 49.5),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [2] = {
                ["coords"] = vector3(-350.2, -54.05, 49.35),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [3] = {
                ["coords"] = vector3(-349.3, -55.8, 49.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [4] = {
                ["coords"] = vector3(-349.55, -58.35, 49.3),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [5] = {
                ["coords"] = vector3(-350.1, -59.85, 49.3),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [6] = {
                ["coords"] = vector3(-351.4, -60.65, 49.35),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [7] = {
                ["coords"] = vector3(-353.5, -59.9, 49.3),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [8] = {
                ["coords"] = vector3(-354.45, -58.5, 49.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [9] = {
                ["coords"] = vector3(-353.85, -56.8, 49.25),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
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
            vaultAccessDuration = 1,
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
                ["coords"] = vector3(-1210.55, -333.75, 38.15),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [2] = {
                ["coords"] = vector3(-1209.1, -333.1, 38.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [3] = {
                ["coords"] = vector3(-1207.2, -333.7, 38.15),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [4] = {
                ["coords"] = vector3(-1205.5, -335.8, 38.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [5] = {
                ["coords"] = vector3(-1204.9, -337.0, 38.2),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [6] = {
                ["coords"] = vector3(-1205.5, -338.65, 38.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [7] = {
                ["coords"] = vector3(-1207.05, -339.45, 38.05),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [8] = {
                ["coords"] = vector3(-1209.0, -339.1, 38.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [9] = {
                ["coords"] = vector3(-1209.6, -337.8, 38.0),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
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
            vaultAccessDuration = 1,
        },
        ["vaultGuard"] = {
            pedModel = "cs_casey",
            spawnLocation = vector3(1179.27, 2708.9, 38.08),
        },
        ["object"] = `v_ilev_gb_vauldr`,
        ["heading"] = {
            closed = 90.0,
            open = 0.5
        },
        ["camId"] = 25,
        ["lockers"] = {
            [1] = {
                ["coords"] = vector3(1174.4, 2710.5, 38.35),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [2] = {
                ["coords"] = vector3(1173.0, 2710.45, 38.35),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 339.5,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [3] = {
                ["coords"] = vector3(1171.55, 2711.85, 38.35),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [4] = {
                ["coords"] = vector3(1170.95, 2714.3, 38.45),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 250.25,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [5] = {
                ["coords"] = vector3(1170.95, 2715.9, 38.3),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [6] = {
                ["coords"] = vector3(1172.2, 2717.1, 38.15),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [7] = {
                ["coords"] = vector3(1174.2, 2717.1, 38.1),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 159.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [8] = {
                ["coords"] = vector3(1175.55, 2716.05, 38.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
            [9] = {
                ["coords"] = vector3(1175.5, 2714.3, 38.4),
                ["size"] = vec3(0.30, 0.5, 0.65),
                ["rotation"] = 69.75,
                ["rewards"] = {
                    [1] = { item = "money", amount = math.random(2250, 3750)}
                }
            },
        }
    },
}