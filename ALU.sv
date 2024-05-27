module ALU(
  input [3:0] Aluop,
  input [7:0] DatA,
              DatB,
  output logic[7:0] Rslt,
  output logic      Zero,
                    Par,
			        SCo);

always_comb begin
  Rslt = 8'b0;
  SCo  = 8'b0;
  case(Aluop)
    2'b0000: {SCo,Rslt} = DatA + DatB; // add
    2'b0001: {SCo,Rslt} = DatA + 1'b1; // add immediate *FIX
    2'b0011: {SCo,Rslt} = DatA>>1'b1;; // right shift
    2'b0101: {SCo,Rslt} = DatA<<1'b1;    //left shift
    2'b100: {SCo,Rslt} = DatA<<1'b1;
	2'b0110: Rslt       = DatA & DatB;   // bitwise AND
  2'b0111: Rslt       = DatA | DatB;   // bitwise OR
	2'b1000: Rslt       = DatA ^ DatB;   // bitwise XOR
  endcase
end

  assign Zero = !Rslt;
  assign Par  = ^Rslt;

endmodule