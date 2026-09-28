// Code your design here
module fifo #(parameter FIFO_DEPTH = 0,parameter FIFO_WIDTH = 0)
  (input                       clk_i,rst_i,wr_en,rd_en,
   input      [FIFO_WIDTH-1:0] data_in                ,
   output reg [FIFO_WIDTH-1:0] data_out               ,
   output reg                  full_o, empty_o         );
  
  /*
  ============================================================
                    FIFO — FIRST IN FIRST OUT
  ============================================================

  - A FIFO is a storage structure in which the first data
    written into the FIFO is the first data read from it.

  - Data is written into the FIFO through the write operation
    and read from the FIFO through the read operation.

  - The write pointer keeps track of the location where the
    next data will be written.

  - The read pointer keeps track of the location from where
    the next data will be read.

  - Therefore:

        First Data In → First Data Out

  ============================================================
*/
  parameter ADDR_WIDTH = $clog2(FIFO_DEPTH);
  
  reg  [ADDR_WIDTH-1:0] wr_ptr,rd_ptr          ;
  reg  [FIFO_WIDTH-1:0] memory [FIFO_DEPTH-1:0];
  reg  [FIFO_WIDTH-1:0] read_data              ;
  reg                   full, empty            ;

  
  wire [FIFO_WIDTH-1:0] memory_debug0 =  memory[0]; 
  wire [FIFO_WIDTH-1:0] memory_debug1 =  memory[1]; 
  wire [FIFO_WIDTH-1:0] memory_debug2 =  memory[2]; 
  wire [FIFO_WIDTH-1:0] memory_debug3 =  memory[3]; 
  wire [FIFO_WIDTH-1:0] memory_debug4 =  memory[4]; 
  wire [FIFO_WIDTH-1:0] memory_debug5 =  memory[5]; 
  wire [FIFO_WIDTH-1:0] memory_debug6 =  memory[6]; 
  wire [FIFO_WIDTH-1:0] memory_debug7 =  memory[7]; 
  wire [FIFO_WIDTH-1:0] memory_debug8 =  memory[8]; 
  wire [FIFO_WIDTH-1:0] memory_debug9 =  memory[9]; 

  
  /*
  ============================================================
                    FIFO Write  opertion
  ============================================================

  1. WRITE ENABLE (wr_en)
  ------------------------------------------------------------
  - wr_en controls the write operation of the FIFO.

  - When wr_en = 1, data can be written into the FIFO.

  - The write operation normally occurs on the active edge
    of the write clock.

  - Data should not be written when the FIFO is FULL.

        wr_en = 1 + !full → Write Data

  2. FULL
  ------------------------------------------------------------
  - full indicates that the FIFO has no available storage
    locations for new data.

  - When full = 1, a new write operation should not be
    performed.

        full = 1 → FIFO is FULL


  3.FIFO  Write OPERATION
  ------------------------------------------------------------

        wr_en = 1 and full  = 0 → WRITE

  - wr_en controls when data enters the FIFO.

  - full prevents writing when the FIFO is full.


  ============================================================
*/
  always @(posedge clk_i) 
    if(rst_i) begin 
      wr_ptr <= '0  ;
      full   <= 1'b0;
      for (int i = 0; i <= FIFO_DEPTH-1; i = i +1)
        memory[i] = '0;
    end 
    else
      if (wr_en && ~full) begin 
        memory[wr_ptr] <= data_in      ;
        wr_ptr         <= wr_ptr + 1'b1;
        empty          <= 1'b0         ;
        if(wr_ptr == FIFO_DEPTH-1) begin 
          full         <= 1'b1;
          wr_ptr       <= '0  ;
        end 
      end 
      else  begin 
        wr_ptr         <= '0  ;
        full           <= 1'b0;         
      end 
  
  /*
  ============================================================
                    FIFO CONTROL SIGNALS
  ============================================================


  1. READ ENABLE (rd_en)
  ------------------------------------------------------------
  - rd_en controls the read operation of the FIFO.

  - When rd_en = 1, data can be read from the FIFO.

  - The read operation normally occurs on the active edge
    of the read clock.

  - Data should not be read when the FIFO is EMPTY.

        rd_en = 1 + !empty → Read Data


  2. EMPTY
  ------------------------------------------------------------
  - empty indicates that the FIFO does not contain any data
    available to be read.

  - When empty = 1, a read operation should not be performed.

        empty = 1 → FIFO is EMPTY


  3.FIFO Read  OPERATION
  ------------------------------------------------------------

        rd_en = 1 and empty = 0 → READ

  - rd_en controls when data leaves the FIFO.

  - empty prevents reading when the FIFO is empty.

  ============================================================
*/
  
// read logic 
  always @(posedge clk_i) 
    if(rst_i) begin 
      rd_ptr     <= '0  ;
      read_data  <= '0  ;
      empty      <= 1'b1;
    end 
    else 
      if(rd_en && ~empty) begin 
        read_data <= memory[rd_ptr] ;
        rd_ptr    <= rd_ptr + 1'b1  ;
        if(rd_ptr ==  FIFO_DEPTH-1) begin 
          empty   <= 1'b1           ;
          rd_ptr  <= '0             ;
        end 
      end 
      else  begin
        rd_ptr    <= '0; 
        read_data <= '0;
      end 
  
// output connection 
  assign empty_o   = empty    ;
  assign full_o    = full     ;
  assign data_out  = read_data;

endmodule
