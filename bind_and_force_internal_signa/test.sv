module test_m;
wire sig_a;

assign sig_a = 0;
endmodule

module top;
test_m u_test_m();
endmodule

interface intf_t;
task force_sig();
  force u_top.u_test_m.sig_a = 1;
endtask
endinterface

module tb;
top u_top();

bind top: u_top intf_t probe_if();

initial begin
  #10;
  u_top.probe_if.force_sig();
  #10;
  $finish();
end

initial begin
  $shm_open("waves.shm"); $shm_probe("AS");
end

endmodule
