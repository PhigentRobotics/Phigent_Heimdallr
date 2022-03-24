//=========================
// Engineer:  Wu Di
// Email: 
// Create Date: 
// Module Name: 
// Project Name: 
// Description: 

module trigger_top #(
  parameter CLKIN_FREQ     = 100000000,
  parameter TRIGGER_FREQ   = 30,
  parameter AXI_ADDR_W     = 32,
  parameter AXIL_ADDR_W    = 12, //axi lite address space : 4MB
  parameter AXIL_DATA_W    = 32  //the unit size of axi-lite
)(
  input                            clk            , //for trigger counter, must be 100MHz clock
  input                            rst            ,
  
  output  reg                      trigger        ,
  // AXI Lite for fetch register from PS
  AXI_L_Inf.slave                  AXI_Lite         //AXI lite intf for fetching config register from DDR
);

// localparam CLKIN_FREQ     = 100000000; //100MHz
localparam FREQ_CNT       = CLKIN_FREQ/TRIGGER_FREQ;
localparam FREQ_CNT_BW    = $clog2(FREQ_CNT-1) + 1;
localparam HIGH_CLK_N     = FREQ_CNT/2;

wire                    trigger_start;
wire                    trigger_reset;
reg  [FREQ_CNT_BW -1:0] clk_cnt=0    ;
// for debug
wire [AXIL_DATA_W -1:0] reg_clk_cnt = clk_cnt;

reg_map #(
  .AXI_ADDR_W        (AXI_ADDR_W       ),
  .AXIL_ADDR_W       (AXIL_ADDR_W      ), //axi lite address space : 4MB
  .AXIL_DATA_W       (AXIL_DATA_W      )  //the unit size of axi-lite
)
reg_map(
  .clk               (clk              ),
  .clk_en            (1'b1             ),
  .rst               (rst              ),
  .trigger_start     (trigger_start    ),
  .trigger_reset     (trigger_reset    ),
  .reg_clk_cnt       (reg_clk_cnt      ),
  .AXI_Lite          (AXI_Lite         )
);

always @ (posedge clk)begin
  if(trigger_reset)
    clk_cnt  <= 'h0;
  else if(trigger_start)
    clk_cnt  <= (clk_cnt == FREQ_CNT-1) ? 'h0 : clk_cnt + 1'b1;
  else
    clk_cnt  <= 'h0;
end

always @ (posedge clk)begin
  if(trigger_reset)
    trigger  <= 'h0;
  else if(trigger_start)
    trigger  <= (clk_cnt < HIGH_CLK_N-1);
  else
    trigger  <= 'h0;
end

endmodule