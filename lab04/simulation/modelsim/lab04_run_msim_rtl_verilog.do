transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/NJU/3rd\ semester/digital\ logical\ circuit\ experiments/lab04 {D:/NJU/3rd semester/digital logical circuit experiments/lab04/lab04.v}

