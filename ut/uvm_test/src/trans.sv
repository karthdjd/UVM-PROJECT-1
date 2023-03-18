`include "uvm_macros.svh"
 import uvm_pkg::*;


typedef enum bit [2:0] {wrrdfixed = 0, wrrdincr = 1, wrrdwrap = 2, wrrderrfix = 3,   rstdut = 4 } oper_mode;

class transaction extends uvm_sequence_item;
  `uvm_object_utils(transaction)
  
   

  function new(string name = "transaction");
    super.new(name);
  endfunction
  

  int len = 0;
  rand bit [3:0] id;
  oper_mode op;
  rand bit awvalid;
  bit awready;
  bit [3:0] awid;
  rand bit [3:0] awlen;
  rand bit [2:0] awsize; 
  rand bit [31:0] awaddr;
  rand bit [1:0] awburst;
  
  bit wvalid;
  bit wready;
  bit [3:0] wid;
  rand bit [31:0] wdata;
  rand bit [3:0] wstrb;
  bit wlast;
  
  bit bready;
  bit bvalid;
  bit [3:0] bid;
  bit [1:0] bresp;
  
  
  rand bit arvalid; 
  bit arready; 
  bit [3:0] arid; 
  rand bit [3:0] arlen; 
  bit [2:0] arsize;
  rand bit [31:0] araddr; 
  rand bit [1:0] arburst;
  
 
  
  bit rvalid; 
  bit rready; 
  bit [3:0] rid; 
  bit [31:0] rdata;
  bit [3:0] rstrb; 
  bit rlast; 
  bit [1:0] rresp; 
  
 
  constraint txid { awid == id; wid == id; bid == id; arid == id; rid == id;  }
  constraint burst {awburst inside {0,1,2}; arburst inside {0,1,2};}
  constraint valid {awvalid != arvalid;}
  constraint length {awlen == arlen;}
 
endclass 

