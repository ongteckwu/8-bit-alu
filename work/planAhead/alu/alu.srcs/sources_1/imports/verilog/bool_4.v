/*
   This file was generated automatically by the Mojo IDE version B1.3.4.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module bool_4 (
    input [3:0] alufn30,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out
  );
  
  
  
  always @* begin
    
    case (alufn30[0+3-:4])
      4'h8: begin
        out[0+7-:8] = a[0+7-:8] & b[0+7-:8];
      end
      4'he: begin
        out[0+7-:8] = a[0+7-:8] | b[0+7-:8];
      end
      4'h6: begin
        out[0+7-:8] = a[0+7-:8] ^ b[0+7-:8];
      end
      4'ha: begin
        out[0+7-:8] = a[0+7-:8];
      end
      default: begin
        out[0+7-:8] = a[0+7-:8];
      end
    endcase
  end
endmodule