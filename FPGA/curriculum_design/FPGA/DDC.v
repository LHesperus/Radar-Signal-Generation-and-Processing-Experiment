module DDC #(parameter width=12)(
input  clk,
input  rst,
input  [width-1:0]IF_Signal,
output reg [width-1:0]BaseBand_I,
output reg [width-1:0]BaseBand_Q
);
parameter
h0=-1137,
h1=-75,
h2=-49,
h3=-4,
h4=54,
h5=119,
h6=184,
h7=240,
h8=280,
h9=298,
h10=287,
h11=247,
h12=178,
h13=85,
h14=-23,
h15=-136,
h16=-241,
h17=-325,
h18=-372,
h19=-375,
h20=-323,
h21=-211,
h22=-42,
h23=181,
h24=445,
h25=738,
h26=1040,
h27=1333,
h28=1597,
h29=1814,
h30=1967,
h31=2047,
h32=2047,
h33=1967,
h34=1814,
h35=1597,
h36=1333,
h37=1040,
h38=738,
h39=445,
h40=181,
h41=-42,
h42=-211,
h43=-323,
h44=-375,
h45=-372,
h46=-325,
h47=-241,
h48=-136,
h49=-23,
h50=85,
h51=178,
h52=247,
h53=287,
h54=298,
h55=280,
h56=240,
h57=184,
h58=119,
h59=54,
h60=-4,
h61=-49,
h62=-75,
h63=-1137;




/*orthogonal transformation*/



/*LPF*/
reg [width-1:0]data_temp[1:64];

	
always@(posedge clk)
begin   
if(!rst)
	begin
    data_temp[1 ]<=0;
    data_temp[2 ]<=0;
    data_temp[3 ]<=0;
    data_temp[4 ]<=0;
    data_temp[5 ]<=0;
    data_temp[6 ]<=0;
    data_temp[7 ]<=0;
    data_temp[8 ]<=0;
    data_temp[9 ]<=0;
    data_temp[10]<=0;
    data_temp[11]<=0;
    data_temp[12]<=0;
    data_temp[13]<=0;
    data_temp[14]<=0;
    data_temp[15]<=0;
    data_temp[16]<=0;
    data_temp[17]<=0;
    data_temp[18]<=0;
    data_temp[19]<=0;
    data_temp[20]<=0;
    data_temp[21]<=0;
    data_temp[22]<=0;
    data_temp[23]<=0;
    data_temp[24]<=0;
    data_temp[25]<=0;
    data_temp[26]<=0;
    data_temp[27]<=0;
    data_temp[28]<=0;
    data_temp[29]<=0;
    data_temp[30]<=0;
    data_temp[31]<=0;
    data_temp[32]<=0;
    data_temp[33]<=0;
    data_temp[34]<=0;
    data_temp[35]<=0;
    data_temp[36]<=0;
    data_temp[37]<=0;
    data_temp[38]<=0;
    data_temp[39]<=0;
    data_temp[40]<=0;
    data_temp[41]<=0;
    data_temp[42]<=0;
    data_temp[43]<=0;
    data_temp[44]<=0;
    data_temp[45]<=0;
    data_temp[46]<=0;
    data_temp[47]<=0;
    data_temp[48]<=0;
    data_temp[49]<=0;
    data_temp[50]<=0;
    data_temp[51]<=0;
    data_temp[52]<=0;
    data_temp[53]<=0;
    data_temp[54]<=0;
    data_temp[55]<=0;
    data_temp[56]<=0;
    data_temp[57]<=0;
    data_temp[58]<=0;
    data_temp[59]<=0;
    data_temp[60]<=0;
    data_temp[61]<=0;
    data_temp[62]<=0;
    data_temp[63]<=0;
    data_temp[64]<=0;
	end
else 	
	data_temp[1 ]<=IF_Signal;
	data_temp[2 ]<=data_temp[1 ] ;
	data_temp[3 ]<=data_temp[2 ] ;
	data_temp[4 ]<=data_temp[3 ] ;
	data_temp[5 ]<=data_temp[4 ] ;
	data_temp[6 ]<=data_temp[5 ] ;
	data_temp[7 ]<=data_temp[6 ] ;
	data_temp[8 ]<=data_temp[7 ] ;
	data_temp[9 ]<=data_temp[8 ] ;
	data_temp[10]<=data_temp[9 ] ;
	data_temp[11]<=data_temp[10] ;
	data_temp[12]<=data_temp[11] ;
	data_temp[13]<=data_temp[12] ;
	data_temp[14]<=data_temp[13] ;
	data_temp[15]<=data_temp[14] ;
	data_temp[16]<=data_temp[15] ;
	data_temp[17]<=data_temp[16] ;
	data_temp[18]<=data_temp[17] ;
	data_temp[19]<=data_temp[18] ;
	data_temp[20]<=data_temp[19] ;
	data_temp[21]<=data_temp[20] ;
	data_temp[22]<=data_temp[21] ;
	data_temp[23]<=data_temp[22] ;
	data_temp[24]<=data_temp[23] ;
	data_temp[25]<=data_temp[24] ;
	data_temp[26]<=data_temp[25] ;
	data_temp[27]<=data_temp[26] ;
	data_temp[28]<=data_temp[27] ;
	data_temp[29]<=data_temp[28] ;
	data_temp[30]<=data_temp[29] ;
	data_temp[31]<=data_temp[30] ;
	data_temp[32]<=data_temp[31] ;
	data_temp[33]<=data_temp[32] ;
	data_temp[34]<=data_temp[33] ;
	data_temp[35]<=data_temp[34] ;
	data_temp[36]<=data_temp[35] ;
	data_temp[37]<=data_temp[36] ;
	data_temp[38]<=data_temp[37] ;
	data_temp[39]<=data_temp[38] ;
	data_temp[40]<=data_temp[39] ;
	data_temp[41]<=data_temp[40] ;
	data_temp[42]<=data_temp[41] ;
	data_temp[43]<=data_temp[42] ;
	data_temp[44]<=data_temp[43] ;
	data_temp[45]<=data_temp[44] ;
	data_temp[46]<=data_temp[45] ;
	data_temp[47]<=data_temp[46] ;
	data_temp[48]<=data_temp[47] ;
	data_temp[49]<=data_temp[48] ;
	data_temp[50]<=data_temp[49] ;
	data_temp[51]<=data_temp[50] ;
	data_temp[52]<=data_temp[51] ;
	data_temp[53]<=data_temp[52] ;
	data_temp[54]<=data_temp[53] ;
	data_temp[55]<=data_temp[54] ;
	data_temp[56]<=data_temp[55] ;
	data_temp[57]<=data_temp[56] ;
	data_temp[58]<=data_temp[57] ;
	data_temp[59]<=data_temp[58] ;
	data_temp[60]<=data_temp[59] ;
	data_temp[61]<=data_temp[60] ;
	data_temp[62]<=data_temp[61] ;
	data_temp[63]<=data_temp[62] ;
	data_temp[64]<=data_temp[63] ;

end

reg[4*width:0] data_outI;
always@(posedge clk)
begin
	data_outI<=
	 $signed($signed(data_temp[1] ) *   h63)-	$signed($signed(data_temp[3] ) *   h61)+
	 $signed($signed(data_temp[5] ) *   h59)-	$signed($signed(data_temp[7] ) *   h57)+
	 $signed($signed(data_temp[9] ) *   h55)-   $signed($signed(data_temp[11]) *   h53)+
	 $signed($signed(data_temp[13]) *   h51)-	$signed($signed(data_temp[15]) *   h49)+
	 $signed($signed(data_temp[17]) *   h47)-	$signed($signed(data_temp[19]) *   h45)+
	 $signed($signed(data_temp[21]) *   h43)-	$signed($signed(data_temp[23]) *   h41)+
	 $signed($signed(data_temp[25]) *   h39)-	$signed($signed(data_temp[27]) *   h37)+
	 $signed($signed(data_temp[29]) *   h35)-   $signed($signed(data_temp[31]) *   h33)+
     $signed($signed(data_temp[33]) *   h31)-   $signed($signed(data_temp[35]) *   h29)+
     $signed($signed(data_temp[37]) *   h27)-   $signed($signed(data_temp[39]) *   h25)+
     $signed($signed(data_temp[41]) *   h23)-   $signed($signed(data_temp[43]) *   h21)+
     $signed($signed(data_temp[45]) *   h19)-   $signed($signed(data_temp[47]) *   h17)+
     $signed($signed(data_temp[49]) *   h15)-   $signed($signed(data_temp[51]) *   h13)+
     $signed($signed(data_temp[53]) *   h11)-   $signed($signed(data_temp[55]) *   h9 )+  
     $signed($signed(data_temp[57]) *   h7 )-   $signed($signed(data_temp[59]) *   h5 )+  
     $signed($signed(data_temp[61]) *   h3 )-   $signed($signed(data_temp[63]) *   h1 );  
 end      
 

reg[4*width:0] data_outQ;
always@(posedge clk)
begin
	data_outQ<=
	-$signed(data_temp[2] ) *   h62+	 $signed(data_temp[4] ) *   h60
	-$signed(data_temp[6] ) *   h58+	 $signed(data_temp[8] ) *   h56
	-$signed(data_temp[10]) *   h54+	 $signed(data_temp[12]) *   h52
	-$signed(data_temp[14]) *   h50+	 $signed(data_temp[16]) *   h48
	-$signed(data_temp[18]) *   h46+	 $signed(data_temp[20]) *   h44
	-$signed(data_temp[22]) *   h42+	 $signed(data_temp[24]) *   h40
	-$signed(data_temp[26]) *   h38+	 $signed(data_temp[28]) *   h36
	-$signed(data_temp[30]) *   h34+     $signed(data_temp[32]) *   h32
    -$signed(data_temp[34]) *   h30+     $signed(data_temp[36]) *   h28
    -$signed(data_temp[38]) *   h26+     $signed(data_temp[40]) *   h24
    -$signed(data_temp[42]) *   h22+     $signed(data_temp[44]) *   h20
    -$signed(data_temp[46]) *   h18+     $signed(data_temp[48]) *   h16
    -$signed(data_temp[50]) *   h14+     $signed(data_temp[52]) *   h12
    -$signed(data_temp[54]) *   h10+     $signed(data_temp[56]) *   h8   
    -$signed(data_temp[58]) *   h6 +     $signed(data_temp[60]) *   h4   
    -$signed(data_temp[62]) *   h2 +     $signed(data_temp[64]) *   h0 ;			 
 end     
 
 
 
 /*extract 16*/
 reg [3:0]count_16;
 always@(posedge clk)
 begin
	if(!rst)
		count_16<=0;
	else
		count_16<= count_16+1'b1;
 end
 
 always@(posedge clk)
 begin
	if(count_16==4'd0)
		BaseBand_I<=data_outI[2*width+1:width+2];
 end
 
 always@(posedge clk)
 begin
	if(count_16==4'd0)
		BaseBand_Q<=-data_outQ[2*width+1:width+2];
 end

endmodule