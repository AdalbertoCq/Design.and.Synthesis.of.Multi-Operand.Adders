`timescale 1ns/10ps

module stimulus;

//reg clk;
reg ci;
reg [6:0] m, n, o, p, q, r, s, t;

wire [8:0] u;

addertree adder1(u, m, n, o, p, q, r, s, t);
   
initial begin	
//	clk = 1'b0;
//	forever begin #5 clk = ~clk;
//	$display("At Time: %d  u=%d ,$time,u); 	end
end

initial begin
	$shm_open("shm.db",1); // Opens a waveform database
	$shm_probe("AS");    // Saves all signals to database
	#1000 $finish;		
	$shm_close();   // Closes the waveform database
end

// Stimulate the Input Signals
initial begin
	m = 0;
	n = 1;
	o = 2;
	p = 3;
	q = 4;
	r = 5;
	s = 6;
	t = 7;
	#100 $display("At Time: %d  Result=%d ",$time ,u);

	m = 1;
	n = 1;
	o = 1;
	p = 1;
	q = 1;
	r = 1;
	s = 1;
	t = 1;
	#100 $display("At Time: %d  Result=%d ",$time,u);
	
	m = 3;
	n = 1;
	o = 2;
	p = 3;
	q = 4;
	r = 5;
	s = 6;
	t = 7;
	#100 $display("At Time: %d  Result=%d ",$time,u);

end

endmodule // stimulus