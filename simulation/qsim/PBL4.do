onerror {exit -code 1}
vlib work
vlog -work work PBL4.vo
<<<<<<< HEAD
vlog -work work Waveform1.vwf.vt
vsim  -c -t 1ps -L maxii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.validacao_entrada_cedula_vlg_vec_tst
vcd file -direction PBL4.msim.vcd
vcd add -internal validacao_entrada_cedula_vlg_vec_tst/*
vcd add -internal validacao_entrada_cedula_vlg_vec_tst/i1/*
=======
vlog -work work modoLavagemVWF.v.vwf.vt
vsim -c -t 1ps -L maxii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.modoLavagem_vlg_vec_tst
vcd file -direction PBL4.msim.vcd
vcd add -internal modoLavagem_vlg_vec_tst/*
vcd add -internal modoLavagem_vlg_vec_tst/i1/*
>>>>>>> daca1071302adbfce43ce2a29ac26739ca9480a8
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
<<<<<<< HEAD


=======
>>>>>>> daca1071302adbfce43ce2a29ac26739ca9480a8
