--[[
    Vehicles for job by: OuDayas
    Version 1.0

    Config:
    Per eliminare un veicolo ti basta scegliere come eliminarlo, per farlo configura la voce "DeleteVehByPlate" in true o false
    Se verrà settata su true, imposta la targa sotto in "Plate" qualsiasi veicolo abbia quella targa potrà essere eliminato
    Se verrà settato su false, invece qualsiasi veicolo corrisponda ad uno nella lista potrà essere eliminato

    Note:
    n.b: Questo script funziona soltanto per chi ha il lavoro contrassegnato in joblist, pertanto non potranno interagire i giocatori nelle zone dei marker per eliminare i veicoli
    Consiglio: Conviene settare una targa molto specifica non superiore ad i 7/8 caratteri, anche perché è quasi impossibile che un veicolo con targa random abbia settato la targa "VANILLA" per esempio
]]

Config                              =   {}
Config.Locale                       =   'it'
Config.Debug                        =   false
Config.Joblist =
{
    ["bahamamas"] =
    {
        Misc =
        {
            DeleteVehByPlate = true,
            Plate = "BAHAMAMA"
        },
        Menu =
        {
            Take = vector3(-1392.6, -640.24, 28.67),
            Delete = vector3(-1398.0, -637.97, 28.67)
        },
    },
    ["vanilla"] =
    {
        Misc =
        {
            DeleteVehByPlate = true,
            Plate = "VANILLA"
        },
        Menu =
        {
            Take = vector3(136.66, -1278.63, 29.36),
            Delete = vector3(136.74, -1264.7, 29.36)
        },
    },
    ["tequila"] =
    {
        Misc =
        {
            DeleteVehByPlate = true,
            Plate = "TEQUILA"
        },
        Menu =
        {
            Take = vector3(-565.33, 298.77, 83.07),
            Delete = vector3(-563.13, 304.17, 83.21)
        },
    }
}

Config.Vehicles =
{
    ["bahamamas"] =
    {
        {
            VehModel = "rumpo",
            Name = "Rumpo",
            Pos = vector3(-1400.3, -639.06, 28.67),
            PrimaryColor = vector3(0, 0, 0),
            SecondaryColor = vector3(0,0,0),
            Heading = "120.0",
            Livery = 1
        }
    },
    ["vanilla"] =
    {
        {
            VehModel = "stretch",
            Name = "Limousine",
            Pos = vector3(141.34, -1265.92, 29.27),
            PrimaryColor = vector3(255, 0, 0),
            SecondaryColor = vector3(0,0,0),
            Heading = "200.0",
            Livery = 1
        },
        {
            VehModel = "rumpo",
            Name = "Rumpo",
            Pos = vector3(141.34, -1265.92, 29.27),
            PrimaryColor = vector3(255, 0, 0),
            SecondaryColor = vector3(0,0,0),
            Heading = "200.0",
            Livery = 1
        }
    },
    ["tequila"] =
    {
        {
            VehModel = "rumpo",
            Name = "Rumpo",
            Pos = vector3(-561.76, 302.37, 83.17),
            PrimaryColor = vector3(0, 0, 0),
            SecondaryColor = vector3(0,0,0),
            Heading = "266.0",
            Livery = 3
        }
    },
}