`include "uvm_macros.svh"
// import uvm_pkg :: *;


//sequence_item
class seq_item extends uvm_sequence_item;
  rand int addr;
  rand int data;
  `uvm_object_utils_begin(seq_item);
  `uvm_field_int(addr,UVM_DEFAULT);
  `uvm_field_int(data,UVM_DEFAULT);
  `uvm_object_utils_end;
  
  function new(string name = "seq_item");
    super.new(name);
    $display("inside function new of seq_item");
  endfunction 
endclass : seq_item


//sequencer
class seqr extends uvm_sequencer#(seq_item);
  `uvm_component_utils(seqr);
  
  function  new(string name = "seqr", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of sequencer");
  endfunction 
endclass : seqr



//driver
class driver extends uvm_driver#(seq_item);
  seq_item seq_item_h;
  `uvm_component_utils(driver);

  function new(string name = "driver", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of driver");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of driver");
    seq_item_h = seq_item :: type_id :: create("seq_item_h",this);
  endfunction : build_phase 
  
  task run_phase(uvm_phase phase);
    forever begin 
      $display("inside run phase of driver");

      `uvm_info("driver","before calling get_next_item in run_phase of driver ",UVM_NONE);
      seq_item_port.get_next_item(seq_item_h);
      `uvm_info("driver","after calling get_next_item in run_phase of driver ",UVM_NONE);

      `uvm_info("driver","before print statetemt in run_phase of driver ",UVM_NONE);
      seq_item_h.print();
      `uvm_info("driver","after print statetemt in run_phase of driver ",UVM_NONE);

      //driver_logic i have to write like similar to apb

      `uvm_info("driver","before calling item_done in run_phase of driver ",UVM_NONE);
      seq_item_port.item_done();
      `uvm_info("driver","after calling item_done in run_phase of driver ",UVM_NONE);
    end 
  endtask
endclass


//sequence
class seq extends uvm_sequence #(seq_item);
   seq_item req;
  `uvm_object_utils(seq);
 
  function new(string name = "seq");
    super.new(name);
    $display("inside function new of sequence");
  endfunction
  
  task body();
    repeat(2) begin 
      $display("inside body task of sequence");
      req = seq_item :: type_id :: create("req");

      `uvm_info("seq","before calling start_item in body method of sequnce ",UVM_NONE);
      start_item(req);
      `uvm_info("seq","after calling start_item in body method of sequnce ",UVM_NONE);

      `uvm_info("seq","before randomization in body method of sequnce ",UVM_NONE);
      req.randomize();
      `uvm_info("seq","after randomization in body method of sequnce ",UVM_NONE);

      `uvm_info("seq","before print statetemt in body method  of sequnce ",UVM_NONE);
      req.print();
      `uvm_info("seq","after print statetemt in body method of sequnce ",UVM_NONE);

      `uvm_info("seq","before calling finish_item in body method of sequnce ",UVM_NONE);
      finish_item(req);
      `uvm_info("seq","after calling finish_item in body method of sequnce ",UVM_NONE);
    end 
  endtask
endclass : seq



//agent
class agent extends uvm_agent;
  seqr seqr_h;;
  driver driver_h;
  `uvm_component_utils(agent);

  function new(string name = "agent", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of agent");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of agent");
    driver_h = driver :: type_id :: create("driver_h",this);
    seqr_h = seqr :: type_id :: create("seqr_h",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("inside connect phase of agent");
    driver_h.seq_item_port.connect(seqr_h.seq_item_export);
  endfunction 
endclass




//env
class env extends uvm_env;
  agent agent_h;
  `uvm_component_utils(env);

  function new(string name = "env", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of env");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of env");
    agent_h = agent :: type_id :: create("agent_h",this);
  endfunction
endclass




//test
class test extends uvm_test;
  env env_h;
  seq seq_h;
  `uvm_component_utils(test);

  function new(string name = "test", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of test");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of test");
    env_h = env :: type_id :: create("env_h",this);
    seq_h = seq :: type_id :: create("seq",this);
  endfunction 
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    $display("inside run phase of test");
    `uvm_info("test","before calling start method of sequnce in run_phase of test",UVM_NONE);
    seq_h.start(env_h.agent_h.seqr_h);
    `uvm_info("test","after calling start method of sequnce in run_phase of test",UVM_NONE);
     phase.drop_objection(this);
  endtask
endclass



//tb
module uvm_sequence_sequencer_driver_hierarchy_tb;
  
  initial begin 
    `uvm_info("module","before run_test",UVM_NONE);
    run_test("test");
  end 
endmodule 
