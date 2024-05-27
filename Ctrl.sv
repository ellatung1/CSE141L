module Ctrl(
  input        [8:0] mach_code,
  output logic [3:0] Aluop
  output logic [0:2] Jptr
  output logic [1:0] Ra,
			         Rb,
			         Wd,
  output logic       WenR,
					 WenD,
					 Ldr,
					 Str
);

  always_comb begin
	Aluop = mach_code[3:0];		// ALU ** ADJUSTED TO BE 3 BITS
	Jptr  = mach_code[5:3];		// jump pointer
	Ra	  = mach_code[5:4];		// reg file addr A
	Rb    = mach_code[6:5];
	Jptr  = mach_code[6:4];
	Wd    = 1'b0;
	//Flag = mach_code[7];
	WenR  = 1'b0;		// reg file write enable
	WenD  = 1'b0;		// data mem write enable
	//Ldr   =	mach_code[8];		// load
    //Str	  = !mach_code[7];		// store
	case(Aluop)
		// ADD
		3'b0000: begin
			WenR = 1'b1;
		end
		// ADD I
		4'b0001: begin
			WenR = 1'b1;
		end
		// RS
		4'b0011: begin
			WenR = 1'b1;
		end
		// LS
		4'b0101: begin
			WenR = 1'b1;
		end
		// AND
		4'b0110: begin
			WenR = 1'b1;
		end
		// OR
		4'b0111: begin
			WenR = 1'b1;
		end
		// XOR
		4'b1000: begin
			WenR = 1'b1;
		end
		4'b1001: begin
		// LD
			WenR = 1'b1;
		end
		4'b1010: begin
		// STR
			WenD = 1'b1;
			Wd = Ra;
		end
		4'b1011: begin
		// J
		end
		
  	endcase
  end

endmodule