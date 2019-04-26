`timescale 1ns / 1ns 

 module Divide(  
   input      clk,   
   input      start,  
   input [4:0]  A,  
   input [4:0]  B,  
   output [4:0]  Q,  
   output [4:0]  R,  
   output     ok   // =1 when ready to get the result   
  
   );  
   reg       active; 
   reg       clk_in; 
   wire      reset;// True if the divider is running  
   reg [4:0]    cycle;   // Number of cycles to go  
   reg [4:0]   result;   // Begin with A, end with Q  
   reg [4:0]   div;   // Divisor 
   reg [4:0]   work;    // Running R  
   reg [26:0]   delay;
   // Calculate the current digit  
   wire [5:0]   sub = { work[3:0], result[4] } - div;  
 
   // Send the results to our master  
   assign Q = result;  
   assign R = work;  
   assign ok = ~active;
   assign reset = !start;
   
   initial begin
      clk_in = 0;
     delay =0;
     
   end
   
   always@(posedge clk)
	begin
		delay = delay+1;
      if(delay == 27'd10000)
		begin
			clk_in = ~clk_in;
			delay = 0;
		end
	end
  
   
     // The state machine
     always @(posedge clk_in,posedge reset) begin  

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
           if (sub[5] == 0) begin  
             work <= sub[4:0];  
             result <= {result[3:0], 1'b1};  
           end  
           else begin  
             work <= {work[3:0], result[4]};  
             result <= {result[3:0], 1'b0};  
           end  
           if (cycle == 0) begin  
             active <= 0;  
           end  
           cycle <= cycle - 5'd1;  
         end  
         else begin  
           // Set up for an unsigned divider.  
           cycle <= 5'd4;  
           result <= A;  
           div <= B;  
           work <= 5'b0;  
           active <= 1;  
         end  
       end  
     end  
   endmodule  

