`include "uvm_macros.svh"
// import uvm_pkg :: *;


//apb_sequence_item
class apb_seq_item extends uvm_sequence_item;
  rand int apb_addr;
  rand int apb_data;
  `uvm_object_utils_begin(apb_seq_item);
  `uvm_field_int(apb_addr,UVM_DEFAULT);
  `uvm_field_int(apb_data,UVM_DEFAULT);
  `uvm_object_utils_end;
  
  function new(string name = "apb_seq_item");
    super.new(name);
    $display("inside function new of apb_seq_item");
  endfunction 
endclass : apb_seq_item

//ahb_sequence_item
class ahb_seq_item extends uvm_sequence_item;
  rand int ahb_addr;
  rand int ahb_data;
  `uvm_object_utils_begin(ahb_seq_item);
  `uvm_field_int(ahb_addr,UVM_DEFAULT); 
  `uvm_field_int(ahb_data,UVM_DEFAULT);
  `uvm_object_utils_end;
  
  function new(string name = "ahb_seq_item");
    super.new(name);
    $display("inside function new of ahb_seq_item");
  endfunction 
endclass : ahb_seq_item



//apb_sequencer
class apb_seqr extends uvm_sequencer#(apb_seq_item);
  `uvm_component_utils(apb_seqr);
  
  function  new(string name = "apb_seqr", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of apb_sequencer");
  endfunction 
endclass : apb_seqr

//ahb_sequencer
class ahb_seqr extends uvm_sequencer#(ahb_seq_item);
  `uvm_component_utils(ahb_seqr);
  
  function  new(string name = "ahb_seqr", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of ahb_sequencer");
  endfunction 
endclass : ahb_seqr



//apb_driver
class apb_driver extends uvm_driver#(apb_seq_item);
  apb_seq_item apb_seq_item_h;
  `uvm_component_utils(apb_driver);

  function new(string name = "apb_driver", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of apb_driver");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of apb_driver");
    apb_seq_item_h = apb_seq_item :: type_id :: create("apb_seq_item_h",this);
  endfunction  
  
  task run_phase(uvm_phase phase);
    forever begin 
      $display("inside run phase of apb_driver");
      `uvm_info("driver","the correct apb_driver class ",UVM_NONE);
      seq_item_port.get_next_item(apb_seq_item_h);
      apb_seq_item_h.print();
      seq_item_port.item_done();
    end 
  endtask
endclass : apb_driver

//ahb_driver
class ahb_driver extends uvm_driver#(ahb_seq_item);
  ahb_seq_item ahb_seq_item_h;
  `uvm_component_utils(ahb_driver);

  function new(string name = "ahb_driver", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of ahb_driver");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of ahb_driver");
    ahb_seq_item_h = ahb_seq_item :: type_id :: create("ahb_seq_item_h",this);
  endfunction  
  
  task run_phase(uvm_phase phase);
    forever begin 
      $display("inside run phase of ahb_driver");
      `uvm_info("driver","the correct ahb_driver class ",UVM_NONE);
      seq_item_port.get_next_item(ahb_seq_item_h);
      ahb_seq_item_h.print();
      seq_item_port.item_done();
    end 
  endtask
endclass : ahb_driver



//apb_sequence
class apb_seq extends uvm_sequence #(apb_seq_item);
   apb_seq_item apb_seq_item_h;
  `uvm_object_utils(apb_seq);
 
  function new(string name = "apb_seq");
    super.new(name);
    $display("inside function new of apb_sequence");
  endfunction
  
  task body();
    repeat(2) begin 
      $display("inside body task of apb_sequence");
      apb_seq_item_h = apb_seq_item :: type_id :: create("apb_seq_item_h");
      start_item(apb_seq_item_h);
      apb_seq_item_h.randomize();
      apb_seq_item_h.print();
      finish_item(apb_seq_item_h);
    end 
  endtask
endclass : apb_seq

//ahb_sequence
class ahb_seq extends uvm_sequence #(ahb_seq_item);
   ahb_seq_item ahb_seq_item_h;
  `uvm_object_utils(ahb_seq);
 
  function new(string name = "ahb_seq");
    super.new(name);
    $display("inside function new of ahb_sequence");
  endfunction
  
  task body();
    repeat(2) begin 
      $display("inside body task of ahb_sequence");
      ahb_seq_item_h = ahb_seq_item :: type_id :: create("ahb_seq_item_h");
      start_item(ahb_seq_item_h);
      ahb_seq_item_h.randomize();
      ahb_seq_item_h.print();
      finish_item(ahb_seq_item_h);
    end 
  endtask
endclass : ahb_seq



//apb_agent
class apb_agent extends uvm_agent;
  apb_seqr apb_seqr_h;;
  apb_driver apb_driver_h;
  `uvm_component_utils(apb_agent);

  function new(string name = "apb_agent", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of apb_agent");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of apb_agent");
    apb_driver_h = apb_driver :: type_id :: create("apb_driver_h",this);
    apb_seqr_h = apb_seqr :: type_id :: create("apb_seqr_h",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("inside connect phase of apb_agent");
    apb_driver_h.seq_item_port.connect(apb_seqr_h.seq_item_export);
  endfunction 
endclass : apb_agent

//ahb_agent
class ahb_agent extends uvm_agent;
  ahb_seqr ahb_seqr_h;;
  ahb_driver ahb_driver_h;
  `uvm_component_utils(ahb_agent);

  function new(string name = "ahb_agent", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of ahb_agent");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of ahb_agent");
    ahb_driver_h = ahb_driver :: type_id :: create("ahb_driver_h",this);
    ahb_seqr_h = ahb_seqr :: type_id :: create("ahb_seqr_h",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("inside connect phase of ahb_agent");
    ahb_driver_h.seq_item_port.connect(ahb_seqr_h.seq_item_export);
  endfunction 
endclass : ahb_agent




//env
class env extends uvm_env;
  apb_agent apb_agent_h;
  ahb_agent ahb_agent_h;
  `uvm_component_utils(env);

  function new(string name = "env", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of env");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of env");
    apb_agent_h = apb_agent :: type_id :: create("apb_agent_h",this);
    ahb_agent_h = ahb_agent :: type_id :: create("ahb_agent_h",this);
  endfunction
endclass




//test
class test extends uvm_test;
  env env_h;
  apb_seq apb_seq_h;
  ahb_seq ahb_seq_h;
  `uvm_component_utils(test);

  function new(string name = "test", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of test");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of test");
    env_h = env :: type_id :: create("env_h",this);
    apb_seq_h = apb_seq :: type_id :: create("apb_seq_h",this);
    ahb_seq_h = ahb_seq :: type_id :: create("ahb_seq_h",this);
  endfunction 
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    $display("inside run phase of test");
    `uvm_info("test","before calling start method of apb_sequnce in run_phase of test",UVM_NONE);
    apb_seq_h.start(env_h.apb_agent_h.apb_seqr_h);
    `uvm_info("test","after calling start method of apb_sequnce in run_phase of test",UVM_NONE);
    `uvm_info("test","before calling start method of ahb_sequnce in run_phase of test",UVM_NONE);
    ahb_seq_h.start(env_h.ahb_agent_h.ahb_seqr_h);
    `uvm_info("test","after calling start method of ahb_sequnce in run_phase of test",UVM_NONE);
     phase.drop_objection(this);
  endtask
endclass



//tb
module uvm_multiple_agents_drivers_sequencers_tb;
  
  initial begin 
    `uvm_info("module","before run_test",UVM_NONE);
    run_test("test");
  end 
endmodule 
