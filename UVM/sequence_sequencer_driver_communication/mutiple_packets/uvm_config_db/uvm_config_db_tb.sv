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
  int a,b ;
//   virtual apb_interface vif;
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
    
    `uvm_info("driver",$sformatf("before confi_db get in run_phase of driver a =%0d",a),UVM_NONE);
//     uvm_config_db#(int) ::get(this,"","dwarak",a);//this refers to driver
    if (!uvm_config_db#(int)::get(this, "", "dwarak", a))
      `uvm_error("CONFIG", "Failed to get dwarak")
    `uvm_info("driver",$sformatf("after confi_db get in run_phase of driver a =%0d",a),UVM_NONE);
    
    `uvm_info("driver",$sformatf("before confi_db get in run_phase of driver b =%0d",b),UVM_NONE);
    if (!uvm_config_db#(int)::get(this, "", "Gajjala", b))
    `uvm_error("CONFIG", "Failed to get Gajjala")
    `uvm_info("driver",$sformatf("after confi_db get in run_phase of driver b =%0d",b),UVM_NONE);
    
//     `uvm_info("driver","before interface confi_db get in run_phase of driver",UVM_NONE);
//     if (!uvm_config_db#(virtual apb_interface)::get(this, "", "interface", vif))
//       `uvm_error("CONFIG", "Failed to get interface")
//      `uvm_info("driver","after interface confi_db get in run_phase of driver",UVM_NONE);
    
  
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

      //driver_logic i have to write like opr similar to apb

      `uvm_info("driver","before calling item_done in run_phase of driver ",UVM_NONE);
      seq_item_port.item_done();
      `uvm_info("driver","after calling item_done in run_phase of driver ",UVM_NONE);
    end 
  endtask
endclass



//sequence-object it has no phases
class seq extends uvm_sequence #(seq_item);
   int count;
   seq_item req;
  `uvm_object_utils(seq);
 

  function new(string name = "seq");
    super.new(name);
    $display("inside function new of sequence");
  endfunction
  
  
  task body();
    repeat(count) begin 
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



//test
class test extends uvm_test;
  seqr seqr_h;
  driver driver_h;
  seq seq_h;
  `uvm_component_utils(test);

  function new(string name = "test", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of test");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of test");
    seqr_h = seqr :: type_id :: create("seqr_h",this);
    driver_h = driver :: type_id :: create("driver_h",this);
    seq_h = seq :: type_id :: create("seq_h",this);
    `uvm_info("test","before confi_db set in build_phase of test",UVM_NONE);
    uvm_config_db#(int) ::set(this,"driver_h","dwarak",25);//this refers to test
    `uvm_info("test","after confi_db set in build_phase of test",UVM_NONE);
    
     `uvm_info("test","before confi_db set in build_phase of test",UVM_NONE);
    uvm_config_db#(int) ::set(this,"driver_h","Gajjala",100);//this refers to test
    `uvm_info("test","after confi_db set in build_phase of test",UVM_NONE);
    
    
    // for  no of packets  
    `uvm_info("test",$sformatf("before confi_db get in build_phase of test, count = %0d",seq_h.count),UVM_NONE);
    uvm_config_db#(int) ::get(this,"seq_h","packte_count",seq_h.count);//this refers to test
    `uvm_info("test",$sformatf("after confi_db get in build_phase of test count = %0d",seq_h.count),UVM_NONE);
  endfunction 
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("inside connect phase of test");
    driver_h.seq_item_port.connect(seqr_h.seq_item_export);
  endfunction 
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    $display("inside run phase of test");
    `uvm_info("test","before calling start method of sequnce in run_phase of test",UVM_NONE);
    seq_h.start(seqr_h);
    `uvm_info("test","after calling start method of sequnce in run_phase of test",UVM_NONE);
     phase.drop_objection(this);
  endtask
endclass



//tb
module config_db_tb;
  
  initial begin 
    `uvm_info("module","before run_test",UVM_NONE);
    run_test("test");
  end 
  
  initial begin 
     uvm_config_db#(int):: set(null,"uvm_test_top.driver_h","Gajjala",50);
  end 
   
  initial begin 
    uvm_config_db#(int):: set(null,"uvm_test_top.seq_h","packte_count",3);
  end 
  
//   apb_interface intf(PCLK,PRESETn);
//   initial begin 
//     uvm_config_db#(int):: set(null,"uvm_test_top.driver_h","interface",intf);
//   end 
  
  
  
endmodule 
