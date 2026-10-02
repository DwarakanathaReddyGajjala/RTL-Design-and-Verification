`include "uvm_macros.svh"
import uvm_pkg::*;


// test
class test extends uvm_test;

  `uvm_component_utils(test)

  function new(string name = "test", uvm_component parent = null);
    super.new(name, parent);
    `uvm_info(get_type_name(),"Inside function new of test",UVM_MEDIUM)
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_name(),"Inside build phase of test",UVM_MEDIUM)
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_full_name(),"Inside connect phase of test",UVM_MEDIUM)
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info(get_type_name(),"Inside end of elaboration phase of test",UVM_MEDIUM)
  endfunction

  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info(get_type_name(),"Inside start of simulation phase of test",UVM_MEDIUM)
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    `uvm_info(get_type_name(),"Inside run phase of test",UVM_MEDIUM)
    #10;
    `uvm_info(get_type_name(),"After 10 time units in run phase of test",UVM_MEDIUM)
    phase.drop_objection(this);
  endtask


  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    `uvm_info(get_type_name(),"Inside extract phase of test",UVM_MEDIUM)
  endfunction


  function void check_phase(uvm_phase phase);
    super.check_phase(phase);
    `uvm_info(get_type_name(),"Inside check phase of test",UVM_MEDIUM)
  endfunction


  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info(get_type_name(),"Inside report phase of test",UVM_MEDIUM)
  endfunction


  function void final_phase(uvm_phase phase);
    super.final_phase(phase);
    `uvm_info(get_type_name(),"Inside final phase of test",UVM_MEDIUM)
  endfunction
endclass


// tb
module uvm_verbosity_tb;

  initial begin
    run_test("test");
  end

endmodule
