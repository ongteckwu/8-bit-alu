set projDir "C:/Users/user/Desktop/8-bit-alu/work/planAhead"
set projName "alu"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/user/Desktop/8-bit-alu/work/verilog/mojo_top_0.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/reset_conditioner_1.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/multi_seven_seg_2.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/add_3.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/compare_4.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/bool_5.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/shift_6.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/counter_7.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/seven_seg_8.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/decoder_9.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/additon_10.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/muxleft_11.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/muxright_12.v" "C:/Users/user/Desktop/8-bit-alu/work/verilog/muxrightsign_13.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
