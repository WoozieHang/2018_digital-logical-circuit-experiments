set_global_assignment -entity "xclk" -library "lib_xclk" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "xclk" -library "lib_xclk" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "xclk" -library "lib_xclk" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_xclk" -name SPD_FILE [file join $::quartus(sip_path) "xclk.spd"]

set_global_assignment -library "lib_xclk" -name MISC_FILE [file join $::quartus(sip_path) "xclk_sim/xclk.vo"]
