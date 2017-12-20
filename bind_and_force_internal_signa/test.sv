module m2;
wire [31:0] sig_a;

assign sig_a = 0;
endmodule

module m1;
m2 u_m2();
endmodule

module top;
m1 u_m1();
endmodule

interface intf_t;
task force_sig();
  force u_top.u_m1.u_m2.sig_a = 1;
endtask

task force_sig1();
  force u_m1.u_m2.sig_a = 4;
endtask

// because of the following bind, the task force_sig2 will have compilation error
// bind top: u_top intf_t probe_if();
// task force_sig2();
//   force u_m2.sig_a = 5;
// endtask
endinterface

interface intf_t1;
task force_sig();
  force u_top.u_m1.u_m2.sig_a = 2;
endtask

task force_sig1();
  force u_m1.u_m2.sig_a = 3;
endtask

task force_sig2();
  force u_m2.sig_a = 6;
endtask
endinterface

module tb;
top u_top();

bind top: u_top intf_t probe_if();
bind m1: u_top.u_m1 intf_t1 probe_if1();

initial begin
  #10;
  u_top.probe_if.force_sig();
  #10;
  u_top.probe_if.force_sig1();
  #10;
  u_top.u_m1.probe_if1.force_sig();
  #10;
  u_top.u_m1.probe_if1.force_sig1();
  #10;
  u_top.u_m1.probe_if1.force_sig2();
  #10;
  $finish();
end

initial begin
  $shm_open("waves.shm"); $shm_probe("AS");
end

endmodule
