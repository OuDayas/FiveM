--[[
	Vehicles for jobs v1.0 by OuDayas

	visita il server discord per molto altro

	https://invite.gg/OuDayas
]]


resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX vehicles for jobs'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/it.lua',
	'server/main.lua'
}

client_scripts {
	"src/RageUI.lua",
	"src/Menu.lua",
	"src/MenuController.lua",
	"src/components/*.lua",
	"src/elements/*.lua",
	"src/items/*.lua",
	"src/panels/*.lua",
	"src/windows/*.lua",
	'config.lua',
	'client/main.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/it.lua'
}

dependencies {
	'es_extended'
}