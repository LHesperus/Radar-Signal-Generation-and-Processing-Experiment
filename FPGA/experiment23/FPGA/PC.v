`timescale 1 ps / 1 ps
module PC #(parameter width=12)(
input clk,
input rst,
input [width-1:0]signal_I,
input [width-1:0]signal_Q,
output  [3*width-1:0]pc_I,
output  [3*width-1:0]pc_Q,
output reg [6*width:0]pc_abs2
);
parameter
h_I0=-1,
h_I1=2046,
h_I2=128,
h_I3=-2027,
h_I4=-510,
h_I5=1891,
h_I6=1096,
h_I7=-1471,
h_I8=-1729,
h_I9=601,
h_I10=2047,
h_I11=663,
h_I12=-1578,
h_I13=-1810,
h_I14=128,
h_I15=1891,
h_I16=1577,
h_I17=-352,
h_I18=-1904,
h_I19=-1675,
h_I20=-1,
h_I21=1636,
h_I22=1982,
h_I23=900,
h_I24=-754,
h_I25=-1892,
h_I26=-1904,
h_I27=-901,
h_I28=509,
h_I29=1636,
h_I30=2047,
h_I31=1674,
h_I32=753,
h_I33=-352,
h_I34=-1305,
h_I35=-1892,
h_I36=-2043,
h_I37=-1810,
h_I38=-1305,
h_I39=-664,
h_I40=-1,
h_I41=601,
h_I42=1096,
h_I43=1470,
h_I44=1728,
h_I45=1891,
h_I46=1982,
h_I47=2026,
h_I48=2042,
h_I49=2046,
h_I50=2047,
h_I51=2046,
h_I52=2042,
h_I53=2026,
h_I54=1982,
h_I55=1891,
h_I56=1728,
h_I57=1470,
h_I58=1096,
h_I59=601,
h_I60=-1,
h_I61=-664,
h_I62=-1305,
h_I63=-1810,
h_I64=-2043,
h_I65=-1892,
h_I66=-1305,
h_I67=-352,
h_I68=753,
h_I69=1674,
h_I70=2047,
h_I71=1636,
h_I72=509,
h_I73=-901,
h_I74=-1904,
h_I75=-1892,
h_I76=-754,
h_I77=900,
h_I78=1982,
h_I79=1636,
h_I80=-1,
h_I81=-1675,
h_I82=-1904,
h_I83=-352,
h_I84=1577,
h_I85=1891,
h_I86=128,
h_I87=-1810,
h_I88=-1578,
h_I89=663,
h_I90=2047,
h_I91=601,
h_I92=-1729,
h_I93=-1471,
h_I94=1096,
h_I95=1891,
h_I96=-510,
h_I97=-2027,
h_I98=128,
h_I99=2046;



parameter
h_Q0=2047,
h_Q1=32,
h_Q2=-2043,
h_Q3=-289,
h_Q4=1982,
h_Q5=783,
h_Q6=-1729,
h_Q7=-1425,
h_Q8=1096,
h_Q9=1956,
h_Q10=0,
h_Q11=-1937,
h_Q12=-1305,
h_Q13=957,
h_Q14=2042,
h_Q15=783,
h_Q16=-1305,
h_Q17=-2017,
h_Q18=-754,
h_Q19=1177,
h_Q20=2047,
h_Q21=1229,
h_Q22=-510,
h_Q23=-1839,
h_Q24=-1904,
h_Q25=-784,
h_Q26=753,
h_Q27=1838,
h_Q28=1982,
h_Q29=1229,
h_Q30=0,
h_Q31=-1178,
h_Q32=-1904,
h_Q33=-2017,
h_Q34=-1578,
h_Q35=-784,
h_Q36=128,
h_Q37=957,
h_Q38=1577,
h_Q39=1936,
h_Q40=2047,
h_Q41=1956,
h_Q42=1728,
h_Q43=1424,
h_Q44=1096,
h_Q45=783,
h_Q46=509,
h_Q47=288,
h_Q48=128,
h_Q49=32,
h_Q50=0,
h_Q51=32,
h_Q52=128,
h_Q53=288,
h_Q54=509,
h_Q55=783,
h_Q56=1096,
h_Q57=1424,
h_Q58=1728,
h_Q59=1956,
h_Q60=2047,
h_Q61=1936,
h_Q62=1577,
h_Q63=957,
h_Q64=128,
h_Q65=-784,
h_Q66=-1578,
h_Q67=-2017,
h_Q68=-1904,
h_Q69=-1178,
h_Q70=0,
h_Q71=1229,
h_Q72=1982,
h_Q73=1838,
h_Q74=753,
h_Q75=-784,
h_Q76=-1904,
h_Q77=-1839,
h_Q78=-510,
h_Q79=1229,
h_Q80=2047,
h_Q81=1177,
h_Q82=-754,
h_Q83=-2017,
h_Q84=-1305,
h_Q85=783,
h_Q86=2042,
h_Q87=957,
h_Q88=-1305,
h_Q89=-1937,
h_Q90=0,
h_Q91=1956,
h_Q92=1096,
h_Q93=-1425,
h_Q94=-1729,
h_Q95=783,
h_Q96=1982,
h_Q97=-289,
h_Q98=-2043,
h_Q99=32;





reg [width-1:0]data_I[1:100];
reg [width-1:0]data_Q[1:100];
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
	data_I[65]<=0;
	data_I[66]<=0;
	data_I[67]<=0;
	data_I[68]<=0;
	data_I[69]<=0;
	data_I[70]<=0;
	data_I[71]<=0;
	data_I[72]<=0;
	data_I[73]<=0;
	data_I[74]<=0;
	data_I[75]<=0;
	data_I[76]<=0;
	data_I[77]<=0;
	data_I[78]<=0;
	data_I[79]<=0;
	data_I[80]<=0;
	data_I[81]<=0;
	data_I[82]<=0;
	data_I[83]<=0;
	data_I[84]<=0;
	data_I[85]<=0;
	data_I[86]<=0;
	data_I[87]<=0;
	data_I[88]<=0;
	data_I[89]<=0;
	data_I[90]<=0;
	data_I[91]<=0;
	data_I[92]<=0;
	data_I[93]<=0;
	data_I[94]<=0;
	data_I[95]<=0;
	data_I[96]<=0;
	data_I[97]<=0;
	data_I[98]<=0;
	data_I[99]<=0;
	data_I[100]<=0;
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
    data_I[65]<=data_I[64] ;
	data_I[66]<=data_I[65] ;
	data_I[67]<=data_I[66] ;
	data_I[68]<=data_I[67] ;
	data_I[69]<=data_I[68] ;
	data_I[70]<=data_I[69] ;
	data_I[71]<=data_I[70] ;
	data_I[72]<=data_I[71] ;
	data_I[73]<=data_I[72] ;
	data_I[74]<=data_I[73] ;
	data_I[75]<=data_I[74] ;
	data_I[76]<=data_I[75] ;
	data_I[77]<=data_I[76] ;
	data_I[78]<=data_I[77] ;
	data_I[79]<=data_I[78] ;
	data_I[80]<=data_I[79] ;
	data_I[81]<=data_I[80] ;
	data_I[82]<=data_I[81] ;
	data_I[83]<=data_I[82] ;
	data_I[84]<=data_I[83] ;
	data_I[85]<=data_I[84] ;
	data_I[86]<=data_I[85] ;
	data_I[87]<=data_I[86] ;
	data_I[88]<=data_I[87] ;
	data_I[89]<=data_I[88] ;
	data_I[90]<=data_I[89] ;
	data_I[91]<=data_I[90] ;
	data_I[92]<=data_I[91] ;
	data_I[93]<=data_I[92] ;
	data_I[94]<=data_I[93] ;
	data_I[95]<=data_I[94] ;
	data_I[96]<=data_I[95] ;
	data_I[97]<=data_I[96] ;
	data_I[98]<=data_I[97] ;
	data_I[99]<=data_I[98] ;
	data_I[100]<=data_I[99] ;
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
	data_Q[65]<=0;
	data_Q[66]<=0;
	data_Q[67]<=0;
	data_Q[68]<=0;
	data_Q[69]<=0;
	data_Q[70]<=0;
	data_Q[71]<=0;
	data_Q[72]<=0;
	data_Q[73]<=0;
	data_Q[74]<=0;
	data_Q[75]<=0;
	data_Q[76]<=0;
	data_Q[77]<=0;
	data_Q[78]<=0;
	data_Q[79]<=0;
	data_Q[80]<=0;
	data_Q[81]<=0;
	data_Q[82]<=0;
	data_Q[83]<=0;
	data_Q[84]<=0;
	data_Q[85]<=0;
	data_Q[86]<=0;
	data_Q[87]<=0;
	data_Q[88]<=0;
	data_Q[89]<=0;
	data_Q[90]<=0;
	data_Q[91]<=0;
	data_Q[92]<=0;
	data_Q[93]<=0;
	data_Q[94]<=0;
	data_Q[95]<=0;
	data_Q[96]<=0;
	data_Q[97]<=0;
	data_Q[98]<=0;
	data_Q[99]<=0;
	data_Q[100]<=0;
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
    data_Q[65]<=data_Q[64] ;
	data_Q[66]<=data_Q[65] ;
	data_Q[67]<=data_Q[66] ;
	data_Q[68]<=data_Q[67] ;
	data_Q[69]<=data_Q[68] ;
	data_Q[70]<=data_Q[69] ;
	data_Q[71]<=data_Q[70] ;
	data_Q[72]<=data_Q[71] ;
	data_Q[73]<=data_Q[72] ;
	data_Q[74]<=data_Q[73] ;
	data_Q[75]<=data_Q[74] ;
	data_Q[76]<=data_Q[75] ;
	data_Q[77]<=data_Q[76] ;
	data_Q[78]<=data_Q[77] ;
	data_Q[79]<=data_Q[78] ;
	data_Q[80]<=data_Q[79] ;
	data_Q[81]<=data_Q[80] ;
	data_Q[82]<=data_Q[81] ;
	data_Q[83]<=data_Q[82] ;
	data_Q[84]<=data_Q[83] ;
	data_Q[85]<=data_Q[84] ;
	data_Q[86]<=data_Q[85] ;
	data_Q[87]<=data_Q[86] ;
	data_Q[88]<=data_Q[87] ;
	data_Q[89]<=data_Q[88] ;
	data_Q[90]<=data_Q[89] ;
	data_Q[91]<=data_Q[90] ;
	data_Q[92]<=data_Q[91] ;
	data_Q[93]<=data_Q[92] ;
	data_Q[94]<=data_Q[93] ;
	data_Q[95]<=data_Q[94] ;
	data_Q[96]<=data_Q[95] ;
	data_Q[97]<=data_Q[96] ;
	data_Q[98]<=data_Q[97] ;
	data_Q[99]<=data_Q[98] ;
	data_Q[100]<=data_Q[99] ;
end

/*conv (PC)*/
reg [3*width-1:0]PC_I_temp=0;
reg [3*width-1:0]PC_Q_temp=0;
always@(posedge clk)
begin
if(!rst)
	PC_I_temp<=0;
else
	PC_I_temp<=
		$signed(data_I[1 ])*h_I0  +$signed(data_Q[1 ])*h_Q0  +
		$signed(data_I[2 ])*h_I1  +$signed(data_Q[2 ])*h_Q1  +
		$signed(data_I[3 ])*h_I2  +$signed(data_Q[3 ])*h_Q2  +
		$signed(data_I[4 ])*h_I3  +$signed(data_Q[4 ])*h_Q3  +
		$signed(data_I[5 ])*h_I4  +$signed(data_Q[5 ])*h_Q4  +
		$signed(data_I[6 ])*h_I5  +$signed(data_Q[6 ])*h_Q5  +
		$signed(data_I[7 ])*h_I6  +$signed(data_Q[7 ])*h_Q6  +
		$signed(data_I[8 ])*h_I7  +$signed(data_Q[8 ])*h_Q7  +
		$signed(data_I[9 ])*h_I8  +$signed(data_Q[9 ])*h_Q8  +
		$signed(data_I[10])*h_I9  +$signed(data_Q[10])*h_Q9  +
		$signed(data_I[11])*h_I10 +$signed(data_Q[11])*h_Q10 +
		$signed(data_I[12])*h_I11 +$signed(data_Q[12])*h_Q11 +
		$signed(data_I[13])*h_I12 +$signed(data_Q[13])*h_Q12 +
		$signed(data_I[14])*h_I13 +$signed(data_Q[14])*h_Q13 +
		$signed(data_I[15])*h_I14 +$signed(data_Q[15])*h_Q14 +
		$signed(data_I[16])*h_I15 +$signed(data_Q[16])*h_Q15 +
		$signed(data_I[17])*h_I16 +$signed(data_Q[17])*h_Q16 +
		$signed(data_I[18])*h_I17 +$signed(data_Q[18])*h_Q17 +
		$signed(data_I[19])*h_I18 +$signed(data_Q[19])*h_Q18 +
		$signed(data_I[20])*h_I19 +$signed(data_Q[20])*h_Q19 +
		$signed(data_I[21])*h_I20 +$signed(data_Q[21])*h_Q20 +
		$signed(data_I[22])*h_I21 +$signed(data_Q[22])*h_Q21 +
		$signed(data_I[23])*h_I22 +$signed(data_Q[23])*h_Q22 +
		$signed(data_I[24])*h_I23 +$signed(data_Q[24])*h_Q23 +
		$signed(data_I[25])*h_I24 +$signed(data_Q[25])*h_Q24 +
		$signed(data_I[26])*h_I25 +$signed(data_Q[26])*h_Q25 +
		$signed(data_I[27])*h_I26 +$signed(data_Q[27])*h_Q26 +
		$signed(data_I[28])*h_I27 +$signed(data_Q[28])*h_Q27 +
		$signed(data_I[29])*h_I28 +$signed(data_Q[29])*h_Q28 +
		$signed(data_I[30])*h_I29 +$signed(data_Q[30])*h_Q29 +
		$signed(data_I[31])*h_I30 +$signed(data_Q[31])*h_Q30 +
		$signed(data_I[32])*h_I31 +$signed(data_Q[32])*h_Q31 +
		$signed(data_I[33])*h_I32 +$signed(data_Q[33])*h_Q32 +
		$signed(data_I[34])*h_I33 +$signed(data_Q[34])*h_Q33 +
		$signed(data_I[35])*h_I34 +$signed(data_Q[35])*h_Q34 +
		$signed(data_I[36])*h_I35 +$signed(data_Q[36])*h_Q35 +
		$signed(data_I[37])*h_I36 +$signed(data_Q[37])*h_Q36 +
		$signed(data_I[38])*h_I37 +$signed(data_Q[38])*h_Q37 +
		$signed(data_I[39])*h_I38 +$signed(data_Q[39])*h_Q38 +
		$signed(data_I[40])*h_I39 +$signed(data_Q[40])*h_Q39 +
		$signed(data_I[41])*h_I40 +$signed(data_Q[41])*h_Q40 +
		$signed(data_I[42])*h_I41 +$signed(data_Q[42])*h_Q41 +
		$signed(data_I[43])*h_I42 +$signed(data_Q[43])*h_Q42 +
		$signed(data_I[44])*h_I43 +$signed(data_Q[44])*h_Q43 +
		$signed(data_I[45])*h_I44 +$signed(data_Q[45])*h_Q44 +
		$signed(data_I[46])*h_I45 +$signed(data_Q[46])*h_Q45 +
		$signed(data_I[47])*h_I46 +$signed(data_Q[47])*h_Q46 +
		$signed(data_I[48])*h_I47 +$signed(data_Q[48])*h_Q47 +
		$signed(data_I[49])*h_I48 +$signed(data_Q[49])*h_Q48 +
		$signed(data_I[50])*h_I49 +$signed(data_Q[50])*h_Q49 +
		$signed(data_I[51])*h_I50 +$signed(data_Q[51])*h_Q50 +
		$signed(data_I[52])*h_I51 +$signed(data_Q[52])*h_Q51 +
		$signed(data_I[53])*h_I52 +$signed(data_Q[53])*h_Q52 +
		$signed(data_I[54])*h_I53 +$signed(data_Q[54])*h_Q53 +
		$signed(data_I[55])*h_I54 +$signed(data_Q[55])*h_Q54 +
		$signed(data_I[56])*h_I55 +$signed(data_Q[56])*h_Q55 +
		$signed(data_I[57])*h_I56 +$signed(data_Q[57])*h_Q56 +
		$signed(data_I[58])*h_I57 +$signed(data_Q[58])*h_Q57 +
		$signed(data_I[59])*h_I58 +$signed(data_Q[59])*h_Q58 +
		$signed(data_I[60])*h_I59 +$signed(data_Q[60])*h_Q59 +
		$signed(data_I[61])*h_I60 +$signed(data_Q[61])*h_Q60 +
		$signed(data_I[62])*h_I61 +$signed(data_Q[62])*h_Q61 +
		$signed(data_I[63])*h_I62 +$signed(data_Q[63])*h_Q62 +
		$signed(data_I[64])*h_I63 +$signed(data_Q[64])*h_Q63 +
		$signed(data_I[65])*h_I64 +$signed(data_Q[65])*h_Q64 +
		$signed(data_I[66])*h_I65 +$signed(data_Q[66])*h_Q65 +
		$signed(data_I[67])*h_I66 +$signed(data_Q[67])*h_Q66 +
		$signed(data_I[68])*h_I67 +$signed(data_Q[68])*h_Q67 +
		$signed(data_I[69])*h_I68 +$signed(data_Q[69])*h_Q68 +
		$signed(data_I[70])*h_I69 +$signed(data_Q[70])*h_Q69 +
		$signed(data_I[71])*h_I70 +$signed(data_Q[71])*h_Q70 +
		$signed(data_I[72])*h_I71 +$signed(data_Q[72])*h_Q71 +
		$signed(data_I[73])*h_I72 +$signed(data_Q[73])*h_Q72 +
		$signed(data_I[74])*h_I73 +$signed(data_Q[74])*h_Q73 +
		$signed(data_I[75])*h_I74 +$signed(data_Q[75])*h_Q74 +
		$signed(data_I[76])*h_I75 +$signed(data_Q[76])*h_Q75 +
		$signed(data_I[77])*h_I76 +$signed(data_Q[77])*h_Q76 +
		$signed(data_I[78])*h_I77 +$signed(data_Q[78])*h_Q77 +
		$signed(data_I[79])*h_I78 +$signed(data_Q[79])*h_Q78 +
		$signed(data_I[80])*h_I79 +$signed(data_Q[80])*h_Q79 +
		$signed(data_I[81])*h_I80 +$signed(data_Q[81])*h_Q80 +
		$signed(data_I[82])*h_I81 +$signed(data_Q[82])*h_Q81 +
		$signed(data_I[83])*h_I82 +$signed(data_Q[83])*h_Q82 +
		$signed(data_I[84])*h_I83 +$signed(data_Q[84])*h_Q83 +
		$signed(data_I[85])*h_I84 +$signed(data_Q[85])*h_Q84 +
		$signed(data_I[86])*h_I85 +$signed(data_Q[86])*h_Q85 +
		$signed(data_I[87])*h_I86 +$signed(data_Q[87])*h_Q86 +
		$signed(data_I[88])*h_I87 +$signed(data_Q[88])*h_Q87 +
		$signed(data_I[89])*h_I88 +$signed(data_Q[89])*h_Q88 +
		$signed(data_I[90])*h_I89 +$signed(data_Q[90])*h_Q89 +
		$signed(data_I[91])*h_I90 +$signed(data_Q[91])*h_Q90 +
		$signed(data_I[92])*h_I91 +$signed(data_Q[92])*h_Q91 +
		$signed(data_I[93])*h_I92 +$signed(data_Q[93])*h_Q92 +
		$signed(data_I[94])*h_I93 +$signed(data_Q[94])*h_Q93 +
		$signed(data_I[95])*h_I94 +$signed(data_Q[95])*h_Q94 +	                   
		$signed(data_I[96])*h_I95 +$signed(data_Q[96])*h_Q95 +
		$signed(data_I[97])*h_I96 +$signed(data_Q[97])*h_Q96 +
		$signed(data_I[98])*h_I97 +$signed(data_Q[98])*h_Q97 +
		$signed(data_I[99])*h_I98 +$signed(data_Q[99])*h_Q98 +
		$signed(data_I[100])*h_I99+$signed(data_Q[100])*h_Q99 ;	
end
always@(posedge clk)
begin
if(!rst)
	PC_Q_temp<=0;
else
	PC_Q_temp<=
		-$signed(data_I[1 ])*h_Q0  +$signed(data_Q[1 ])*h_I0  
		-$signed(data_I[2 ])*h_Q1  +$signed(data_Q[2 ])*h_I1  
		-$signed(data_I[3 ])*h_Q2  +$signed(data_Q[3 ])*h_I2  
		-$signed(data_I[4 ])*h_Q3  +$signed(data_Q[4 ])*h_I3  
		-$signed(data_I[5 ])*h_Q4  +$signed(data_Q[5 ])*h_I4  
		-$signed(data_I[6 ])*h_Q5  +$signed(data_Q[6 ])*h_I5  
		-$signed(data_I[7 ])*h_Q6  +$signed(data_Q[7 ])*h_I6  
		-$signed(data_I[8 ])*h_Q7  +$signed(data_Q[8 ])*h_I7  
		-$signed(data_I[9 ])*h_Q8  +$signed(data_Q[9 ])*h_I8  
		-$signed(data_I[10])*h_Q9  +$signed(data_Q[10])*h_I9  
		-$signed(data_I[11])*h_Q10 +$signed(data_Q[11])*h_I10 
		-$signed(data_I[12])*h_Q11 +$signed(data_Q[12])*h_I11 
		-$signed(data_I[13])*h_Q12 +$signed(data_Q[13])*h_I12 
		-$signed(data_I[14])*h_Q13 +$signed(data_Q[14])*h_I13 
		-$signed(data_I[15])*h_Q14 +$signed(data_Q[15])*h_I14 
		-$signed(data_I[16])*h_Q15 +$signed(data_Q[16])*h_I15 
		-$signed(data_I[17])*h_Q16 +$signed(data_Q[17])*h_I16 
		-$signed(data_I[18])*h_Q17 +$signed(data_Q[18])*h_I17 
		-$signed(data_I[19])*h_Q18 +$signed(data_Q[19])*h_I18 
		-$signed(data_I[20])*h_Q19 +$signed(data_Q[20])*h_I19 
		-$signed(data_I[21])*h_Q20 +$signed(data_Q[21])*h_I20 
		-$signed(data_I[22])*h_Q21 +$signed(data_Q[22])*h_I21 
		-$signed(data_I[23])*h_Q22 +$signed(data_Q[23])*h_I22 
		-$signed(data_I[24])*h_Q23 +$signed(data_Q[24])*h_I23 
		-$signed(data_I[25])*h_Q24 +$signed(data_Q[25])*h_I24 
		-$signed(data_I[26])*h_Q25 +$signed(data_Q[26])*h_I25 
		-$signed(data_I[27])*h_Q26 +$signed(data_Q[27])*h_I26 
		-$signed(data_I[28])*h_Q27 +$signed(data_Q[28])*h_I27 
		-$signed(data_I[29])*h_Q28 +$signed(data_Q[29])*h_I28 
		-$signed(data_I[30])*h_Q29 +$signed(data_Q[30])*h_I29 
		-$signed(data_I[31])*h_Q30 +$signed(data_Q[31])*h_I30 
		-$signed(data_I[32])*h_Q31 +$signed(data_Q[32])*h_I31 
		-$signed(data_I[33])*h_Q32 +$signed(data_Q[33])*h_I32 
		-$signed(data_I[34])*h_Q33 +$signed(data_Q[34])*h_I33 
		-$signed(data_I[35])*h_Q34 +$signed(data_Q[35])*h_I34 
		-$signed(data_I[36])*h_Q35 +$signed(data_Q[36])*h_I35 
		-$signed(data_I[37])*h_Q36 +$signed(data_Q[37])*h_I36 
		-$signed(data_I[38])*h_Q37 +$signed(data_Q[38])*h_I37 
		-$signed(data_I[39])*h_Q38 +$signed(data_Q[39])*h_I38 
		-$signed(data_I[40])*h_Q39 +$signed(data_Q[40])*h_I39 
		-$signed(data_I[41])*h_Q40 +$signed(data_Q[41])*h_I40 
		-$signed(data_I[42])*h_Q41 +$signed(data_Q[42])*h_I41 
		-$signed(data_I[43])*h_Q42 +$signed(data_Q[43])*h_I42 
		-$signed(data_I[44])*h_Q43 +$signed(data_Q[44])*h_I43 
		-$signed(data_I[45])*h_Q44 +$signed(data_Q[45])*h_I44 
		-$signed(data_I[46])*h_Q45 +$signed(data_Q[46])*h_I45 
		-$signed(data_I[47])*h_Q46 +$signed(data_Q[47])*h_I46 
		-$signed(data_I[48])*h_Q47 +$signed(data_Q[48])*h_I47 
		-$signed(data_I[49])*h_Q48 +$signed(data_Q[49])*h_I48 
		-$signed(data_I[50])*h_Q49 +$signed(data_Q[50])*h_I49 
		-$signed(data_I[51])*h_Q50 +$signed(data_Q[51])*h_I50 
		-$signed(data_I[52])*h_Q51 +$signed(data_Q[52])*h_I51 
		-$signed(data_I[53])*h_Q52 +$signed(data_Q[53])*h_I52 
		-$signed(data_I[54])*h_Q53 +$signed(data_Q[54])*h_I53 
		-$signed(data_I[55])*h_Q54 +$signed(data_Q[55])*h_I54 
		-$signed(data_I[56])*h_Q55 +$signed(data_Q[56])*h_I55 
		-$signed(data_I[57])*h_Q56 +$signed(data_Q[57])*h_I56 
		-$signed(data_I[58])*h_Q57 +$signed(data_Q[58])*h_I57 
		-$signed(data_I[59])*h_Q58 +$signed(data_Q[59])*h_I58 
		-$signed(data_I[60])*h_Q59 +$signed(data_Q[60])*h_I59 
		-$signed(data_I[61])*h_Q60 +$signed(data_Q[61])*h_I60 
		-$signed(data_I[62])*h_Q61 +$signed(data_Q[62])*h_I61 
		-$signed(data_I[63])*h_Q62 +$signed(data_Q[63])*h_I62 
		-$signed(data_I[64])*h_Q63 +$signed(data_Q[64])*h_I63 
		-$signed(data_I[65])*h_Q64 +$signed(data_Q[65])*h_I64 
		-$signed(data_I[66])*h_Q65 +$signed(data_Q[66])*h_I65 
		-$signed(data_I[67])*h_Q66 +$signed(data_Q[67])*h_I66 
		-$signed(data_I[68])*h_Q67 +$signed(data_Q[68])*h_I67 
		-$signed(data_I[69])*h_Q68 +$signed(data_Q[69])*h_I68 
		-$signed(data_I[70])*h_Q69 +$signed(data_Q[70])*h_I69 
		-$signed(data_I[71])*h_Q70 +$signed(data_Q[71])*h_I70 
		-$signed(data_I[72])*h_Q71 +$signed(data_Q[72])*h_I71 
		-$signed(data_I[73])*h_Q72 +$signed(data_Q[73])*h_I72 
		-$signed(data_I[74])*h_Q73 +$signed(data_Q[74])*h_I73 
		-$signed(data_I[75])*h_Q74 +$signed(data_Q[75])*h_I74 
		-$signed(data_I[76])*h_Q75 +$signed(data_Q[76])*h_I75 
		-$signed(data_I[77])*h_Q76 +$signed(data_Q[77])*h_I76 
		-$signed(data_I[78])*h_Q77 +$signed(data_Q[78])*h_I77 
		-$signed(data_I[79])*h_Q78 +$signed(data_Q[79])*h_I78 
		-$signed(data_I[80])*h_Q79 +$signed(data_Q[80])*h_I79 
		-$signed(data_I[81])*h_Q80 +$signed(data_Q[81])*h_I80 
		-$signed(data_I[82])*h_Q81 +$signed(data_Q[82])*h_I81 
		-$signed(data_I[83])*h_Q82 +$signed(data_Q[83])*h_I82 
		-$signed(data_I[84])*h_Q83 +$signed(data_Q[84])*h_I83 
		-$signed(data_I[85])*h_Q84 +$signed(data_Q[85])*h_I84 
		-$signed(data_I[86])*h_Q85 +$signed(data_Q[86])*h_I85 
		-$signed(data_I[87])*h_Q86 +$signed(data_Q[87])*h_I86 
		-$signed(data_I[88])*h_Q87 +$signed(data_Q[88])*h_I87 
		-$signed(data_I[89])*h_Q88 +$signed(data_Q[89])*h_I88 
		-$signed(data_I[90])*h_Q89 +$signed(data_Q[90])*h_I89 
		-$signed(data_I[91])*h_Q90 +$signed(data_Q[91])*h_I90 
		-$signed(data_I[92])*h_Q91 +$signed(data_Q[92])*h_I91 
		-$signed(data_I[93])*h_Q92 +$signed(data_Q[93])*h_I92 
		-$signed(data_I[94])*h_Q93 +$signed(data_Q[94])*h_I93 
		-$signed(data_I[95])*h_Q94 +$signed(data_Q[95])*h_I94                    
		-$signed(data_I[96])*h_Q95 +$signed(data_Q[96])*h_I95 
		-$signed(data_I[97])*h_Q96 +$signed(data_Q[97])*h_I96 
		-$signed(data_I[98])*h_Q97 +$signed(data_Q[98])*h_I97 
		-$signed(data_I[99])*h_Q98 +$signed(data_Q[99])*h_I98 
		-$signed(data_I[100])*h_Q99 +$signed(data_Q[100])*h_I99 ;			
end

assign pc_I=PC_I_temp;
assign pc_Q=PC_Q_temp;
always@(posedge clk)
begin
	pc_abs2=$signed(pc_I)*$signed(pc_I)+$signed(pc_Q)*$signed(pc_Q);
end

endmodule