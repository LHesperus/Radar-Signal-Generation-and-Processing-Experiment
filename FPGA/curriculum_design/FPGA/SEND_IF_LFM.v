module SEND_IF_LFM #(parameter width=12)(
input clk,
input rst,
output [width-1:0]out
);

//************************//
parameter 
PRI = 28800;


reg [14:0]count; 
always@(posedge clk)
begin
	if(!rst||count>=PRI)
		count<=0;
   else
		count <= count +1'b1;
end



//***************************//
reg	[11:0]  address;
always@(posedge clk)
begin
	if(!rst||count>=15'd4096)
		address<=0;
	else
		address<=count[11:0];		
end

wire  [width-1 :0]q;
IF_LFM LFM(
.address(address),
.clock(clk),
.q(q)
);

assign out=(count>=15'd4096)? 0: q;


endmodule