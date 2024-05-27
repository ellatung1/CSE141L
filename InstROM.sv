module InstROM(
  input[5:0] PC,
  output logic[8:0] mach_code);

  logic[8:0] Core[64];

  initial 
	$readmemb("mach_code.txt",Core); // put final assembled machine keep, keep seperate for 3 prog

  always_comb mach_code = Core[PC];

endmodule