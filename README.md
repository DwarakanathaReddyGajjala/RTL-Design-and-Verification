# RTL Design and Verification

A structured repository covering **Verilog, SystemVerilog, Assertions, and UVM** through hands-on RTL design, verification, simulation, and debugging examples.

The repository follows a progressive path from fundamental Verilog design concepts to advanced SystemVerilog and UVM-based verification.

---

## Learning Path

```text
Verilog
   ↓
SystemVerilog
   ↓
Concurrent Assertions (SVA)
   ↓
UVM
   ↓
RTL Design & Verification
```

---

# 1. Verilog

Fundamentals of digital design and Verilog HDL, including combinational logic, sequential logic, procedural assignments, FSMs, counters, FIFOs, functions, and tasks.

### Basic Digital Design

- [Port Connection](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Port_Connection)
- [Simulation Regions](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Simulation_Regions)
- [Half Adder](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Half_Adder)
- [Full Adder](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Full_Adder)
- [Mux](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Mux)
  - [Mux 8x1](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Mux/mux_8x1)
  - [Mux 8x1 from 4x1 and 2x1](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Mux/Mux_8x1_from_4x1_2x1)
  - [Mux 16x1 from 8x1, 4x1 and 2x1](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Mux/mux_16x1_from_8x1_4x1_2x1)
- [Demux](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Demux)
- [Decoder](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Decoder)
- [Comparator](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/comparator)

### Procedural Assignments

- [Procedural Assignment](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Procedural%20Assignment)
  - [Blocking Assignment](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Procedural%20Assignment/Blocking_Assignment)
  - [Non-Blocking Assignment](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Procedural%20Assignment/Non_Blocking_Assignment)
  - [Blocking and Non-Blocking](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Procedural%20Assignment/Blocking_Non_Blocking)

### Latches

- [Latch](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Latch)
  - [D Latch](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Latch/d_latch)
  - [JK Latch](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Latch/jk_latch)
  - [T Latch](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Latch/t_latch)

- [Gated Latch](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Gated_Latch)
  - [SR Gated Latch](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Gated_Latch/SR_Gated_latch)
  - [D Gated Latch](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Gated_Latch/D_Gated_Latch)
  - [T Gated Latch](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Gated_Latch/T_Gated_Latch)

### Flip-Flops

- [Flip-Flop](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Flip_Flop)
  - [SR Flip-Flop](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Flip_Flop/sr_flip_flop)
  - [D Flip-Flop](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Flip_Flop/d_flip_flop)
  - [T Flip-Flop](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Flip_Flop/t_flip_flop)

### Shift Registers

- [Shift Registers](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Shift_registers)
  - [SISO](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Shift_registers/SISO)
  - [SISO Using 4 DFFs](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Shift_registers/SISO_Using_4DFFs)
  - [SISO Right Shift](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Shift_registers/SISO_Right_Shift)
  - [SIPO](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Shift_registers/SIPO)
  - [SIPO Using 4 DFFs](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Shift_registers/SIPO_Using_4DFFs)
  - [SIPO Right Shift](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Shift_registers/SIPO_Right_Shift)
  - [PIPO](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Shift_registers/PIPO)
  - [PIPO Using 4 DFFs](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Shift_registers/PIPO_Using_4DFFs)
  - [PISO](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Shift_registers/PISO)
  - [PISO Using 4 DFFs Mux 2x1](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Shift_registers/PISO_Using_4DFFS_Mux2x1)

### Counters

- [Ripple Counter](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Ripple_Counter)
  - [Up Counter](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Ripple_Counter/up_counter)
  - [Down Counter](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Ripple_Counter/down_counter)

- [Synchronous Counter](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/synchronous_counter)

### FSM and Memory

- [FSM](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/FSM)
  - [Mealy Non-Overlap](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/FSM/Mealy_non_overlap)
  - [Moore Non-Overlap](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/FSM/Moore_non_overlap)

- [FIFO](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/FIFO)

### Procedural Constructs

- [Generate Block](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Generate_Block)
- [Functions](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/Functions)
- [Task](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/Verilog/task)

---

# 2. SystemVerilog

SystemVerilog concepts used for advanced RTL design and verification, including OOP, randomization, constraints, inter-process communication, and assertions.

### OOP and Classes

- [Class](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Class)
  - [Class Object Handle](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Class/class_object_handle)
  - [Class Static Property](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Class/class_static_property)
  - [Class Static Method](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Class/class_static_method)
  - [Class this](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Class/class_this)
  - [Handle Assignment](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Class/handle_assignment)
  - [Parameterized Class](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Class/parametrized_class)

- [Inheritance](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Inheritance)
  - [Class Inheritance](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Inheritance/Class_Inheritance)
  - [Inheritance with super](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Inheritance/class_inheritance_super)

- [Copying Objects](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/copying_objects)
  - [Shallow Copy](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/copying_objects/shallow_copy)
  - [Deep Copy](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/copying_objects/deep_copy)

- [Polymorphism](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Polymorphism)
  - [Upcasting](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Polymorphism/upcasting)
  - [Method Overriding](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Polymorphism/method_overriding)
  - [Runtime Polymorphism](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Polymorphism/runtime_polymorphism_ex)

- [Casting](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/casting)
  - [Static Casting](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/casting/static_casting)
  - [Dynamic Casting](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/casting/dynamic_casting)

### Other SystemVerilog Features

- [Format Specifier](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/format_specifier)

### Randomization

- [Randomization](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/randomization)
  - [$random](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/randomization/$random)
  - [Random Functions](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/randomization/random_functions)
  - [Randomization](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/randomization/randomization)

### Constraints

- [Constraints](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/constraints)
  - [Inside Constraint](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/constraints/inside_constraint)
  - [Equality Operator](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/constraints/equality_operator)
  - [If-Else Constraint](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/constraints/if_else_constraint)
  - [Foreach Constraint](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/constraints/foreach_constraint)
  - [Implication Constraint](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/constraints/implication_constraint)
  - [Solve Before Constraint](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/constraints/solve_before_constraint)
  - [Distribution Constraint](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/constraints/distribution_constraint)
  - [Inline Constraint](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/constraints/inline_constraint)
  - [Soft Constraint](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/constraints/soft_constraint)
  - [Constraint Examples](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/constraints/constraint_ex)

### Inter-Process Communication

- [Inter-Process Communication](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Inter_Process_Communication)
  - [Event Trigger](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Inter_Process_Communication/event_trigger)
  - [Event Control](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Inter_Process_Communication/event_control)
  - [Semaphore](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Inter_Process_Communication/semaphore)
  - [Mailbox](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/Inter_Process_Communication/mailbox)

### Concurrent Assertions

- [Concurrent Assertions](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/concurrent_assertion)
  - [Non-Overlapping Operator](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/concurrent_assertion/non_overlapping_operator)
  - [Overlapping Operator](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/concurrent_assertion/overlapping_operator)
  - [Ranged Delay Operator](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/concurrent_assertion/ranged_delay_operator)
  - [Sequence Delay Operator](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/concurrent_assertion/sequence_delay_operator)
  - [Consecutive Repetition](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/concurrent_assertion/consecutive_repetition)
  - [First Match Operator](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/concurrent_assertion/first_match_operator)
  - [System Methods](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/SystemVerilog/concurrent_assertion/system_methods)

---

# 3. UVM

Hands-on UVM examples covering UVM phases, reporting, TLM communication, sequence-sequencer-driver communication, configuration, factory overrides, multiple agents, and virtual sequences.

### UVM Fundamentals

- [UVM Phases](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/UVM/UVM_Phases)
- [UVM Verbosity](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/UVM/UVM_VERBOSITY)

### TLM Ports

- [TLM Ports](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/UVM/TLM_Ports)
  - [Put Port](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/UVM/TLM_Ports/put_port)
  - [Analysis Port](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/UVM/TLM_Ports/analysis_port)
  - [TLM FIFO](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/UVM/TLM_Ports/TLM_FIFO)

### Sequence, Sequencer and Driver Communication

- [Sequence, Sequencer and Driver Communication](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/UVM/sequence_sequencer_driver_communication)
  - [UVM Factory Override](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/UVM/sequence_sequencer_driver_communication/uvm_factory_override)
  - [UVM Config DB](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/UVM/sequence_sequencer_driver_communication/uvm_config_db)
  - [Multiple Agents](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/UVM/sequence_sequencer_driver_communication/multiple_agents)
  - [Virtual Sequence and Virtual Sequencer](https://github.com/DwarakanathaReddyGajjala/RTL-Design-and-Verification/tree/main/UVM/sequence_sequencer_driver_communication/virtual_sequence_virtual_sequencer)

---

# 4. Tools

The repository uses the following tools for RTL design, SystemVerilog, UVM, simulation, and debugging:

- **Icarus Verilog** — Verilog simulation
- **VCS** — SystemVerilog and UVM simulation

---

# 5. Focus Areas

```text
RTL Design
├── Combinational Logic
├── Sequential Logic
├── Latches and Flip-Flops
├── Counters
├── Shift Registers
├── FSM
└── FIFO

SystemVerilog
├── OOP / Classes
│   ├── Inheritance
│   ├── Polymorphism
│   └── Casting
├── Randomization
├── Constraints
├── Inter-Process Communication
└── Assertions

UVM
├── UVM Phases
├── UVM Reporting
├── TLM Communication
├── Sequence / Sequencer / Driver
├── Configuration
├── Factory Override
├── Multiple Agents
└── Virtual Sequence / Virtual Sequencer
```

---

# 6. About This Repository

This repository contains my hands-on work in **RTL Design and Functional Verification**.

It documents my progression from **Verilog RTL design** to **SystemVerilog, Assertions, and UVM**, with practical implementations, simulation, and debugging.

The course and hands-on practice significantly improved my ability to **analyze simulation behavior, identify issues, and debug RTL and verification code**.

The repository focuses on:

- RTL design and digital design fundamentals
- SystemVerilog-based verification concepts
- Object-oriented programming for verification
- Constrained-random stimulus generation
- Concurrent assertions and functional checking
- UVM testbench architecture and communication
- Simulation-based analysis and debugging
- Practical implementation of design and verification concepts

---
