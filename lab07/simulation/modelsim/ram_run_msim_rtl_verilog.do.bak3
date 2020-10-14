transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/NJU/3rd\ semester/digital\ logical\ circuit\ experiments/lab07 {D:/NJU/3rd semester/digital logical circuit experiments/lab07/ram2_port.v}
vlog -vlog01compat -work work +incdir+D:/NJU/3rd\ semester/digital\ logical\ circuit\ experiments/lab07 {D:/NJU/3rd semester/digital logical circuit experiments/lab07/ram_top.v}
vlog -vlog01compat -work work +incdir+D:/NJU/3rd\ semester/digital\ logical\ circuit\ experiments/lab07 {D:/NJU/3rd semester/digital logical circuit experiments/lab07/ram1.v}

vlog -vlog01compat -work work +incdir+D:/NJU/3rd\ semester/digital\ logical\ circuit\ experiments/lab07/simulation/modelsim {D:/NJU/3rd semester/digital logical circuit experiments/lab07/simulation/modelsim/ram_top.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ram_top_vlg_tst

add wave *
view structure
view signals
run -all
