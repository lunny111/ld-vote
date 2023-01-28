fx_version 'adamant'

game 'gta5'

description "ld-ui"

client_script 'client/*.lua'

ui_page {
    'html/index.html',
}
files {
    'html/index.html',
}

exports {
    "DrawNotify",
    "Clear"
}