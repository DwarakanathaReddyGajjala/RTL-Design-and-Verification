`include "uvm_macros.svh" 
// import uvm_pkg :: *;

//monitor
class monitor extends uvm_monitor;
  `uvm_component_utils(monitor);

  function new(string name = "monitor", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of monitor");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of monitor");
  endfunction 

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("inside connect phase of monitor");
  endfunction 

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    $display("inside end of elaboration phase of monitor");
  endfunction 

  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    $display("inside start of simulation phase of monitor");
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
//     phase.raise_objection(this);
    $display($time,"inside run phase of monitor");
    #12;
    $display($time,"after [%0t] time unit run phase of monitor",$time);
//     phase.drop_objection(this);
  endtask 
  
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    $display("inside extract phase of monitor");
  endfunction 
  
  function void check_phase(uvm_phase phase);
    super.check_phase(phase);
    $display("inside check phase of monitor");
  endfunction 
  
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    $display("inside report phase of monitor");
  endfunction 
  
  function void final_phase(uvm_phase phase);
    super.final_phase(phase);
    $display("inside final phase of monitor");
  endfunction 
  
endclass


//driver
class driver extends uvm_driver;
  `uvm_component_utils(driver);

  function new(string name = "driver", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of driver");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of driver");
  endfunction 

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("inside connect phase of driver");
  endfunction 

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    $display("inside end of elaboration phase of driver");
  endfunction 

  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    $display("inside start of simulation phase of driver");
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
//     phase.raise_objection(this);
    $display($time,"inside run phase of driver");
    #13;
    $display($time,"after [%0t] time unit run phase of driver",$time);
//     phase.drop_objection(this);
  endtask 
  
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    $display("inside extract phase of driver");
  endfunction 
  
  function void check_phase(uvm_phase phase);
    super.check_phase(phase);
    $display("inside check phase of driver");
  endfunction 
  
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    $display("inside report phase of driver");
  endfunction 
  
  function void final_phase(uvm_phase phase);
    super.final_phase(phase);
    $display("inside final phase of driver");
  endfunction 
  
endclass


//agent 
class agent extends uvm_agent;
  driver driver_h;
  monitor monitor_h;

  `uvm_component_utils(agent);

  function new(string name = "agent", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of agent");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of agent");
    driver_h = driver :: type_id :: create("driver_h",this);
    monitor_h  = monitor :: type_id :: create("monitor_h",this);

  endfunction 

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("inside connect phase of agent");
  endfunction 

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    $display("inside end of elaboration phase of agent");
  endfunction 

  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    $display("inside start of simulation phase of agent");
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
//     phase.raise_objection(this);
    $display($time,"inside run phase of agent");
    #18;
    $display($time,"after [%0t] time unit run phase of agent",$time);
//     phase.drop_objection(this); 
  endtask 
  
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    $display("inside extract phase of agent");
  endfunction 
  
  function void check_phase(uvm_phase phase);
    super.check_phase(phase);
    $display("inside check phase of agent");
  endfunction 
  
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    $display("inside report phase of agent");
  endfunction 
  
  function void final_phase(uvm_phase phase);
    super.final_phase(phase);
    $display("inside final phase of agent");
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

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("inside connect phase of env");
  endfunction 

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    $display("inside end of elaboration phase of env");
  endfunction 

  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    $display("inside start of simulation phase of env");
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
//     phase.raise_objection(this);
    $display($time,"inside run phase of env");
    #19;
    $display($time,"after [%0t] time unit run phase of env",$time);
//     phase.drop_objection(this);   
  endtask 
  
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    $display("inside extract phase of env");
  endfunction 
  
  function void check_phase(uvm_phase phase);
    super.check_phase(phase);
    $display("inside check phase of env");
  endfunction 
  
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    $display("inside report phase of env");
  endfunction 
  
  function void final_phase(uvm_phase phase);
    super.final_phase(phase);
    $display("inside final phase of env");
  endfunction 
  
endclass

//test
class test extends uvm_test;
  env env_h;
  `uvm_component_utils(test);

  function new(string name = "test", uvm_component parent = null);
    super.new(name,parent);
    $display("inside function new of test");
  endfunction 

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("inside build phase of test");
    env_h = env :: type_id :: create("env_h",this);
  endfunction 

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display("inside connect phase of test");
  endfunction 

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    $display("inside end of elaboration phase of test");
  endfunction 

  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    $display("inside start of simulation phase of test");
  endfunction

  task  run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    $display($time,"inside run phase of test");
    #10;
    $display($time,"after 10 time unit run phase of test");
    phase.drop_objection(this);   
  endtask 
  
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    $display("inside extract phase of test");
  endfunction 
  
  function void check_phase(uvm_phase phase);
    super.check_phase(phase);
    $display("inside check phase of test");
  endfunction 
  
  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    $display("inside report phase of test");
  endfunction 
  
  function void final_phase(uvm_phase phase);
    super.final_phase(phase);
    $display("inside final phase of test");
  endfunction 
  
endclass
        
//tb
module uvm_phases_tb;
  
  initial begin 
    run_test("test");
  end 
  
endmodule 
