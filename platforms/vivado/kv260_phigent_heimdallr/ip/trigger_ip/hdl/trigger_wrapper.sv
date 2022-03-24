//=========================
// Engineer:  Wu Di
// Email: 
// Create Date: 
// Module Name: 
// Project Name: 
// Description: 
//=========================

module trigger_wrapper#(
  parameter CLKIN_FREQ     = 100000000,
  parameter TRIGGER_FREQ   = 30,
  parameter AXI_ADDR_W     = 32,
  parameter AXIL_ADDR_W    = 12, //axi lite address space : 4MB
  parameter AXIL_DATA_W    = 32  //the unit size of axi-lite
)(
  
// Global signals
(* X_INTERFACE_INFO       = "xilinx.com:signal:clock:1.0 s_axi_aclk CLK" *)
(* X_INTERFACE_PARAMETER  = "ASSOCIATED_BUSIF S_AXI_CONTROL, ASSOCIATED_RESET s_axi_aresetn" *)
input                     s_axi_aclk                  ,

(* X_INTERFACE_INFO       = "xilinx.com:signal:reset:1.0 s_axi_aresetn RST" *)
(* X_INTERFACE_PARAMETER  = "POLARITY ACTIVE_LOW" *)
input                     s_axi_aresetn               ,

output                    trigger,

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL AWADDR"  *)  input   [AXIL_ADDR_W      -1:0] s_axi_control_awaddr   ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL AWPROT"  *)  input   [2                  :0] s_axi_control_awprot   ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL AWVALID" *)  input                           s_axi_control_awvalid  ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL AWREADY" *)  output                          s_axi_control_awready  ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL WDATA"   *)  input   [AXIL_DATA_W      -1:0] s_axi_control_wdata    ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL WSTRB"   *)  input   [AXIL_DATA_W/8    -1:0] s_axi_control_wstrb    ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL WVALID"  *)  input                           s_axi_control_wvalid   ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL WREADY"  *)  output                          s_axi_control_wready   ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL BRESP"   *)  output  [1                  :0] s_axi_control_bresp    ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL BVALID"  *)  output                          s_axi_control_bvalid   ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL BREADY"  *)  input                           s_axi_control_bready   ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL ARADDR"  *)  input   [AXIL_ADDR_W      -1:0] s_axi_control_araddr   ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL ARPROT"  *)  input   [2                  :0] s_axi_control_arprot   ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL ARVALID" *)  input                           s_axi_control_arvalid  ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL ARREADY" *)  output                          s_axi_control_arready  ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL RDATA"   *)  output  [AXIL_DATA_W      -1:0] s_axi_control_rdata    ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL RRESP"   *)  output  [1                  :0] s_axi_control_rresp    ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL RVALID"  *)  output                          s_axi_control_rvalid   ,
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL RREADY"  *)  input                           s_axi_control_rready
);

/***********************************************************
  basic variables
***********************************************************/
localparam  CLR_0         = 1'b0;
localparam  SET_1         = 1'b1;
localparam  S_AXI_CLK_INDEPENDENT = 0;

wire  clk     = s_axi_aclk        ;
wire  rst     = ~s_axi_aresetn    ;

/**********************************************************
 Interface split
***********************************************************/

AXI_L_Inf          AXI_Lite();

assign  AXI_Lite.awaddr     = s_axi_control_awaddr   ;
assign  AXI_Lite.awprot     = s_axi_control_awprot   ;
assign  AXI_Lite.awvalid    = s_axi_control_awvalid  ;
assign  AXI_Lite.wdata      = s_axi_control_wdata    ;
assign  AXI_Lite.wstrb      = s_axi_control_wstrb    ;
assign  AXI_Lite.wvalid     = s_axi_control_wvalid   ;
assign  AXI_Lite.bready     = s_axi_control_bready   ;
assign  AXI_Lite.araddr     = s_axi_control_araddr   ;
assign  AXI_Lite.arprot     = s_axi_control_arprot   ;
assign  AXI_Lite.arvalid    = s_axi_control_arvalid  ;
assign  AXI_Lite.rready     = s_axi_control_rready   ;
assign  s_axi_control_awready  = AXI_Lite.awready    ;
assign  s_axi_control_wready   = AXI_Lite.wready     ;
assign  s_axi_control_bresp    = AXI_Lite.bresp      ;
assign  s_axi_control_bvalid   = AXI_Lite.bvalid     ;
assign  s_axi_control_arready  = AXI_Lite.arready    ;
assign  s_axi_control_rdata    = AXI_Lite.rdata      ;
assign  s_axi_control_rresp    = AXI_Lite.rresp      ;
assign  s_axi_control_rvalid   = AXI_Lite.rvalid     ;


trigger_top#(
  .CLKIN_FREQ      (CLKIN_FREQ   ),
  .TRIGGER_FREQ    (TRIGGER_FREQ ),
  .AXI_ADDR_W      (AXI_ADDR_W   ),
  .AXIL_ADDR_W     (AXIL_ADDR_W  ), //axi lite address space : 4MB
  .AXIL_DATA_W     (AXIL_DATA_W  )  //the unit size of axi-lite
)trigger_top
(
  .clk             (clk          ), //for trigger counter, must be 100MHz clock
  .rst             (rst          ),
  .trigger         (trigger      ),
  .AXI_Lite        (AXI_Lite     )  //AXI lite intf for fetching config register from DDR
);



endmodule