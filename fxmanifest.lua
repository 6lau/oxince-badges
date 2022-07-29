fx_version 'cerulean'
game 'gta5'

shared_script 'config.lua'
client_script 'client/main.lua'
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/utils.lua',
  'server/main.lua'
}

ui_page 'client/html/index.html'
files {
  'client/html/**'
}