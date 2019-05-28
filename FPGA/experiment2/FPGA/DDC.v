module DDC #(parameter width=12)(
input  clk,
input  rst,
input  [width-1:0]IF_Signal,
output reg [width-1:0]BaseBand_I,
output reg [width-1:0]BaseBand_Q

);
parameter
h0=-11,
h1=20,
h2=20,
h3=12,
h4=-7,
h5=-25,
h6=-27,
h7=-6,
h8=27,
h9=45,
h10=28,
h11=-19,
h12=-63,
h13=-63,
h14=-9,
h15=67,
h16=103,
h17=59,
h18=-48,
h19=-142,
h20=-138,
h21=-12,
h22=161,
h23=244,
h24=136,
h25=-136,
h26=-395,
h27=-404,
h28=-14,
h29=718,
h30=1522,
h31=2047,
h32=2047,
h33=1522,
h34=718,
h35=-14,
h36=-404,
h37=-395,
h38=-136,
h39=136,
h40=244,
h41=161,
h42=-12,
h43=-138,
h44=-142,
h45=-48,
h46=59,
h47=103,
h48=67,
h49=-9,
h50=-63,
h51=-63,
h52=-19,
h53=28,
h54=45,
h55=27,
h56=-6,
h57=-27,
h58=-25,
h59=-7,
h60=12,
h61=20,
h62=20,
h63=-11;

reg [width-1:0]data_in_temp[1:64];
reg [1:0]count=0;

always@(posedge clk)
begin
	if(!rst)
		count<=0;
	else
		count<=count+1'b1;
end

always@(posedge clk)
begin

end

always@(posedge clk)
begin   
if(!rst)
	begin
    data_in_temp[1 ]<=0;
    data_in_temp[2 ]<=0;
    data_in_temp[3 ]<=0;
    data_in_temp[4 ]<=0;
    data_in_temp[5 ]<=0;
    data_in_temp[6 ]<=0;
    data_in_temp[7 ]<=0;
    data_in_temp[8 ]<=0;
    data_in_temp[9 ]<=0;
    data_in_temp[10]<=0;
    data_in_temp[11]<=0;
    data_in_temp[12]<=0;
    data_in_temp[13]<=0;
    data_in_temp[14]<=0;
    data_in_temp[15]<=0;
    data_in_temp[16]<=0;
    data_in_temp[17]<=0;
    data_in_temp[18]<=0;
    data_in_temp[19]<=0;
    data_in_temp[20]<=0;
    data_in_temp[21]<=0;
    data_in_temp[22]<=0;
    data_in_temp[23]<=0;
    data_in_temp[24]<=0;
    data_in_temp[25]<=0;
    data_in_temp[26]<=0;
    data_in_temp[27]<=0;
    data_in_temp[28]<=0;
    data_in_temp[29]<=0;
    data_in_temp[30]<=0;
    data_in_temp[31]<=0;
    data_in_temp[32]<=0;
    data_in_temp[33]<=0;
    data_in_temp[34]<=0;
    data_in_temp[35]<=0;
    data_in_temp[36]<=0;
    data_in_temp[37]<=0;
    data_in_temp[38]<=0;
    data_in_temp[39]<=0;
    data_in_temp[40]<=0;
    data_in_temp[41]<=0;
    data_in_temp[42]<=0;
    data_in_temp[43]<=0;
    data_in_temp[44]<=0;
    data_in_temp[45]<=0;
    data_in_temp[46]<=0;
    data_in_temp[47]<=0;
    data_in_temp[48]<=0;
    data_in_temp[49]<=0;
    data_in_temp[50]<=0;
    data_in_temp[51]<=0;
    data_in_temp[52]<=0;
    data_in_temp[53]<=0;
    data_in_temp[54]<=0;
    data_in_temp[55]<=0;
    data_in_temp[56]<=0;
    data_in_temp[57]<=0;
    data_in_temp[58]<=0;
    data_in_temp[59]<=0;
    data_in_temp[60]<=0;
    data_in_temp[61]<=0;
    data_in_temp[62]<=0;
    data_in_temp[63]<=0;
    data_in_temp[64]<=0;
	end
else 	
	data_in_temp[1 ]<=IF_Signal;
	data_in_temp[2 ]<=data_in_temp[1 ] ;
	data_in_temp[3 ]<=data_in_temp[2 ] ;
	data_in_temp[4 ]<=data_in_temp[3 ] ;
	data_in_temp[5 ]<=data_in_temp[4 ] ;
	data_in_temp[6 ]<=data_in_temp[5 ] ;
	data_in_temp[7 ]<=data_in_temp[6 ] ;
	data_in_temp[8 ]<=data_in_temp[7 ] ;
	data_in_temp[9 ]<=data_in_temp[8 ] ;
	data_in_temp[10]<=data_in_temp[9 ] ;
	data_in_temp[11]<=data_in_temp[10] ;
	data_in_temp[12]<=data_in_temp[11] ;
	data_in_temp[13]<=data_in_temp[12] ;
	data_in_temp[14]<=data_in_temp[13] ;
	data_in_temp[15]<=data_in_temp[14] ;
	data_in_temp[16]<=data_in_temp[15] ;
	data_in_temp[17]<=data_in_temp[16] ;
	data_in_temp[18]<=data_in_temp[17] ;
	data_in_temp[19]<=data_in_temp[18] ;
	data_in_temp[20]<=data_in_temp[19] ;
	data_in_temp[21]<=data_in_temp[20] ;
	data_in_temp[22]<=data_in_temp[21] ;
	data_in_temp[23]<=data_in_temp[22] ;
	data_in_temp[24]<=data_in_temp[23] ;
	data_in_temp[25]<=data_in_temp[24] ;
	data_in_temp[26]<=data_in_temp[25] ;
	data_in_temp[27]<=data_in_temp[26] ;
	data_in_temp[28]<=data_in_temp[27] ;
	data_in_temp[29]<=data_in_temp[28] ;
	data_in_temp[30]<=data_in_temp[29] ;
	data_in_temp[31]<=data_in_temp[30] ;
	data_in_temp[32]<=data_in_temp[31] ;
	data_in_temp[33]<=data_in_temp[32] ;
	data_in_temp[34]<=data_in_temp[33] ;
	data_in_temp[35]<=data_in_temp[34] ;
	data_in_temp[36]<=data_in_temp[35] ;
	data_in_temp[37]<=data_in_temp[36] ;
	data_in_temp[38]<=data_in_temp[37] ;
	data_in_temp[39]<=data_in_temp[38] ;
	data_in_temp[40]<=data_in_temp[39] ;
	data_in_temp[41]<=data_in_temp[40] ;
	data_in_temp[42]<=data_in_temp[41] ;
	data_in_temp[43]<=data_in_temp[42] ;
	data_in_temp[44]<=data_in_temp[43] ;
	data_in_temp[45]<=data_in_temp[44] ;
	data_in_temp[46]<=data_in_temp[45] ;
	data_in_temp[47]<=data_in_temp[46] ;
	data_in_temp[48]<=data_in_temp[47] ;
	data_in_temp[49]<=data_in_temp[48] ;
	data_in_temp[50]<=data_in_temp[49] ;
	data_in_temp[51]<=data_in_temp[50] ;
	data_in_temp[52]<=data_in_temp[51] ;
	data_in_temp[53]<=data_in_temp[52] ;
	data_in_temp[54]<=data_in_temp[53] ;
	data_in_temp[55]<=data_in_temp[54] ;
	data_in_temp[56]<=data_in_temp[55] ;
	data_in_temp[57]<=data_in_temp[56] ;
	data_in_temp[58]<=data_in_temp[57] ;
	data_in_temp[59]<=data_in_temp[58] ;
	data_in_temp[60]<=data_in_temp[59] ;
	data_in_temp[61]<=data_in_temp[60] ;
	data_in_temp[62]<=data_in_temp[61] ;
	data_in_temp[63]<=data_in_temp[62] ;
	data_in_temp[64]<=data_in_temp[63] ;

end

reg[2*width+6:0] data_out1;
always@(posedge clk)
begin
	data_out1<=
	$signed($signed(data_in_temp[1] ) *   h63) -
	$signed($signed(data_in_temp[2] ) *   h62) -
	$signed($signed(data_in_temp[3] ) *   h61) +
	$signed($signed(data_in_temp[4] ) *   h60) +
	$signed($signed(data_in_temp[5] ) *   h59) -
	$signed($signed(data_in_temp[6] ) *   h58) -
	$signed($signed(data_in_temp[7] ) *   h57) +
	$signed($signed(data_in_temp[8] ) *   h56) +
	$signed($signed(data_in_temp[9] ) *   h55) -
	$signed($signed(data_in_temp[10]) *   h54) -
	$signed($signed(data_in_temp[11]) *   h53 ) +
	$signed($signed(data_in_temp[12]) *   h52 ) +
	$signed($signed(data_in_temp[13]) *   h51 ) -
	$signed($signed(data_in_temp[14]) *   h50 ) -
	$signed($signed(data_in_temp[15]) *   h49 ) +
	$signed($signed(data_in_temp[16]) *   h48 ) +
	$signed($signed(data_in_temp[17]) *   h47 ) -
	$signed($signed(data_in_temp[18]) *   h46 ) -
	$signed($signed(data_in_temp[19]) *   h45 ) +
	$signed($signed(data_in_temp[20]) *   h44 ) +
	$signed($signed(data_in_temp[21]) *   h43 ) -
	$signed($signed(data_in_temp[22]) *   h42 ) -
	$signed($signed(data_in_temp[23]) *   h41 ) +
	$signed($signed(data_in_temp[24]) *   h40 ) +
	$signed($signed(data_in_temp[25]) *   h39 ) -
	$signed($signed(data_in_temp[26]) *   h38 ) -
	$signed($signed(data_in_temp[27]) *   h37 ) +
	$signed($signed(data_in_temp[28]) *   h36 ) +
	$signed($signed(data_in_temp[29]) *   h35 ) -
	$signed($signed(data_in_temp[30]) *   h34 ) -
   $signed($signed(data_in_temp[31]) *   h33 ) +
   $signed($signed(data_in_temp[32]) *   h32 ) +
   $signed($signed(data_in_temp[33]) *   h31 ) -
   $signed($signed(data_in_temp[34]) *   h30 ) -
   $signed($signed(data_in_temp[35]) *   h29 ) +
   $signed($signed(data_in_temp[36]) *   h28 ) +
   $signed($signed(data_in_temp[37]) *   h27 ) -
   $signed($signed(data_in_temp[38]) *   h26 ) -
   $signed($signed(data_in_temp[39]) *   h25 ) +
   $signed($signed(data_in_temp[40]) *   h24 ) +
   $signed($signed(data_in_temp[41]) *   h23 ) -
   $signed($signed(data_in_temp[42]) *   h22 ) -
   $signed($signed(data_in_temp[43]) *   h21 ) +
   $signed($signed(data_in_temp[44]) *   h20 ) +
   $signed($signed(data_in_temp[45]) *   h19 ) -
   $signed($signed(data_in_temp[46]) *   h18 ) -
   $signed($signed(data_in_temp[47]) *   h17 ) +
   $signed($signed(data_in_temp[48]) *   h16 ) +
   $signed($signed(data_in_temp[49]) *   h15 ) -
   $signed($signed(data_in_temp[50]) *   h14 ) -
   $signed($signed(data_in_temp[51]) *   h13 ) +
   $signed($signed(data_in_temp[52]) *   h12 ) +
   $signed($signed(data_in_temp[53]) *   h11 ) -
   $signed($signed(data_in_temp[54]) *   h10 ) -
   $signed($signed(data_in_temp[55]) *   h9  ) +  
   $signed($signed(data_in_temp[56]) *   h8  ) +  
   $signed($signed(data_in_temp[57]) *   h7  ) -  
   $signed($signed(data_in_temp[58]) *   h6  ) -  
   $signed($signed(data_in_temp[59]) *   h5  ) +  
   $signed($signed(data_in_temp[60]) *   h4  ) +  
   $signed($signed(data_in_temp[61]) *   h3  ) -  
   $signed($signed(data_in_temp[62]) *   h2  ) -  
   $signed($signed(data_in_temp[63]) *   h1  ) +  
   $signed($signed(data_in_temp[64]) *   h0  )  ;
				 
				 
 end      
 
 reg [2*width+6:0] data_outI;
 reg [2*width+6:0] data_outQ;
 always@(posedge clk)
begin
	data_outI<=
	$signed($signed(data_in_temp[1] ) *   h63) -
	//$signed($signed(data_in_temp[2] ) *   h62) -
	$signed($signed(data_in_temp[3] ) *   h61) +
	//$signed($signed(data_in_temp[4] ) *   h60) +
	$signed($signed(data_in_temp[5] ) *   h59) -
	//$signed($signed(data_in_temp[6] ) *   h58) -
	$signed($signed(data_in_temp[7] ) *   h57) +
	//$signed($signed(data_in_temp[8] ) *   h56) +
	$signed($signed(data_in_temp[9] ) *   h55) -
	//$signed($signed(data_in_temp[10]) *   h54) -
	$signed($signed(data_in_temp[11]) *   h53 ) +
	//$signed($signed(data_in_temp[12]) *   h52 ) +
	$signed($signed(data_in_temp[13]) *   h51 ) -
	//$signed($signed(data_in_temp[14]) *   h50 ) -
	$signed($signed(data_in_temp[15]) *   h49 ) +
	//$signed($signed(data_in_temp[16]) *   h48 ) +
	$signed($signed(data_in_temp[17]) *   h47 ) -
	//$signed($signed(data_in_temp[18]) *   h46 ) -
	$signed($signed(data_in_temp[19]) *   h45 ) +
	//$signed($signed(data_in_temp[20]) *   h44 ) +
	$signed($signed(data_in_temp[21]) *   h43 ) -
	//$signed($signed(data_in_temp[22]) *   h42 ) -
	$signed($signed(data_in_temp[23]) *   h41 ) +
	//$signed($signed(data_in_temp[24]) *   h40 ) +
	$signed($signed(data_in_temp[25]) *   h39 ) -
	//$signed($signed(data_in_temp[26]) *   h38 ) -
	$signed($signed(data_in_temp[27]) *   h37 ) +
	//$signed($signed(data_in_temp[28]) *   h36 ) +
	$signed($signed(data_in_temp[29]) *   h35 ) -
	//$signed($signed(data_in_temp[30]) *   h34 ) -
    $signed($signed(data_in_temp[31]) *   h33 ) +
   // $signed($signed(data_in_temp[32]) *   h32 ) +
    $signed($signed(data_in_temp[33]) *   h31 ) -
    //$signed($signed(data_in_temp[34]) *   h30 ) -
    $signed($signed(data_in_temp[35]) *   h29 ) +
   // $signed($signed(data_in_temp[36]) *   h28 ) +
    $signed($signed(data_in_temp[37]) *   h27 ) -
   // $signed($signed(data_in_temp[38]) *   h26 ) -
    $signed($signed(data_in_temp[39]) *   h25 ) +
   // $signed($signed(data_in_temp[40]) *   h24 ) +
    $signed($signed(data_in_temp[41]) *   h23 ) -
   // $signed($signed(data_in_temp[42]) *   h22 ) -
    $signed($signed(data_in_temp[43]) *   h21 ) +
   // $signed($signed(data_in_temp[44]) *   h20 ) +
    $signed($signed(data_in_temp[45]) *   h19 ) -
   // $signed($signed(data_in_temp[46]) *   h18 ) -
    $signed($signed(data_in_temp[47]) *   h17 ) +
   // $signed($signed(data_in_temp[48]) *   h16 ) +
    $signed($signed(data_in_temp[49]) *   h15 ) -
   // $signed($signed(data_in_temp[50]) *   h14 ) -
    $signed($signed(data_in_temp[51]) *   h13 ) +
   // $signed($signed(data_in_temp[52]) *   h12 ) +
    $signed($signed(data_in_temp[53]) *   h11 ) -
   // $signed($signed(data_in_temp[54]) *   h10 ) -
    $signed($signed(data_in_temp[55]) *   h9  ) +  
   // $signed($signed(data_in_temp[56]) *   h8  ) +  
    $signed($signed(data_in_temp[57]) *   h7  ) -  
  //  $signed($signed(data_in_temp[58]) *   h6  ) -  
    $signed($signed(data_in_temp[59]) *   h5  ) +  
  //  $signed($signed(data_in_temp[60]) *   h4  ) +  
    $signed($signed(data_in_temp[61]) *   h3  ) -  
  //  $signed($signed(data_in_temp[62]) *   h2  ) -  
    $signed($signed(data_in_temp[63]) *   h1  ) ;  
  //  $signed($signed(data_in_temp[64]) *   h0  )  ;
				 
	data_outQ<=
	//$signed($signed(data_in_temp[1] ) *   h63) -
	$signed($signed(data_in_temp[2] ) *   h62) -
	//$signed($signed(data_in_temp[3] ) *   h61) +
	$signed($signed(data_in_temp[4] ) *   h60) +
	//$signed($signed(data_in_temp[5] ) *   h59) -
	$signed($signed(data_in_temp[6] ) *   h58) -
	//$signed($signed(data_in_temp[7] ) *   h57) +
	$signed($signed(data_in_temp[8] ) *   h56) +
	//$signed($signed(data_in_temp[9] ) *   h55) -
	$signed($signed(data_in_temp[10]) *   h54) -
	//$signed($signed(data_in_temp[11]) *   h53 ) +
	$signed($signed(data_in_temp[12]) *   h52 ) +
	//$signed($signed(data_in_temp[13]) *   h51 ) -
	$signed($signed(data_in_temp[14]) *   h50 ) -
	//$signed($signed(data_in_temp[15]) *   h49 ) +
	$signed($signed(data_in_temp[16]) *   h48 ) +
	//$signed($signed(data_in_temp[17]) *   h47 ) -
	$signed($signed(data_in_temp[18]) *   h46 ) -
	//$signed($signed(data_in_temp[19]) *   h45 ) +
	$signed($signed(data_in_temp[20]) *   h44 ) +
	//$signed($signed(data_in_temp[21]) *   h43 ) -
	$signed($signed(data_in_temp[22]) *   h42 ) -
	//$signed($signed(data_in_temp[23]) *   h41 ) +
	$signed($signed(data_in_temp[24]) *   h40 ) +
	//$signed($signed(data_in_temp[25]) *   h39 ) -
	$signed($signed(data_in_temp[26]) *   h38 ) -
	//$signed($signed(data_in_temp[27]) *   h37 ) +
	$signed($signed(data_in_temp[28]) *   h36 ) +
	//$signed($signed(data_in_temp[29]) *   h35 ) -
	$signed($signed(data_in_temp[30]) *   h34 ) -
    //$signed($signed(data_in_temp[31]) *   h33 ) +
    $signed($signed(data_in_temp[32]) *   h32 ) +
    //$signed($signed(data_in_temp[33]) *   h31 ) -
    $signed($signed(data_in_temp[34]) *   h30 ) -
   // $signed($signed(data_in_temp[35]) *   h29 ) +
    $signed($signed(data_in_temp[36]) *   h28 ) +
   // $signed($signed(data_in_temp[37]) *   h27 ) -
    $signed($signed(data_in_temp[38]) *   h26 ) -
   // $signed($signed(data_in_temp[39]) *   h25 ) +
    $signed($signed(data_in_temp[40]) *   h24 ) +
   // $signed($signed(data_in_temp[41]) *   h23 ) -
    $signed($signed(data_in_temp[42]) *   h22 ) -
   // $signed($signed(data_in_temp[43]) *   h21 ) +
    $signed($signed(data_in_temp[44]) *   h20 ) +
   // $signed($signed(data_in_temp[45]) *   h19 ) -
    $signed($signed(data_in_temp[46]) *   h18 ) -
   // $signed($signed(data_in_temp[47]) *   h17 ) +
    $signed($signed(data_in_temp[48]) *   h16 ) +
  //  $signed($signed(data_in_temp[49]) *   h15 ) -
    $signed($signed(data_in_temp[50]) *   h14 ) -
   // $signed($signed(data_in_temp[51]) *   h13 ) +
    $signed($signed(data_in_temp[52]) *   h12 ) +
   // $signed($signed(data_in_temp[53]) *   h11 ) -
    $signed($signed(data_in_temp[54]) *   h10 ) -
   // $signed($signed(data_in_temp[55]) *   h9  ) +  
    $signed($signed(data_in_temp[56]) *   h8  ) +  
   // $signed($signed(data_in_temp[57]) *   h7  ) -  
    $signed($signed(data_in_temp[58]) *   h6  ) -  
  //  $signed($signed(data_in_temp[59]) *   h5  ) +  
    $signed($signed(data_in_temp[60]) *   h4  ) +  
   // $signed($signed(data_in_temp[61]) *   h3  ) -  
    $signed($signed(data_in_temp[62]) *   h2  ) -  
  //  $signed($signed(data_in_temp[63]) *   h1  ) +  
    $signed($signed(data_in_temp[64]) *   h0  )  ;
	
 end     
 
 

 
 
  always@(posedge clk)
 begin
	if(count==2'd0)
		//BaseBand_I<=data_outI[2*width+6: 2*width+6-width-1];
		BaseBand_I<=data_outI[2*width+1: 2*width-width+1];
 end
 
  always@(posedge clk)
 begin
	if(count==2'd0)
		//BaseBand_Q<=data_outQ[2*width+6: 2*width+6-width-1];
		BaseBand_Q<=data_outQ[2*width+1: 2*width-width+1];
 end




endmodule