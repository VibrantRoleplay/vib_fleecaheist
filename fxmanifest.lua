fx_version 'cerulean'
game 'gta5'
description 'VibrantRP Fleeca Heist'

shared_scripts {
    '@ox_lib/init.lua',
	'config.lua',
}

server_scripts  {
	'server/*.lua'
}

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
	'client/*.lua',
}

lua54 'yes'