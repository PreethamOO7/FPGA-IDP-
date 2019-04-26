 `timescale 1ns / 1ns  

 module tb_divider;  
      // Inputs  
      reg clock;  
      reg reset;  
      reg start;  
  reg [4:0] A;  
  reg [4:0] B;  
      // Outputs  
  wire [4:0] Q;  
  wire [4:0] R;  
      wire ok;  
      wire err;  
      // Instantiate the Unit Under Test (UUT)  
      Divide uut (  
           .clk(clock),   
           .start(start),  
           .reset(reset),  
           .A(A),   
           .B(B),   
        .Q(Q),   
           .R(R),   
           .ok(ok),  
           .err(err)  
      );  
      initial begin   
            clock = 0;  
            forever #50 clock = ~clock;  
      end  
      initial begin  
        $dumpfile("dump.vcd");
        $dumpvars(1,tb_divider);
           // Initialize Inputs  
           start = 0;  
           A = 5'd22;  
           B = 5'd10;  
           reset=1;  
           // Wait 100 ns for global reset to finish  
           #1000;  
           reset=0;  
     start = 1;   
           #900;  
           $finish;  
      end  
 endmodule  
