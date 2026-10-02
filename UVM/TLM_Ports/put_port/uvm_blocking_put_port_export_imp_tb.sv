`include "uvm_macros.svh"
// import uvm_pkg :: *;


//SEQ_ITEM
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



//componenta 
class compa extends uvm_component;
  
  seq_item seq_item_h;
  uvm_blocking_put_port #(seq_item) producer;//port decleration  
  `uvm_component_utils(compa);

  function new(string name = "compa", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of compa");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of compa");
    seq_item_h = seq_item :: type_id :: create("seq_item_h",this);
    producer = new("producer",this);// instantiation 
  endfunction 
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);//super.run_phase is optional
//     seq_item_h.randomize();
    seq_item_h.data = 64;
    seq_item_h.addr = 128;
    producer.put(seq_item_h);//calling put method
    `uvm_info(get_full_name,"displaying from run phase of compa",UVM_NONE);
    seq_item_h.print();
  endtask : run_phase
endclass : compa



//componentb
class compb extends uvm_component;
  
  seq_item seq_item_h;
  uvm_blocking_put_imp #(seq_item,compb) consumer;// port declaration 
  `uvm_component_utils(compb);

  function new(string name = "compb", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of compb");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of compb");
    consumer = new("consumer",this);// instantiation 
    seq_item_h = seq_item :: type_id :: create("seq_item_h",this);
  endfunction : build_phase 
  
  task  put(seq_item seq_item_h);
   `uvm_info(get_full_name,"displaying from put method of compb",UVM_NONE);
    seq_item_h.print();
  endtask : put 
endclass


//componentc
class compc extends uvm_component;
  
  compb compb_h;
  uvm_blocking_put_export #(seq_item) export_port;// port declaration 
  `uvm_component_utils(compc);

  function new(string name = "compc", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of compc");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of compc");
    export_port = new("export_port",this);// instantiation 
    compb_h     = compb :: type_id :: create("compb_h",this);
  endfunction : build_phase 
  
   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
     $display("inside connect phase of compc");
     export_port.connect(compb_h.consumer);
  endfunction 
endclass



//test
class test extends uvm_test;
  compa compa_h;
  compc compc_h;
  `uvm_component_utils(test);

  function new(string name = "test", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of test");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of test");
    compc_h = compc :: type_id :: create("compc_h",this);
    compa_h = compa :: type_id :: create("compa_h",this);
  endfunction 
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("inside connect phase of test");
    compa_h.producer.connect(compc_h.export_port);
  endfunction 
endclass



//tb
module uvm_blocking_put_port_export_imp_tb;
  
  initial begin 
    run_test("test");
  end 
  
endmodule 
