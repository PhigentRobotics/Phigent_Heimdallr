// `include "arch_para.vh"

interface AXIS_Inf #(DATA_W=128);
  logic  [DATA_W  -1:0]    tdata  ;
  logic                    tready ;
  logic                    tvalid ;
  logic                    tlast  ;
  logic  [DATA_W/8-1:0]    tkeep  ;
  modport slave       (input  tdata,tvalid,tlast,        output tready);
  modport shim_slave  (input  tdata,tvalid,tlast,tkeep,  output tready);
  modport master      (output tdata,tvalid,tlast,        input  tready);
  modport shim_master (output tdata,tvalid,tlast,tkeep,  input  tready);
endinterface

interface AXI4_WR_Inf #(ID_W=6, ADDR_W=40, LEN_W=8, DATA_W=128);
  logic  [ID_W            -1:0]    awid            ;
  logic  [ADDR_W          -1:0]    awaddr          ;
  logic  [LEN_W           -1:0]    awlen           ;
  logic  [2:0]                     awsize          ;
  logic  [1:0]                     awburst         ;
  logic  [1:0]                     awlock          ;
  logic  [3:0]                     awcache         ;
  logic  [2:0]                     awprot          ;
  logic  [3:0]                     awqos           ;
  logic                            awvalid         ;
  logic                            awready         ;
  logic  [ID_W            -1:0]    wid             ;
  logic  [DATA_W          -1:0]    wdata           ;
  logic  [DATA_W/8        -1:0]    wstrb           ;
  logic                            wlast           ;
  logic                            wvalid          ;
  logic                            wready          ;
  logic  [ID_W-1:0]                bid             ;
  logic  [1:0]                     bresp           ;
  logic                            bvalid          ;
  logic                            bready          ;

  modport slave(output awready,wready,bid,bresp,bvalid, input awid,awaddr,awlen,awsize,awburst,awlock,awcache,awprot,awqos,awvalid,wid,wdata,wstrb,wlast,wvalid,bready); 
  modport master(input awready,wready,bid,bresp,bvalid, output awid,awaddr,awlen,awsize,awburst,awlock,awcache,awprot,awqos,awvalid,wid,wdata,wstrb,wlast,wvalid,bready); 
endinterface

interface AXI4_RD_Inf #(ID_W=6, ADDR_W=40, LEN_W=8, DATA_W=128);
  logic  [ID_W            -1:0]    arid            ;
  logic  [ADDR_W          -1:0]    araddr          ;
  logic  [LEN_W           -1:0]    arlen           ;
  logic  [2:0]                     arsize          ;  
  logic  [1:0]                     arburst         ;  
  logic  [1:0]                     arlock          ;  
  logic  [3:0]                     arcache         ;  
  logic  [2:0]                     arprot          ;  
  logic  [3:0]                     arqos           ;  
  logic                            arvalid         ;  
  logic                            arready         ;  
  logic  [ID_W            -1:0]    rid             ;
  logic  [DATA_W          -1:0]    rdata           ;
  logic  [1:0]                     rresp           ;  
  logic                            rlast           ;  
  logic                            rvalid          ;  
  logic                            rready          ;  

  modport slave(output arready,rid,rdata,rresp,rlast,rvalid,  input arid,araddr,arlen,arsize,arburst,arlock,arcache,arprot,arqos,arvalid,rready);
  modport master(input arready,rid,rdata,rresp,rlast,rvalid,  output arid,araddr,arlen,arsize,arburst,arlock,arcache,arprot,arqos,arvalid,rready);
endinterface

interface AXI_L_Inf #(ID_W=6, ADDR_W=32, LEN_W=4, DATA_W=32);
  logic  [ADDR_W-1: 0]               awaddr ;
  logic  [2 : 0]                     awprot ;
  logic                              awvalid;
  logic                              awready;
  logic  [DATA_W-1 : 0]              wdata  ;
  logic  [DATA_W/8-1 : 0]            wstrb  ;
  logic                              wvalid ;
  logic                              wready ;
  logic  [1 : 0]                     bresp  ;
  logic                              bvalid ;
  logic                              bready ;
  logic  [ADDR_W-1: 0]               araddr ;
  logic  [2 : 0]                     arprot ;
  logic                              arvalid;
  logic                              arready;
  logic  [DATA_W  -1 : 0]            rdata  ;
  logic  [1 : 0]                     rresp  ;
  logic                              rvalid ;
  logic                              rready ;

  modport slave(output awready,wready,bresp,bvalid,arready,rdata,rresp,rvalid,  input awaddr,awprot,awvalid,wdata,wstrb,wvalid,bready,araddr,arprot,arvalid,rready);
  modport master(input awready,wready,bresp,bvalid,arready,rdata,rresp,rvalid,  output awaddr,awprot,awvalid,wdata,wstrb,wvalid,bready,araddr,arprot,arvalid,rready);
endinterface
