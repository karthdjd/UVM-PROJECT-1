`include "trans.sv"
class rst_dut extends uvm_sequence#(transaction);
  `uvm_object_utils(rst_dut)
  
  transaction tr;

  function new(string name = "rst_dut");
    super.new(name);
  endfunction

  
  virtual task body();
    repeat(5)
      begin
        tr = transaction::type_id::create("tr");
         $display("------------------------------");
        `uvm_info("SEQ", "Sending RST Transaction to DRV", UVM_NONE);
        start_item(tr);
        assert(tr.randomize);
        tr.op      = rstdut;
        finish_item(tr);
      end
  endtask
  

endclass






class valid_wrrd_fixed extends uvm_sequence#(transaction);
  `uvm_object_utils(valid_wrrd_fixed)
  
  transaction tr;

  function new(string name = "valid_wrrd_fixed");
    super.new(name);
  endfunction

  
  virtual task body();

        tr = transaction::type_id::create("tr");
        $display("------------------------------");
        `uvm_info("SEQ", "Sending Fixed mode Transaction to DRV", UVM_NONE);
        start_item(tr);
        assert(tr.randomize);
          tr.op      = wrrdfixed;
          tr.awlen   = 7;
          tr.awburst = 0;
          tr.awsize  = 2;
       
        finish_item(tr);
  endtask
  

endclass


class valid_wrrd_incr extends uvm_sequence#(transaction);
  `uvm_object_utils(valid_wrrd_incr)
  
  transaction tr;

  function new(string name = "valid_wrrd_incr");
    super.new(name);
  endfunction

  
  virtual task body();
        tr = transaction::type_id::create("tr");
        $display("------------------------------");
        `uvm_info("SEQ", "Sending INCR mode Transaction to DRV", UVM_NONE);
        start_item(tr);
        assert(tr.randomize);
          tr.op      = wrrdincr;
          tr.awlen   = 7;
          tr.awburst = 1;
          tr.awsize  = 2;
          
        finish_item(tr);
  endtask
  

endclass



class valid_wrrd_wrap extends uvm_sequence#(transaction);
  `uvm_object_utils(valid_wrrd_wrap)
  
  transaction tr;

  function new(string name = "valid_wrrd_wrap");
    super.new(name);
  endfunction

  
  virtual task body();
        tr = transaction::type_id::create("tr");
         $display("------------------------------");
        `uvm_info("SEQ", "Sending WRAP mode Transaction to DRV", UVM_NONE);
        start_item(tr);
        assert(tr.randomize);
          tr.op      = wrrdwrap;
          tr.awlen   = 7;
          tr.awburst = 2;
          tr.awsize  = 2;
          
        finish_item(tr);
  endtask
  

endclass



class err_wrrd_fix extends uvm_sequence#(transaction);
  `uvm_object_utils(err_wrrd_fix)
  
  transaction tr;

  function new(string name = "err_wrrd_fix");
    super.new(name);
  endfunction

  
  virtual task body();
        tr = transaction::type_id::create("tr");
        $display("------------------------------");
        `uvm_info("SEQ", "Sending Error Transaction to DRV", UVM_NONE);
        start_item(tr);
        assert(tr.randomize);
          tr.op      = wrrderrfix;
          tr.awlen   = 7;
          tr.awburst = 0;
          tr.awsize  = 2;   
        finish_item(tr);
  endtask
  

endclass

