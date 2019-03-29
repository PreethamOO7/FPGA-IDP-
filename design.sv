 `timescale 1ns / 1ns 

 module Divide(  
   input      clk,  
       input                     reset,  
   input      start,  
   input [7:0]  A,  
   input [7:0]  B,  
   output [7:0]  Q,  
   output [7:0]  R,  
   output     ok ,   // =1 when ready to get the result   
       output err  
   );  
   reg       active;   // True if the divider is running  
   reg [4:0]    cycle;   // Number of cycles to go  
   reg [7:0]   result;   // Begin with A, end with Q  
   reg [7:0]   div;   // Divisor 
   reg [7:0]   work;    // Running R  
   // Calculate the current digit  
   wire [8:0]   sub = { work[6:0], result[7] } - div;  
       assign err = !B;  
   // Send the results to our master  
   assign Q = result;  
   assign R = work;  
   assign ok = ~active;
    
   // The state machine  
   always @(posedge clk,posedge reset) begin  
    
     if (reset) begin  
       active <= 0;  
       cycle <= 0;  
       result <= 0;  
       div <= 0;  
       work <= 0;  
     end  
     else if(start) begin  
       if (active) begin  
         // Run an iteration of the divider.  
         if (sub[8] == 0) begin  
           work <= sub[7:0];  
           result <= {result[6:0], 1'b1};  
         end  
         else begin  
           work <= {work[6:0], result[7]};  
           result <= {result[6:0], 1'b0};  
         end  
         if (cycle == 0) begin  
           active <= 0;  
         end  
         cycle <= cycle - 5'd1;  
       end  
       else begin  
         // Set up for an unsigned divider.  
         cycle <= 5'd7;  
         result <= A;  
         div <= B;  
         work <= 8'b0;  
         active <= 1;  
       end  
     end  
   end  
 endmodule  
 
 

 
 
 
 
 
