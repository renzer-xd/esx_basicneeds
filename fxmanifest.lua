fx_version 'cerulean'
game 'gta5'
description 'basicneeds Modify By RenZer'
version '1.0'
author 'RenZer Developer Shop'

shared_scripts {
    'config/config.general.lua',
    'config/config.translate.lua',
    'config/config.function.lua'
}

client_scripts {
    'script/load.lua',
    'script/function.lua',
    'script/utils.lua',
    'script/client.lua'
}

server_scripts {
   'script/function.lua',
   'script/server.lua'
}

dependencies {
	'es_extended',
	'esx_status'
}
