module PC #(parameter width=12)(
input clk,
input rst,
input [width-1:0]signal_I,
input [width-1:0]signal_Q,
output  [width-1:0]pc_I,
output  [width-1:0]pc_Q,
output reg [6*width:0]pc_abs2
);
parameter
h_I0=2047,
h_I1=-2045,
h_I2=2007,
h_I3=-1851,
h_I4=1447,
h_I5=-690,
h_I6=-400,
h_I7=1516,
h_I8=-2047,
h_I9=1374,
h_I10=399,
h_I11=-1928,
h_I12=1447,
h_I13=875,
h_I14=-2008,
h_I15=-101,
h_I16=2047,
h_I17=100,
h_I18=-2008,
h_I19=-876,
h_I20=1447,
h_I21=1927,
h_I22=399,
h_I23=-1375,
h_I24=-2047,
h_I25=-1517,
h_I26=-400,
h_I27=689,
h_I28=1447,
h_I29=1850,
h_I30=2007,
h_I31=2044,
h_I32=2047,
h_I33=2044,
h_I34=2007,
h_I35=1850,
h_I36=1447,
h_I37=689,
h_I38=-400,
h_I39=-1517,
h_I40=-2047,
h_I41=-1375,
h_I42=399,
h_I43=1927,
h_I44=1447,
h_I45=-876,
h_I46=-2008,
h_I47=100,
h_I48=2047,
h_I49=-101,
h_I50=-2008,
h_I51=875,
h_I52=1447,
h_I53=-1928,
h_I54=399,
h_I55=1374,
h_I56=-2047,
h_I57=1516,
h_I58=-400,
h_I59=-690,
h_I60=1447,
h_I61=-1851,
h_I62=2007,
h_I63=-2045;

parameter
h_Q0=-1,
h_Q1=-101,
h_Q2=399,
h_Q3=-877,
h_Q4=1449,
h_Q5=-1930,
h_Q6=2010,
h_Q7=-1377,
h_Q8=0,
h_Q9=1518,
h_Q10=-2011,
h_Q11=690,
h_Q12=1449,
h_Q13=-1853,
h_Q14=-400,
h_Q15=2047,
h_Q16=-1,
h_Q17=-2047,
h_Q18=-400,
h_Q19=1852,
h_Q20=1449,
h_Q21=-691,
h_Q22=-2011,
h_Q23=-1519,
h_Q24=0,
h_Q25=1376,
h_Q26=2010,
h_Q27=1929,
h_Q28=1449,
h_Q29=876,
h_Q30=399,
h_Q31=100,
h_Q32=0,
h_Q33=100,
h_Q34=399,
h_Q35=876,
h_Q36=1449,
h_Q37=1929,
h_Q38=2010,
h_Q39=1376,
h_Q40=0,
h_Q41=-1519,
h_Q42=-2011,
h_Q43=-691,
h_Q44=1449,
h_Q45=1852,
h_Q46=-400,
h_Q47=-2047,
h_Q48=-1,
h_Q49=2046,
h_Q50=-400,
h_Q51=-1853,
h_Q52=1449,
h_Q53=690,
h_Q54=-2011,
h_Q55=1518,
h_Q56=0,
h_Q57=-1377,
h_Q58=2010,
h_Q59=-1930,
h_Q60=1449,
h_Q61=-877,
h_Q62=399,
h_Q63=-101;



reg [width-1:0]data_I[1:64];
reg [width-1:0]data_Q[1:64];
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
if(!rst)
  begin
    data_I[1 ]<=0;
	data_I[2 ]<=0;
	data_I[3 ]<=0;
	data_I[4 ]<=0;
	data_I[5 ]<=0;
	data_I[6 ]<=0;
	data_I[7 ]<=0;
	data_I[8 ]<=0;
	data_I[9 ]<=0;
	data_I[10]<=0;
	data_I[11]<=0;
	data_I[12]<=0;
	data_I[13]<=0;
	data_I[14]<=0;
	data_I[15]<=0;
	data_I[16]<=0;
	data_I[17]<=0;
	data_I[18]<=0;
	data_I[19]<=0;
	data_I[20]<=0;
	data_I[21]<=0;
	data_I[22]<=0;
	data_I[23]<=0;
	data_I[24]<=0;
	data_I[25]<=0;
	data_I[26]<=0;
	data_I[27]<=0;
	data_I[28]<=0;
	data_I[29]<=0;
	data_I[30]<=0;
	data_I[31]<=0;
	data_I[32]<=0;
	data_I[33]<=0;
	data_I[34]<=0;
	data_I[35]<=0;
	data_I[36]<=0;
	data_I[37]<=0;
	data_I[38]<=0;
	data_I[39]<=0;
	data_I[40]<=0;
	data_I[41]<=0;
	data_I[42]<=0;
	data_I[43]<=0;
    data_I[44]<=0;
    data_I[45]<=0;
    data_I[46]<=0;
    data_I[47]<=0;
    data_I[48]<=0;
    data_I[49]<=0;
    data_I[50]<=0;
    data_I[51]<=0;
    data_I[52]<=0;
    data_I[53]<=0;
    data_I[54]<=0;
    data_I[55]<=0;
    data_I[56]<=0;
    data_I[57]<=0;
    data_I[58]<=0;
    data_I[59]<=0;
    data_I[60]<=0;
    data_I[61]<=0;
    data_I[62]<=0;
    data_I[63]<=0;
    data_I[64]<=0;
  end
else
	data_I[1 ]<=signal_I;
	data_I[2 ]<=data_I[1 ] ;
	data_I[3 ]<=data_I[2 ] ;
	data_I[4 ]<=data_I[3 ] ;
	data_I[5 ]<=data_I[4 ] ;
	data_I[6 ]<=data_I[5 ] ;
	data_I[7 ]<=data_I[6 ] ;
	data_I[8 ]<=data_I[7 ] ;
	data_I[9 ]<=data_I[8 ] ;
	data_I[10]<=data_I[9 ] ;
	data_I[11]<=data_I[10] ;
	data_I[12]<=data_I[11] ;
	data_I[13]<=data_I[12] ;
	data_I[14]<=data_I[13] ;
	data_I[15]<=data_I[14] ;
	data_I[16]<=data_I[15] ;
	data_I[17]<=data_I[16] ;
	data_I[18]<=data_I[17] ;
	data_I[19]<=data_I[18] ;
	data_I[20]<=data_I[19] ;
	data_I[21]<=data_I[20] ;
	data_I[22]<=data_I[21] ;
	data_I[23]<=data_I[22] ;
	data_I[24]<=data_I[23] ;
	data_I[25]<=data_I[24] ;
	data_I[26]<=data_I[25] ;
	data_I[27]<=data_I[26] ;
	data_I[28]<=data_I[27] ;
	data_I[29]<=data_I[28] ;
	data_I[30]<=data_I[29] ;
	data_I[31]<=data_I[30] ;
	data_I[32]<=data_I[31] ;
	data_I[33]<=data_I[32] ;
	data_I[34]<=data_I[33] ;
	data_I[35]<=data_I[34] ;
	data_I[36]<=data_I[35] ;
	data_I[37]<=data_I[36] ;
	data_I[38]<=data_I[37] ;
	data_I[39]<=data_I[38] ;
	data_I[40]<=data_I[39] ;
	data_I[41]<=data_I[40] ;
	data_I[42]<=data_I[41] ;
	data_I[43]<=data_I[42] ;
	data_I[44]<=data_I[43] ;
	data_I[45]<=data_I[44] ;
	data_I[46]<=data_I[45] ;
	data_I[47]<=data_I[46] ;
	data_I[48]<=data_I[47] ;
	data_I[49]<=data_I[48] ;
	data_I[50]<=data_I[49] ;
	data_I[51]<=data_I[50] ;
	data_I[52]<=data_I[51] ;
	data_I[53]<=data_I[52] ;
	data_I[54]<=data_I[53] ;
	data_I[55]<=data_I[54] ;
	data_I[56]<=data_I[55] ;
	data_I[57]<=data_I[56] ;
	data_I[58]<=data_I[57] ;
	data_I[59]<=data_I[58] ;
	data_I[60]<=data_I[59] ;
	data_I[61]<=data_I[60] ;
	data_I[62]<=data_I[61] ;
	data_I[63]<=data_I[62] ;
	data_I[64]<=data_I[63] ;

end

always@(posedge clk)
begin   
if(!rst)
  begin
    data_Q[1 ]<=0;
	data_Q[2 ]<=0;
	data_Q[3 ]<=0;
	data_Q[4 ]<=0;
	data_Q[5 ]<=0;
	data_Q[6 ]<=0;
	data_Q[7 ]<=0;
	data_Q[8 ]<=0;
	data_Q[9 ]<=0;
	data_Q[10]<=0;
	data_Q[11]<=0;
	data_Q[12]<=0;
	data_Q[13]<=0;
	data_Q[14]<=0;
	data_Q[15]<=0;
	data_Q[16]<=0;
	data_Q[17]<=0;
	data_Q[18]<=0;
	data_Q[19]<=0;
	data_Q[20]<=0;
	data_Q[21]<=0;
	data_Q[22]<=0;
	data_Q[23]<=0;
	data_Q[24]<=0;
	data_Q[25]<=0;
	data_Q[26]<=0;
	data_Q[27]<=0;
	data_Q[28]<=0;
	data_Q[29]<=0;
	data_Q[30]<=0;
	data_Q[31]<=0;
	data_Q[32]<=0;
	data_Q[33]<=0;
	data_Q[34]<=0;
	data_Q[35]<=0;
	data_Q[36]<=0;
	data_Q[37]<=0;
	data_Q[38]<=0;
	data_Q[39]<=0;
	data_Q[40]<=0;
	data_Q[41]<=0;
	data_Q[42]<=0;
	data_Q[43]<=0;
    data_Q[44]<=0;
    data_Q[45]<=0;
    data_Q[46]<=0;
    data_Q[47]<=0;
    data_Q[48]<=0;
    data_Q[49]<=0;
    data_Q[50]<=0;
    data_Q[51]<=0;
    data_Q[52]<=0;
    data_Q[53]<=0;
    data_Q[54]<=0;
    data_Q[55]<=0;
    data_Q[56]<=0;
    data_Q[57]<=0;
    data_Q[58]<=0;
    data_Q[59]<=0;
    data_Q[60]<=0;
    data_Q[61]<=0;
    data_Q[62]<=0;
    data_Q[63]<=0;
    data_Q[64]<=0;
  end
else  
	data_Q[1 ]<=signal_Q;
	data_Q[2 ]<=data_Q[1 ] ;
	data_Q[3 ]<=data_Q[2 ] ;
	data_Q[4 ]<=data_Q[3 ] ;
	data_Q[5 ]<=data_Q[4 ] ;
	data_Q[6 ]<=data_Q[5 ] ;
	data_Q[7 ]<=data_Q[6 ] ;
	data_Q[8 ]<=data_Q[7 ] ;
	data_Q[9 ]<=data_Q[8 ] ;
	data_Q[10]<=data_Q[9 ] ;
	data_Q[11]<=data_Q[10] ;
	data_Q[12]<=data_Q[11] ;
	data_Q[13]<=data_Q[12] ;
	data_Q[14]<=data_Q[13] ;
	data_Q[15]<=data_Q[14] ;
	data_Q[16]<=data_Q[15] ;
	data_Q[17]<=data_Q[16] ;
	data_Q[18]<=data_Q[17] ;
	data_Q[19]<=data_Q[18] ;
	data_Q[20]<=data_Q[19] ;
	data_Q[21]<=data_Q[20] ;
	data_Q[22]<=data_Q[21] ;
	data_Q[23]<=data_Q[22] ;
	data_Q[24]<=data_Q[23] ;
	data_Q[25]<=data_Q[24] ;
	data_Q[26]<=data_Q[25] ;
	data_Q[27]<=data_Q[26] ;
	data_Q[28]<=data_Q[27] ;
	data_Q[29]<=data_Q[28] ;
	data_Q[30]<=data_Q[29] ;
	data_Q[31]<=data_Q[30] ;
	data_Q[32]<=data_Q[31] ;
	data_Q[33]<=data_Q[32] ;
	data_Q[34]<=data_Q[33] ;
	data_Q[35]<=data_Q[34] ;
	data_Q[36]<=data_Q[35] ;
	data_Q[37]<=data_Q[36] ;
	data_Q[38]<=data_Q[37] ;
	data_Q[39]<=data_Q[38] ;
	data_Q[40]<=data_Q[39] ;
	data_Q[41]<=data_Q[40] ;
	data_Q[42]<=data_Q[41] ;
	data_Q[43]<=data_Q[42] ;
	data_Q[44]<=data_Q[43] ;
	data_Q[45]<=data_Q[44] ;
	data_Q[46]<=data_Q[45] ;
	data_Q[47]<=data_Q[46] ;
	data_Q[48]<=data_Q[47] ;
	data_Q[49]<=data_Q[48] ;
	data_Q[50]<=data_Q[49] ;
	data_Q[51]<=data_Q[50] ;
	data_Q[52]<=data_Q[51] ;
	data_Q[53]<=data_Q[52] ;
	data_Q[54]<=data_Q[53] ;
	data_Q[55]<=data_Q[54] ;
	data_Q[56]<=data_Q[55] ;
	data_Q[57]<=data_Q[56] ;
	data_Q[58]<=data_Q[57] ;
	data_Q[59]<=data_Q[58] ;
	data_Q[60]<=data_Q[59] ;
	data_Q[61]<=data_Q[60] ;
	data_Q[62]<=data_Q[61] ;
	data_Q[63]<=data_Q[62] ;
	data_Q[64]<=data_Q[63] ;

end

/*conv (PC)*/
reg [4*width:0]PC_I_temp=0;
reg [4*width:0]PC_Q_temp=0;
always@(posedge clk)
begin
if(!rst)
	PC_I_temp<=0;
else
	PC_I_temp<=
		$signed(data_I[1 ]*h_I0  )+$signed(data_Q[1 ]*h_Q0  )+
		$signed(data_I[2 ]*h_I1  )+$signed(data_Q[2 ]*h_Q1  )+
		$signed(data_I[3 ]*h_I2  )+$signed(data_Q[3 ]*h_Q2  )+
		$signed(data_I[4 ]*h_I3  )+$signed(data_Q[4 ]*h_Q3  )+
		$signed(data_I[5 ]*h_I4  )+$signed(data_Q[5 ]*h_Q4  )+
		$signed(data_I[6 ]*h_I5  )+$signed(data_Q[6 ]*h_Q5  )+
		$signed(data_I[7 ]*h_I6  )+$signed(data_Q[7 ]*h_Q6  )+
		$signed(data_I[8 ]*h_I7  )+$signed(data_Q[8 ]*h_Q7  )+
		$signed(data_I[9 ]*h_I8  )+$signed(data_Q[9 ]*h_Q8  )+
		$signed(data_I[10]*h_I9  )+$signed(data_Q[10]*h_Q9  )+
		$signed(data_I[11]*h_I10 )+$signed(data_Q[11]*h_Q10 )+
		$signed(data_I[12]*h_I11 )+$signed(data_Q[12]*h_Q11 )+
		$signed(data_I[13]*h_I12 )+$signed(data_Q[13]*h_Q12 )+
		$signed(data_I[14]*h_I13 )+$signed(data_Q[14]*h_Q13 )+
		$signed(data_I[15]*h_I14 )+$signed(data_Q[15]*h_Q14 )+
		$signed(data_I[16]*h_I15 )+$signed(data_Q[16]*h_Q15 )+
		$signed(data_I[17]*h_I16 )+$signed(data_Q[17]*h_Q16 )+
		$signed(data_I[18]*h_I17 )+$signed(data_Q[18]*h_Q17 )+
		$signed(data_I[19]*h_I18 )+$signed(data_Q[19]*h_Q18 )+
		$signed(data_I[20]*h_I19 )+$signed(data_Q[20]*h_Q19 )+
		$signed(data_I[21]*h_I20 )+$signed(data_Q[21]*h_Q20 )+
		$signed(data_I[22]*h_I21 )+$signed(data_Q[22]*h_Q21 )+
		$signed(data_I[23]*h_I22 )+$signed(data_Q[23]*h_Q22 )+
		$signed(data_I[24]*h_I23 )+$signed(data_Q[24]*h_Q23 )+
		$signed(data_I[25]*h_I24 )+$signed(data_Q[25]*h_Q24 )+
		$signed(data_I[26]*h_I25 )+$signed(data_Q[26]*h_Q25 )+
		$signed(data_I[27]*h_I26 )+$signed(data_Q[27]*h_Q26 )+
		$signed(data_I[28]*h_I27 )+$signed(data_Q[28]*h_Q27 )+
		$signed(data_I[29]*h_I28 )+$signed(data_Q[29]*h_Q28 )+
		$signed(data_I[30]*h_I29 )+$signed(data_Q[30]*h_Q29 )+
		$signed(data_I[31]*h_I30 )+$signed(data_Q[31]*h_Q30 )+
		$signed(data_I[32]*h_I31 )+$signed(data_Q[32]*h_Q31 )+
		$signed(data_I[33]*h_I32 )+$signed(data_Q[33]*h_Q32 )+
		$signed(data_I[34]*h_I33 )+$signed(data_Q[34]*h_Q33 )+
		$signed(data_I[35]*h_I34 )+$signed(data_Q[35]*h_Q34 )+
		$signed(data_I[36]*h_I35 )+$signed(data_Q[36]*h_Q35 )+
		$signed(data_I[37]*h_I36 )+$signed(data_Q[37]*h_Q36 )+
		$signed(data_I[38]*h_I37 )+$signed(data_Q[38]*h_Q37 )+
		$signed(data_I[39]*h_I38 )+$signed(data_Q[39]*h_Q38 )+
		$signed(data_I[40]*h_I39 )+$signed(data_Q[40]*h_Q39 )+
		$signed(data_I[41]*h_I40 )+$signed(data_Q[41]*h_Q40 )+
		$signed(data_I[42]*h_I41 )+$signed(data_Q[42]*h_Q41 )+
		$signed(data_I[43]*h_I42 )+$signed(data_Q[43]*h_Q42 )+
		$signed(data_I[44]*h_I43 )+$signed(data_Q[44]*h_Q43 )+
		$signed(data_I[45]*h_I44 )+$signed(data_Q[45]*h_Q44 )+
		$signed(data_I[46]*h_I45 )+$signed(data_Q[46]*h_Q45 )+
		$signed(data_I[47]*h_I46 )+$signed(data_Q[47]*h_Q46 )+
		$signed(data_I[48]*h_I47 )+$signed(data_Q[48]*h_Q47 )+
		$signed(data_I[49]*h_I48 )+$signed(data_Q[49]*h_Q48 )+
		$signed(data_I[50]*h_I49 )+$signed(data_Q[50]*h_Q49 )+
		$signed(data_I[51]*h_I50 )+$signed(data_Q[51]*h_Q50 )+
		$signed(data_I[52]*h_I51 )+$signed(data_Q[52]*h_Q51 )+
		$signed(data_I[53]*h_I52 )+$signed(data_Q[53]*h_Q52 )+
		$signed(data_I[54]*h_I53 )+$signed(data_Q[54]*h_Q53 )+
		$signed(data_I[55]*h_I54 )+$signed(data_Q[55]*h_Q54 )+
		$signed(data_I[56]*h_I55 )+$signed(data_Q[56]*h_Q55 )+
		$signed(data_I[57]*h_I56 )+$signed(data_Q[57]*h_Q56 )+
		$signed(data_I[58]*h_I57 )+$signed(data_Q[58]*h_Q57 )+
		$signed(data_I[59]*h_I58 )+$signed(data_Q[59]*h_Q58 )+
		$signed(data_I[60]*h_I59 )+$signed(data_Q[60]*h_Q59 )+
		$signed(data_I[61]*h_I60 )+$signed(data_Q[61]*h_Q60 )+
		$signed(data_I[62]*h_I61 )+$signed(data_Q[62]*h_Q61 )+
		$signed(data_I[63]*h_I62 )+$signed(data_Q[63]*h_Q62 )+
		$signed(data_I[64]*h_I63 )+$signed(data_Q[64]*h_Q63 );
		
end
always@(posedge clk)
begin
if(!rst)
	PC_Q_temp<=0;
else
	PC_Q_temp<=
		-$signed(data_I[1 ]*h_Q0  )+$signed(data_Q[1 ]*h_I0  )
		-$signed(data_I[2 ]*h_Q1  )+$signed(data_Q[2 ]*h_I1  )
		-$signed(data_I[3 ]*h_Q2  )+$signed(data_Q[3 ]*h_I2  )
		-$signed(data_I[4 ]*h_Q3  )+$signed(data_Q[4 ]*h_I3  )
		-$signed(data_I[5 ]*h_Q4  )+$signed(data_Q[5 ]*h_I4  )
		-$signed(data_I[6 ]*h_Q5  )+$signed(data_Q[6 ]*h_I5  )
		-$signed(data_I[7 ]*h_Q6  )+$signed(data_Q[7 ]*h_I6  )
		-$signed(data_I[8 ]*h_Q7  )+$signed(data_Q[8 ]*h_I7  )
		-$signed(data_I[9 ]*h_Q8  )+$signed(data_Q[9 ]*h_I8  )
		-$signed(data_I[10]*h_Q9  )+$signed(data_Q[10]*h_I9  )
		-$signed(data_I[11]*h_Q10 )+$signed(data_Q[11]*h_I10 )
		-$signed(data_I[12]*h_Q11 )+$signed(data_Q[12]*h_I11 )
		-$signed(data_I[13]*h_Q12 )+$signed(data_Q[13]*h_I12 )
		-$signed(data_I[14]*h_Q13 )+$signed(data_Q[14]*h_I13 )
		-$signed(data_I[15]*h_Q14 )+$signed(data_Q[15]*h_I14 )
		-$signed(data_I[16]*h_Q15 )+$signed(data_Q[16]*h_I15 )
		-$signed(data_I[17]*h_Q16 )+$signed(data_Q[17]*h_I16 )
		-$signed(data_I[18]*h_Q17 )+$signed(data_Q[18]*h_I17 )
		-$signed(data_I[19]*h_Q18 )+$signed(data_Q[19]*h_I18 )
		-$signed(data_I[20]*h_Q19 )+$signed(data_Q[20]*h_I19 )
		-$signed(data_I[21]*h_Q20 )+$signed(data_Q[21]*h_I20 )
		-$signed(data_I[22]*h_Q21 )+$signed(data_Q[22]*h_I21 )
		-$signed(data_I[23]*h_Q22 )+$signed(data_Q[23]*h_I22 )
		-$signed(data_I[24]*h_Q23 )+$signed(data_Q[24]*h_I23 )
		-$signed(data_I[25]*h_Q24 )+$signed(data_Q[25]*h_I24 )
		-$signed(data_I[26]*h_Q25 )+$signed(data_Q[26]*h_I25 )
		-$signed(data_I[27]*h_Q26 )+$signed(data_Q[27]*h_I26 )
		-$signed(data_I[28]*h_Q27 )+$signed(data_Q[28]*h_I27 )
		-$signed(data_I[29]*h_Q28 )+$signed(data_Q[29]*h_I28 )
		-$signed(data_I[30]*h_Q29 )+$signed(data_Q[30]*h_I29 )
		-$signed(data_I[31]*h_Q30 )+$signed(data_Q[31]*h_I30 )
		-$signed(data_I[32]*h_Q31 )+$signed(data_Q[32]*h_I31 )
		-$signed(data_I[33]*h_Q32 )+$signed(data_Q[33]*h_I32 )
		-$signed(data_I[34]*h_Q33 )+$signed(data_Q[34]*h_I33 )
		-$signed(data_I[35]*h_Q34 )+$signed(data_Q[35]*h_I34 )
		-$signed(data_I[36]*h_Q35 )+$signed(data_Q[36]*h_I35 )
		-$signed(data_I[37]*h_Q36 )+$signed(data_Q[37]*h_I36 )
		-$signed(data_I[38]*h_Q37 )+$signed(data_Q[38]*h_I37 )
		-$signed(data_I[39]*h_Q38 )+$signed(data_Q[39]*h_I38 )
		-$signed(data_I[40]*h_Q39 )+$signed(data_Q[40]*h_I39 )
		-$signed(data_I[41]*h_Q40 )+$signed(data_Q[41]*h_I40 )
		-$signed(data_I[42]*h_Q41 )+$signed(data_Q[42]*h_I41 )
		-$signed(data_I[43]*h_Q42 )+$signed(data_Q[43]*h_I42 )
		-$signed(data_I[44]*h_Q43 )+$signed(data_Q[44]*h_I43 )
		-$signed(data_I[45]*h_Q44 )+$signed(data_Q[45]*h_I44 )
		-$signed(data_I[46]*h_Q45 )+$signed(data_Q[46]*h_I45 )
		-$signed(data_I[47]*h_Q46 )+$signed(data_Q[47]*h_I46 )
		-$signed(data_I[48]*h_Q47 )+$signed(data_Q[48]*h_I47 )
		-$signed(data_I[49]*h_Q48 )+$signed(data_Q[49]*h_I48 )
		-$signed(data_I[50]*h_Q49 )+$signed(data_Q[50]*h_I49 )
		-$signed(data_I[51]*h_Q50 )+$signed(data_Q[51]*h_I50 )
		-$signed(data_I[52]*h_Q51 )+$signed(data_Q[52]*h_I51 )
		-$signed(data_I[53]*h_Q52 )+$signed(data_Q[53]*h_I52 )
		-$signed(data_I[54]*h_Q53 )+$signed(data_Q[54]*h_I53 )
		-$signed(data_I[55]*h_Q54 )+$signed(data_Q[55]*h_I54 )
		-$signed(data_I[56]*h_Q55 )+$signed(data_Q[56]*h_I55 )
		-$signed(data_I[57]*h_Q56 )+$signed(data_Q[57]*h_I56 )
		-$signed(data_I[58]*h_Q57 )+$signed(data_Q[58]*h_I57 )
		-$signed(data_I[59]*h_Q58 )+$signed(data_Q[59]*h_I58 )
		-$signed(data_I[60]*h_Q59 )+$signed(data_Q[60]*h_I59 )
		-$signed(data_I[61]*h_Q60 )+$signed(data_Q[61]*h_I60 )
		-$signed(data_I[62]*h_Q61 )+$signed(data_Q[62]*h_I61 )
		-$signed(data_I[63]*h_Q62 )+$signed(data_Q[63]*h_I62 )
		-$signed(data_I[64]*h_Q63 )+$signed(data_Q[64]*h_I63 );
		
end

assign pc_I=PC_I_temp[2*width+3:2*width-width+4];
assign pc_Q=PC_Q_temp[2*width+3:2*width-width+4];
always@(posedge clk)
begin
	pc_abs2=$signed(pc_I)*$signed(pc_I)+$signed(pc_Q)*$signed(pc_Q);
end

endmodule