//=========================
// Engineer:  Wu Di
// Email: 
// Create Date: 
// Module Name: 
// Project Name: 
// Description: 


module reg_map #(
  parameter AXI_ADDR_W       = 32   ,
  parameter AXIL_ADDR_W      = 12   , //axi lite address space : 4MB
  parameter AXIL_DATA_W      = 32     //the unit size of axi-lite
)(
  input                          clk             ,
  input                          clk_en          ,
  input                          rst             ,
  //--------- reg for sys ctrl -------------------------//
  output                         trigger_start   ,
  output reg                     trigger_reset=0 ,
  input   [AXIL_DATA_W-1:0]      reg_clk_cnt     ,
  // AXI Lite 
  AXI_L_Inf.slave                AXI_Lite
);

//AXI Lite assignment
  wire  [AXIL_ADDR_W-1:0]      AWADDR ;
  wire                         AWVALID;
  wire  [AXIL_DATA_W-1:0]      WDATA  ;
  wire  [AXIL_DATA_W/8-1:0]    WSTRB  ;
  wire                         WVALID ;
  wire                         BREADY ;
  wire  [AXIL_ADDR_W-1:0]      ARADDR ;
  wire                         ARVALID;
  wire                         RREADY ;
  wire                         AWREADY;
  wire                         WREADY ;
  wire  [1:0]                  BRESP  ;
  wire                         BVALID ;
  wire                         ARREADY;
  wire  [AXIL_DATA_W-1:0]      RDATA  ;
  wire  [1:0]                  RRESP  ;
  wire                         RVALID ;
  
  assign AWADDR  = AXI_Lite.awaddr ;
  assign AWVALID = AXI_Lite.awvalid;
  assign WDATA   = AXI_Lite.wdata  ;
  assign WSTRB   = AXI_Lite.wstrb  ;
  assign WVALID  = AXI_Lite.wvalid ;
  assign BREADY  = AXI_Lite.bready ;
  assign ARADDR  = AXI_Lite.araddr ;
  assign ARVALID = AXI_Lite.arvalid;
  assign RREADY  = AXI_Lite.rready ;
  assign AXI_Lite.awready = AWREADY;
  assign AXI_Lite.wready  = WREADY ;
  assign AXI_Lite.bresp   = BRESP  ;
  assign AXI_Lite.bvalid  = BVALID ;
  assign AXI_Lite.arready = ARREADY;
  assign AXI_Lite.rdata   = RDATA  ;
  assign AXI_Lite.rresp   = RRESP  ;
  assign AXI_Lite.rvalid  = RVALID ;

/***********************************************************
  basic variables
***********************************************************/
localparam  REG_RSVD                = 32'b0  ;
localparam  CLR_0                   = 1'b0   ;
localparam  SET_1                   = 1'b1   ;

//------------------------Address Info-------------------
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global reg_xvdpu_irq Enable Register
//        bit 0  - Global reg_xvdpu_irq Enable (Read/Write)
//        others - reserved
// 0x08 : IP reg_xvdpu_irq Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP reg_xvdpu_irq Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved

// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL         = 12'h00,
    ADDR_GIE             = 12'h04,
    ADDR_IER             = 12'h08,
    ADDR_ISR             = 12'h0c,
	
	ADDR_FRQ             = 12'h10,
	ADDR_CLK_CNT         = 12'h14,
	
    WRIDLE               = 2'd0,
    WRDATA               = 2'd1,
    WRRESP               = 2'd2,
    RDIDLE               = 2'd0,
    RDDATA               = 2'd1,
    ADDR_BITS            = 12;

//**********************************************
//---Local signal-------------------
//**********************************************
    
reg                           ap_idle;
reg                           stereo_finish_sts_r;
reg  [1:0]                    wstate = WRIDLE;
reg  [1:0]                    wnext;
reg  [ADDR_BITS-1:0]          waddr;
wire [31:0]                   wmask;
wire                          aw_hs;
wire                          w_hs;
reg  [1:0]                    rstate = RDIDLE;
reg  [1:0]                    rnext;
reg  [31:0]                   rdata;
wire                          ar_hs;
wire [ADDR_BITS-1:0]          raddr;
// internal registers
wire                          int_ap_idle;
wire                          int_ap_ready;
reg                           int_ap_done = 1'b0;
reg                           int_ap_start = 1'b0;
reg                           int_auto_restart = 1'b0;
wire                          timelock_w        ;
wire                          reg_timer_ena     ;
wire                          reg_timer_out     ;
wire [11:0]                   reg_timer_hour    ;
reg [31:0]                    exec_cycle_l_r  = 'h0;
reg [31:0]                    exec_cycle_h_r  = 'h0;
reg                           exec_flag = 'h0;
wire                          pos_ap_start;
wire                          pos_finish  ;
wire                          neg_finish  ;
wire                          ap_ready = pos_finish;

reg                           int_gie = 1'b0;
reg [1:0]                     int_ier = 2'b0;
reg [1:0]                     int_isr = 2'b0;


//------------------------AXI write fsm------------------
assign AWREADY = (~rst) & (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge clk) begin
    if (rst)
        wstate <= WRIDLE;
    else if (clk_en)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge clk) begin
    if (clk_en) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (~rst) && (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge clk) begin
    if (rst)
        rstate <= RDIDLE;
    else if (clk_en)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata

reg ap_reset,ap_reset_done;

always @(posedge clk) begin
    if (clk_en) begin
        if (ar_hs) begin
            rdata <= 1'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_ap_done;
                    rdata[2] <= ap_idle;
                    rdata[3] <= ap_ready;
                    rdata[5] <= ap_reset;
                    rdata[6] <= ap_reset_done;                    
                    rdata[7] <= int_auto_restart;
                end
                ADDR_GIE        :     rdata <= int_gie;   
                ADDR_IER        :     rdata <= int_ier;
                ADDR_ISR        :     rdata <= int_isr; 
				
				ADDR_CLK_CNT    :     rdata <= reg_clk_cnt;

                default         :     rdata <= 32'h0;                
            endcase
        end
    end
end


//--------------------------------------------------------
wire trigger_irq;
assign trigger_irq    = int_gie & (|int_isr) ;

// int_ap_start
always @(posedge clk) begin
    if (rst)
        int_ap_start <= 1'b0;
    else if (clk_en) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end
assign trigger_start = int_ap_start;
reg int_ap_start_r;
always @(posedge clk) begin
    int_ap_start_r <= int_ap_start;
end
assign pos_ap_start = int_ap_start & (~int_ap_start_r);

// int_ap_done
always @(posedge clk) begin
    if (rst)
        int_ap_done <= 1'b0;
    else if (clk_en) begin
       // int_ap_done <= stereo_finish_async_p2;//fix the timeout bug   
        if (pos_finish)
            int_ap_done <= 1'b1;
        else if (ar_hs && (raddr == ADDR_AP_CTRL) )
            int_ap_done <= 1'b0; // clear on read
    end
end
//reset_done logicc
always @(posedge clk) begin
    if (rst)
        ap_reset <= 1'b0;
    else if (clk_en) begin
        if (w_hs && (waddr == ADDR_AP_CTRL) && WSTRB[0] && WDATA[5])
            ap_reset <=  1'b1;
        else
            ap_reset <= 1'b0;
    end
end

localparam RST_NUM = 40;

reg rst_flag =1;
reg [23:0] cnt =0;
always @ ( posedge clk ) begin
    if ( ap_reset )
        rst_flag <= 1'b1;
    else if ( cnt >= RST_NUM)
        rst_flag <= 1'b0;
end
always @ ( posedge clk ) begin
    if ( ap_reset )
        cnt <= 'd0;
    else if (rst_flag ) begin
        if ( cnt >= RST_NUM )
            cnt <= 'd0;
        else 
            cnt <= cnt + 1'b1;
    end
end

always @ (posedge clk ) begin
  if (rst )
    ap_reset_done <= 1'b0;
  else if (clk_en) begin
    if (cnt >= RST_NUM)
      ap_reset_done <= 1'b1;
    else if (ar_hs && (raddr == ADDR_AP_CTRL) )
      ap_reset_done <= 1'b0;
  end
end
// int_auto_restart
always @(posedge clk) begin
    if (rst)
        int_auto_restart <= 1'b0;
    else if (clk_en) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

always @(posedge clk) begin
    if (rst)
        int_gie <= 1'b0;
    else if (clk_en) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end
//int_ier
always @(posedge clk) begin
    if (rst)
        int_ier <= 1'b0;
    else if (clk_en) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end
//int_isr[0]
always @(posedge clk) begin
    if (rst)
        int_isr[0] <= 1'b0;
    else if (clk_en) begin
       // if (int_ier[0] & int_ap_done)
        if (int_ier[0] & pos_finish )//fix the timeout bug
            int_isr[0] <= 1'b1;
        //else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
        else if (ar_hs && ( raddr == ADDR_ISR ) )
            //int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
            int_isr[0] <= 1'b0; // toggle on write
    end
end
//int_isr[1]
always @(posedge clk) begin
    if (rst)
        int_isr[1] <= 1'b0;
    else if (clk_en) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end


/***********************************************************
 *  async reg
 *  ***********************************************************/
// (* ASYNC_REG = "true" *)  reg stereo_finish_async_p1  = 0;
// (* ASYNC_REG = "true" *)  reg stereo_finish_async_p2  = 0;
// always@(posedge clk)begin
  // stereo_finish_async_p1 <= corr_finish           ;
  // stereo_finish_async_p2 <= stereo_finish_async_p1  ;
// end


// wire ap_start = int_ap_start;
// reg ap_start_r;
// always @(posedge clk) begin 
  // begin 
    // ap_start_r <= ap_start;
  // end
// end

// wire ap_done = int_ap_done;

// wire ap_start_pulse = ap_start & (~ap_start_r);           

// always @ ( posedge clk ) begin
    // if ( rst )
        // stereo_finish_sts_r <= 1'b0;
    // else
        // stereo_finish_sts_r <= stereo_finish_async_p2;            
// end
// assign pos_finish = (!stereo_finish_sts_r) & stereo_finish_async_p2;
// assign neg_finish = stereo_finish_sts_r & (!stereo_finish_async_p2);

// always @(posedge clk) begin 
  // if (rst) begin 
    // ap_idle <= 1'b1;
  // end
  // else begin 
    // ap_idle <= pos_finish     ? 1'b1 : 
               // ap_start_pulse ? 1'b0 : 
               // ap_idle;
  // end
// end

//-----------------------------------------------------------

// 12'h14 12'h18
//reg resetn;
//always @(posedge clk) begin
//    if (rst)
//        resetn <= 1;
//    else if (clk_en) begin
//        if (w_hs && waddr == 12'h14)
//            resetn <= WDATA[0] ;
//        else if (w_hs && waddr == 12'h18)
//            resetn <= WDATA[0] ;
//    end
//end
reg rst_vld = 1'b0;
reg [7:0] cnt_rst = 8'h0;
always @ ( posedge clk ) begin
    if ( rst ) begin
        cnt_rst  <= 'd0;
        rst_vld  <= 1'b1;
    end
    else if ( cnt_rst >= 'd200 ) begin
        cnt_rst  <= cnt_rst;
        rst_vld  <= 1'b0;    
    end
    else begin
        cnt_rst  <= cnt_rst + 1'b1;
        rst_vld  <= 1'b0;    
    end
end

wire soft_reset = rst_vld || rst_flag;

//*********** sync the reset to M_CLK ************//
reg stereo_reset_pre1 = 0;
reg stereo_reset_pre2 = 0;

always @ (posedge clk) begin
    stereo_reset_pre1  <= soft_reset;
    stereo_reset_pre2  <= stereo_reset_pre1;
    trigger_reset       <= stereo_reset_pre2;
end
//************************************************//

// always @(posedge clk) begin
  // if(clk_en && w_hs)begin
	// if(waddr==ADDR_FRQ)    reg_trigger_freq    <= WDATA;
  // end
// end


//------------------------Memory logic-------------------

endmodule
