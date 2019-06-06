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
h_I0=2047,
h_I1=-1003,
h_I2=-1105,
h_I3=2035,
h_I4=-678,
h_I5=-1489,
h_I6=1870,
h_I7=95,
h_I8=-1955,
h_I9=1203,
h_I10=1222,
h_I11=-1916,
h_I12=-214,
h_I13=2030,
h_I14=-678,
h_I15=-1773,
h_I16=1297,
h_I17=1387,
h_I18=-1657,
h_I19=-1045,
h_I20=1829,
h_I21=832,
h_I22=-1889,
h_I23=-789,
h_I24=1870,
h_I25=918,
h_I26=-1761,
h_I27=-1204,
h_I28=1505,
h_I29=1583,
h_I30=-1024,
h_I31=-1932,
h_I32=261,
h_I33=2035,
h_I34=722,
h_I35=-1642,
h_I36=-1657,
h_I37=609,
h_I38=2044,
h_I39=832,
h_I40=-1405,
h_I41=-1932,
h_I42=-214,
h_I43=1723,
h_I44=1784,
h_I45=0,
h_I46=-1761,
h_I47=-1819,
h_I48=-214,
h_I49=1552,
h_I50=1991,
h_I51=832,
h_I52=-940,
h_I53=-1998,
h_I54=-1657,
h_I55=-238,
h_I56=1297,
h_I57=2035,
h_I58=1627,
h_I59=378,
h_I60=-1024,
h_I61=-1916,
h_I62=-1955,
h_I63=-1204,
h_I64=-24,
h_I65=1124,
h_I66=1870,
h_I67=2030,
h_I68=1627,
h_I69=832,
h_I70=-120,
h_I71=-1003,
h_I72=-1657,
h_I73=-1998,
h_I74=-2020,
h_I75=-1773,
h_I76=-1334,
h_I77=-789,
h_I78=-214,
h_I79=331,
h_I80=810,
h_I81=1203,
h_I82=1505,
h_I83=1723,
h_I84=1870,
h_I85=1961,
h_I86=2011,
h_I87=2035,
h_I88=2044,
h_I89=2046,
h_I90=2047,
h_I91=2046,
h_I92=2044,
h_I93=2035,
h_I94=2011,
h_I95=1961,
h_I96=1870,
h_I97=1723,
h_I98=1505,
h_I99=1203,
h_I100=810,
h_I101=331,
h_I102=-214,
h_I103=-789,
h_I104=-1334,
h_I105=-1773,
h_I106=-2020,
h_I107=-1998,
h_I108=-1657,
h_I109=-1003,
h_I110=-120,
h_I111=832,
h_I112=1627,
h_I113=2030,
h_I114=1870,
h_I115=1124,
h_I116=-24,
h_I117=-1204,
h_I118=-1955,
h_I119=-1916,
h_I120=-1024,
h_I121=378,
h_I122=1627,
h_I123=2035,
h_I124=1297,
h_I125=-238,
h_I126=-1657,
h_I127=-1998,
h_I128=-940,
h_I129=832,
h_I130=1991,
h_I131=1552,
h_I132=-214,
h_I133=-1819,
h_I134=-1761,
h_I135=0,
h_I136=1784,
h_I137=1723,
h_I138=-214,
h_I139=-1932,
h_I140=-1405,
h_I141=832,
h_I142=2044,
h_I143=609,
h_I144=-1657,
h_I145=-1642,
h_I146=722,
h_I147=2035,
h_I148=261,
h_I149=-1932,
h_I150=-1024,
h_I151=1583,
h_I152=1505,
h_I153=-1204,
h_I154=-1761,
h_I155=918,
h_I156=1870,
h_I157=-789,
h_I158=-1889,
h_I159=832,
h_I160=1829,
h_I161=-1045,
h_I162=-1657,
h_I163=1387,
h_I164=1297,
h_I165=-1773,
h_I166=-678,
h_I167=2030,
h_I168=-214,
h_I169=-1916,
h_I170=1222,
h_I171=1203,
h_I172=-1955,
h_I173=95,
h_I174=1870,
h_I175=-1489,
h_I176=-678,
h_I177=2035,
h_I178=-1105,
h_I179=-1003;




parameter
h_Q0=0,
h_Q1=-1785,
h_Q2=1723,
h_Q3=213,
h_Q4=-1932,
h_Q5=1404,
h_Q6=832,
h_Q7=-2045,
h_Q8=609,
h_Q9=1656,
h_Q10=-1642,
h_Q11=-723,
h_Q12=2035,
h_Q13=-262,
h_Q14=-1932,
h_Q15=1023,
h_Q16=1583,
h_Q17=-1506,
h_Q18=-1204,
h_Q19=1760,
h_Q20=918,
h_Q21=-1871,
h_Q22=-789,
h_Q23=1888,
h_Q24=832,
h_Q25=-1830,
h_Q26=-1045,
h_Q27=1656,
h_Q28=1387,
h_Q29=-1298,
h_Q30=-1773,
h_Q31=677,
h_Q32=2030,
h_Q33=213,
h_Q34=-1916,
h_Q35=-1223,
h_Q36=1203,
h_Q37=1954,
h_Q38=95,
h_Q39=-1871,
h_Q40=-1489,
h_Q41=677,
h_Q42=2035,
h_Q43=1104,
h_Q44=-1003,
h_Q45=-2047,
h_Q46=-1045,
h_Q47=939,
h_Q48=2035,
h_Q49=1333,
h_Q50=-473,
h_Q51=-1871,
h_Q52=-1819,
h_Q53=-449,
h_Q54=1203,
h_Q55=2033,
h_Q56=1583,
h_Q57=213,
h_Q58=-1242,
h_Q59=-2012,
h_Q60=-1773,
h_Q61=-723,
h_Q62=609,
h_Q63=1656,
h_Q64=2046,
h_Q65=1710,
h_Q66=832,
h_Q67=-262,
h_Q68=-1242,
h_Q69=-1871,
h_Q70=-2044,
h_Q71=-1785,
h_Q72=-1204,
h_Q73=-449,
h_Q74=331,
h_Q75=1023,
h_Q76=1552,
h_Q77=1888,
h_Q78=2035,
h_Q79=2019,
h_Q80=1879,
h_Q81=1656,
h_Q82=1387,
h_Q83=1104,
h_Q84=832,
h_Q85=587,
h_Q86=378,
h_Q87=213,
h_Q88=95,
h_Q89=23,
h_Q90=0,
h_Q91=23,
h_Q92=95,
h_Q93=213,
h_Q94=378,
h_Q95=587,
h_Q96=832,
h_Q97=1104,
h_Q98=1387,
h_Q99=1656,
h_Q100=1879,
h_Q101=2019,
h_Q102=2035,
h_Q103=1888,
h_Q104=1552,
h_Q105=1023,
h_Q106=331,
h_Q107=-449,
h_Q108=-1204,
h_Q109=-1785,
h_Q110=-2044,
h_Q111=-1871,
h_Q112=-1242,
h_Q113=-262,
h_Q114=832,
h_Q115=1710,
h_Q116=2046,
h_Q117=1656,
h_Q118=609,
h_Q119=-723,
h_Q120=-1773,
h_Q121=-2012,
h_Q122=-1242,
h_Q123=213,
h_Q124=1583,
h_Q125=2033,
h_Q126=1203,
h_Q127=-449,
h_Q128=-1819,
h_Q129=-1871,
h_Q130=-473,
h_Q131=1333,
h_Q132=2035,
h_Q133=939,
h_Q134=-1045,
h_Q135=-2047,
h_Q136=-1003,
h_Q137=1104,
h_Q138=2035,
h_Q139=677,
h_Q140=-1489,
h_Q141=-1871,
h_Q142=95,
h_Q143=1954,
h_Q144=1203,
h_Q145=-1223,
h_Q146=-1916,
h_Q147=213,
h_Q148=2030,
h_Q149=677,
h_Q150=-1773,
h_Q151=-1298,
h_Q152=1387,
h_Q153=1656,
h_Q154=-1045,
h_Q155=-1830,
h_Q156=832,
h_Q157=1888,
h_Q158=-789,
h_Q159=-1871,
h_Q160=918,
h_Q161=1760,
h_Q162=-1204,
h_Q163=-1506,
h_Q164=1583,
h_Q165=1023,
h_Q166=-1932,
h_Q167=-262,
h_Q168=2035,
h_Q169=-723,
h_Q170=-1642,
h_Q171=1656,
h_Q172=609,
h_Q173=-2045,
h_Q174=832,
h_Q175=1404,
h_Q176=-1932,
h_Q177=213,
h_Q178=1723,
h_Q179=-1785;






reg [width-1:0]data_I[1:180];
reg [width-1:0]data_Q[1:180];
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
	data_I[101]<=0;
	data_I[102]<=0;
	data_I[103]<=0;
	data_I[104]<=0;
	data_I[105]<=0;
	data_I[106]<=0;
	data_I[107]<=0;
	data_I[108]<=0;
	data_I[109]<=0;
	data_I[110]<=0;
	data_I[111]<=0;
	data_I[112]<=0;
	data_I[113]<=0;
	data_I[114]<=0;
	data_I[115]<=0;
	data_I[116]<=0;
	data_I[117]<=0;
	data_I[118]<=0;
	data_I[119]<=0;
	data_I[120]<=0;
	data_I[121]<=0;
	data_I[122]<=0;
	data_I[123]<=0;
	data_I[124]<=0;
	data_I[125]<=0;
	data_I[126]<=0;
	data_I[127]<=0;
	data_I[128]<=0;
	data_I[129]<=0;
	data_I[130]<=0;
	data_I[131]<=0;
	data_I[132]<=0;
	data_I[133]<=0;
	data_I[134]<=0;
	data_I[135]<=0;
	data_I[136]<=0;
	data_I[137]<=0;
	data_I[138]<=0;
	data_I[139]<=0;
	data_I[140]<=0;
	data_I[141]<=0;
	data_I[142]<=0;
	data_I[143]<=0;
	data_I[144]<=0;
	data_I[145]<=0;
	data_I[146]<=0;
	data_I[147]<=0;
	data_I[148]<=0;
	data_I[149]<=0;
	data_I[150]<=0;
	data_I[151]<=0;
	data_I[152]<=0;
	data_I[153]<=0;
	data_I[154]<=0;
	data_I[155]<=0;
	data_I[156]<=0;
	data_I[157]<=0;
	data_I[158]<=0;
	data_I[159]<=0;
	data_I[160]<=0;
	data_I[161]<=0;
	data_I[162]<=0;
	data_I[163]<=0;
	data_I[164]<=0;
	data_I[165]<=0;
	data_I[166]<=0;
	data_I[167]<=0;
	data_I[168]<=0;
	data_I[169]<=0;
	data_I[170]<=0;
	data_I[171]<=0;
	data_I[172]<=0;
	data_I[173]<=0;
	data_I[174]<=0;
	data_I[175]<=0;
	data_I[176]<=0;
	data_I[177]<=0;
	data_I[178]<=0;
	data_I[179]<=0;
	data_I[180]<=0;
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
	data_I[101]<=data_I[100];
	data_I[102]<=data_I[101];
	data_I[103]<=data_I[102];
	data_I[104]<=data_I[103];
	data_I[105]<=data_I[104];
	data_I[106]<=data_I[105];
	data_I[107]<=data_I[106];
	data_I[108]<=data_I[107];
	data_I[109]<=data_I[108];
	data_I[110]<=data_I[109];
	data_I[111]<=data_I[110];
	data_I[112]<=data_I[111];
	data_I[113]<=data_I[112];
	data_I[114]<=data_I[113];
	data_I[115]<=data_I[114];
	data_I[116]<=data_I[115];
	data_I[117]<=data_I[116];
	data_I[118]<=data_I[117];
	data_I[119]<=data_I[118];
	data_I[120]<=data_I[119];
	data_I[121]<=data_I[120];
	data_I[122]<=data_I[121];
	data_I[123]<=data_I[122];
	data_I[124]<=data_I[123];
	data_I[125]<=data_I[124];
	data_I[126]<=data_I[125];
	data_I[127]<=data_I[126];
	data_I[128]<=data_I[127];
	data_I[129]<=data_I[128];
	data_I[130]<=data_I[129];
	data_I[131]<=data_I[130];
	data_I[132]<=data_I[131];
	data_I[133]<=data_I[132];
	data_I[134]<=data_I[133];
	data_I[135]<=data_I[134];
	data_I[136]<=data_I[135];
	data_I[137]<=data_I[136];
	data_I[138]<=data_I[137];
	data_I[139]<=data_I[138];
	data_I[140]<=data_I[139];
	data_I[141]<=data_I[140];
	data_I[142]<=data_I[141];
	data_I[143]<=data_I[142];
	data_I[144]<=data_I[143];
	data_I[145]<=data_I[144];
	data_I[146]<=data_I[145];
	data_I[147]<=data_I[146];
	data_I[148]<=data_I[147];
	data_I[149]<=data_I[148];
	data_I[150]<=data_I[149];
	data_I[151]<=data_I[150];
	data_I[152]<=data_I[151];
	data_I[153]<=data_I[152];
	data_I[154]<=data_I[153];
	data_I[155]<=data_I[154];
	data_I[156]<=data_I[155];
	data_I[157]<=data_I[156];
	data_I[158]<=data_I[157];
	data_I[159]<=data_I[158];
	data_I[160]<=data_I[159];
	data_I[161]<=data_I[160];
	data_I[162]<=data_I[161];
	data_I[163]<=data_I[162];
	data_I[164]<=data_I[163];
	data_I[165]<=data_I[164];
	data_I[166]<=data_I[165];
	data_I[167]<=data_I[166];
	data_I[168]<=data_I[167];
	data_I[169]<=data_I[168];
	data_I[170]<=data_I[169];
	data_I[171]<=data_I[170];
	data_I[172]<=data_I[171];
	data_I[173]<=data_I[172];
	data_I[174]<=data_I[173];
	data_I[175]<=data_I[174];
	data_I[176]<=data_I[175];
	data_I[177]<=data_I[176];
	data_I[178]<=data_I[177];
	data_I[179]<=data_I[178];
	data_I[180]<=data_I[179];
	
end

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
	data_Q[101]<=0;
	data_Q[102]<=0;
	data_Q[103]<=0;
	data_Q[104]<=0;
	data_Q[105]<=0;
	data_Q[106]<=0;
	data_Q[107]<=0;
	data_Q[108]<=0;
	data_Q[109]<=0;
	data_Q[110]<=0;
	data_Q[111]<=0;
	data_Q[112]<=0;
	data_Q[113]<=0;
	data_Q[114]<=0;
	data_Q[115]<=0;
	data_Q[116]<=0;
	data_Q[117]<=0;
	data_Q[118]<=0;
	data_Q[119]<=0;
	data_Q[120]<=0;
	data_Q[121]<=0;
	data_Q[122]<=0;
	data_Q[123]<=0;
	data_Q[124]<=0;
	data_Q[125]<=0;
	data_Q[126]<=0;
	data_Q[127]<=0;
	data_Q[128]<=0;
	data_Q[129]<=0;
	data_Q[130]<=0;
	data_Q[131]<=0;
	data_Q[132]<=0;
	data_Q[133]<=0;
	data_Q[134]<=0;
	data_Q[135]<=0;
	data_Q[136]<=0;
	data_Q[137]<=0;
	data_Q[138]<=0;
	data_Q[139]<=0;
	data_Q[140]<=0;
	data_Q[141]<=0;
	data_Q[142]<=0;
	data_Q[143]<=0;
	data_Q[144]<=0;
	data_Q[145]<=0;
	data_Q[146]<=0;
	data_Q[147]<=0;
	data_Q[148]<=0;
	data_Q[149]<=0;
	data_Q[150]<=0;
	data_Q[151]<=0;
	data_Q[152]<=0;
	data_Q[153]<=0;
	data_Q[154]<=0;
	data_Q[155]<=0;
	data_Q[156]<=0;
	data_Q[157]<=0;
	data_Q[158]<=0;
	data_Q[159]<=0;
	data_Q[160]<=0;
	data_Q[161]<=0;
	data_Q[162]<=0;
	data_Q[163]<=0;
	data_Q[164]<=0;
	data_Q[165]<=0;
	data_Q[166]<=0;
	data_Q[167]<=0;
	data_Q[168]<=0;
	data_Q[169]<=0;
	data_Q[170]<=0;
	data_Q[171]<=0;
	data_Q[172]<=0;
	data_Q[173]<=0;
	data_Q[174]<=0;
	data_Q[175]<=0;
	data_Q[176]<=0;
	data_Q[177]<=0;
	data_Q[178]<=0;
	data_Q[179]<=0;
	data_Q[180]<=0;
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
	data_Q[101]<=data_Q[100];
	data_Q[102]<=data_Q[101];
	data_Q[103]<=data_Q[102];
	data_Q[104]<=data_Q[103];
	data_Q[105]<=data_Q[104];
	data_Q[106]<=data_Q[105];
	data_Q[107]<=data_Q[106];
	data_Q[108]<=data_Q[107];
	data_Q[109]<=data_Q[108];
	data_Q[110]<=data_Q[109];
	data_Q[111]<=data_Q[110];
	data_Q[112]<=data_Q[111];
	data_Q[113]<=data_Q[112];
	data_Q[114]<=data_Q[113];
	data_Q[115]<=data_Q[114];
	data_Q[116]<=data_Q[115];
	data_Q[117]<=data_Q[116];
	data_Q[118]<=data_Q[117];
	data_Q[119]<=data_Q[118];
	data_Q[120]<=data_Q[119];
	data_Q[121]<=data_Q[120];
	data_Q[122]<=data_Q[121];
	data_Q[123]<=data_Q[122];
	data_Q[124]<=data_Q[123];
	data_Q[125]<=data_Q[124];
	data_Q[126]<=data_Q[125];
	data_Q[127]<=data_Q[126];
	data_Q[128]<=data_Q[127];
	data_Q[129]<=data_Q[128];
	data_Q[130]<=data_Q[129];
	data_Q[131]<=data_Q[130];
	data_Q[132]<=data_Q[131];
	data_Q[133]<=data_Q[132];
	data_Q[134]<=data_Q[133];
	data_Q[135]<=data_Q[134];
	data_Q[136]<=data_Q[135];
	data_Q[137]<=data_Q[136];
	data_Q[138]<=data_Q[137];
	data_Q[139]<=data_Q[138];
	data_Q[140]<=data_Q[139];
	data_Q[141]<=data_Q[140];
	data_Q[142]<=data_Q[141];
	data_Q[143]<=data_Q[142];
	data_Q[144]<=data_Q[143];
	data_Q[145]<=data_Q[144];
	data_Q[146]<=data_Q[145];
	data_Q[147]<=data_Q[146];
	data_Q[148]<=data_Q[147];
	data_Q[149]<=data_Q[148];
	data_Q[150]<=data_Q[149];
	data_Q[151]<=data_Q[150];
	data_Q[152]<=data_Q[151];
	data_Q[153]<=data_Q[152];
	data_Q[154]<=data_Q[153];
	data_Q[155]<=data_Q[154];
	data_Q[156]<=data_Q[155];
	data_Q[157]<=data_Q[156];
	data_Q[158]<=data_Q[157];
	data_Q[159]<=data_Q[158];
	data_Q[160]<=data_Q[159];
	data_Q[161]<=data_Q[160];
	data_Q[162]<=data_Q[161];
	data_Q[163]<=data_Q[162];
	data_Q[164]<=data_Q[163];
	data_Q[165]<=data_Q[164];
	data_Q[166]<=data_Q[165];
	data_Q[167]<=data_Q[166];
	data_Q[168]<=data_Q[167];
	data_Q[169]<=data_Q[168];
	data_Q[170]<=data_Q[169];
	data_Q[171]<=data_Q[170];
	data_Q[172]<=data_Q[171];
	data_Q[173]<=data_Q[172];
	data_Q[174]<=data_Q[173];
	data_Q[175]<=data_Q[174];
	data_Q[176]<=data_Q[175];
	data_Q[177]<=data_Q[176];
	data_Q[178]<=data_Q[177];
	data_Q[179]<=data_Q[178];
	data_Q[180]<=data_Q[179];
	
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
		$signed(data_I[1 ])*h_I0    +$signed(data_Q[1 ])*h_Q0   +
		$signed(data_I[2 ])*h_I1    +$signed(data_Q[2 ])*h_Q1   +
		$signed(data_I[3 ])*h_I2    +$signed(data_Q[3 ])*h_Q2   +
		$signed(data_I[4 ])*h_I3    +$signed(data_Q[4 ])*h_Q3   +
		$signed(data_I[5 ])*h_I4    +$signed(data_Q[5 ])*h_Q4   +
		$signed(data_I[6 ])*h_I5    +$signed(data_Q[6 ])*h_Q5   +
		$signed(data_I[7 ])*h_I6    +$signed(data_Q[7 ])*h_Q6   +
		$signed(data_I[8 ])*h_I7    +$signed(data_Q[8 ])*h_Q7   +
		$signed(data_I[9 ])*h_I8    +$signed(data_Q[9 ])*h_Q8   +
		$signed(data_I[10])*h_I9    +$signed(data_Q[10])*h_Q9   +
		$signed(data_I[11])*h_I10   +$signed(data_Q[11])*h_Q10  +
		$signed(data_I[12])*h_I11   +$signed(data_Q[12])*h_Q11  +
		$signed(data_I[13])*h_I12   +$signed(data_Q[13])*h_Q12  +
		$signed(data_I[14])*h_I13   +$signed(data_Q[14])*h_Q13  +
		$signed(data_I[15])*h_I14   +$signed(data_Q[15])*h_Q14  +
		$signed(data_I[16])*h_I15   +$signed(data_Q[16])*h_Q15  +
		$signed(data_I[17])*h_I16   +$signed(data_Q[17])*h_Q16  +
		$signed(data_I[18])*h_I17   +$signed(data_Q[18])*h_Q17  +
		$signed(data_I[19])*h_I18   +$signed(data_Q[19])*h_Q18  +
		$signed(data_I[20])*h_I19   +$signed(data_Q[20])*h_Q19  +
		$signed(data_I[21])*h_I20   +$signed(data_Q[21])*h_Q20  +
		$signed(data_I[22])*h_I21   +$signed(data_Q[22])*h_Q21  +
		$signed(data_I[23])*h_I22   +$signed(data_Q[23])*h_Q22  +
		$signed(data_I[24])*h_I23   +$signed(data_Q[24])*h_Q23  +
		$signed(data_I[25])*h_I24   +$signed(data_Q[25])*h_Q24  +
		$signed(data_I[26])*h_I25   +$signed(data_Q[26])*h_Q25  +
		$signed(data_I[27])*h_I26   +$signed(data_Q[27])*h_Q26  +
		$signed(data_I[28])*h_I27   +$signed(data_Q[28])*h_Q27  +
		$signed(data_I[29])*h_I28   +$signed(data_Q[29])*h_Q28  +
		$signed(data_I[30])*h_I29   +$signed(data_Q[30])*h_Q29  +
		$signed(data_I[31])*h_I30   +$signed(data_Q[31])*h_Q30  +
		$signed(data_I[32])*h_I31   +$signed(data_Q[32])*h_Q31  +
		$signed(data_I[33])*h_I32   +$signed(data_Q[33])*h_Q32  +
		$signed(data_I[34])*h_I33   +$signed(data_Q[34])*h_Q33  +
		$signed(data_I[35])*h_I34   +$signed(data_Q[35])*h_Q34  +
		$signed(data_I[36])*h_I35   +$signed(data_Q[36])*h_Q35  +
		$signed(data_I[37])*h_I36   +$signed(data_Q[37])*h_Q36  +
		$signed(data_I[38])*h_I37   +$signed(data_Q[38])*h_Q37  +
		$signed(data_I[39])*h_I38   +$signed(data_Q[39])*h_Q38  +
		$signed(data_I[40])*h_I39   +$signed(data_Q[40])*h_Q39  +
		$signed(data_I[41])*h_I40   +$signed(data_Q[41])*h_Q40  +
		$signed(data_I[42])*h_I41   +$signed(data_Q[42])*h_Q41  +
		$signed(data_I[43])*h_I42   +$signed(data_Q[43])*h_Q42  +
		$signed(data_I[44])*h_I43   +$signed(data_Q[44])*h_Q43  +
		$signed(data_I[45])*h_I44   +$signed(data_Q[45])*h_Q44  +
		$signed(data_I[46])*h_I45   +$signed(data_Q[46])*h_Q45  +
		$signed(data_I[47])*h_I46   +$signed(data_Q[47])*h_Q46  +
		$signed(data_I[48])*h_I47   +$signed(data_Q[48])*h_Q47  +
		$signed(data_I[49])*h_I48   +$signed(data_Q[49])*h_Q48  +
		$signed(data_I[50])*h_I49   +$signed(data_Q[50])*h_Q49  +
		$signed(data_I[51])*h_I50   +$signed(data_Q[51])*h_Q50  +
		$signed(data_I[52])*h_I51   +$signed(data_Q[52])*h_Q51  +
		$signed(data_I[53])*h_I52   +$signed(data_Q[53])*h_Q52  +
		$signed(data_I[54])*h_I53   +$signed(data_Q[54])*h_Q53  +
		$signed(data_I[55])*h_I54   +$signed(data_Q[55])*h_Q54  +
		$signed(data_I[56])*h_I55   +$signed(data_Q[56])*h_Q55  +
		$signed(data_I[57])*h_I56   +$signed(data_Q[57])*h_Q56  +
		$signed(data_I[58])*h_I57   +$signed(data_Q[58])*h_Q57  +
		$signed(data_I[59])*h_I58   +$signed(data_Q[59])*h_Q58  +
		$signed(data_I[60])*h_I59   +$signed(data_Q[60])*h_Q59  +
		$signed(data_I[61])*h_I60   +$signed(data_Q[61])*h_Q60  +
		$signed(data_I[62])*h_I61   +$signed(data_Q[62])*h_Q61  +
		$signed(data_I[63])*h_I62   +$signed(data_Q[63])*h_Q62  +
		$signed(data_I[64])*h_I63   +$signed(data_Q[64])*h_Q63  +
		$signed(data_I[65])*h_I64   +$signed(data_Q[65])*h_Q64  +
		$signed(data_I[66])*h_I65   +$signed(data_Q[66])*h_Q65  +
		$signed(data_I[67])*h_I66   +$signed(data_Q[67])*h_Q66  +
		$signed(data_I[68])*h_I67   +$signed(data_Q[68])*h_Q67  +
		$signed(data_I[69])*h_I68   +$signed(data_Q[69])*h_Q68  +
		$signed(data_I[70])*h_I69   +$signed(data_Q[70])*h_Q69  +
		$signed(data_I[71])*h_I70   +$signed(data_Q[71])*h_Q70  +
		$signed(data_I[72])*h_I71   +$signed(data_Q[72])*h_Q71  +
		$signed(data_I[73])*h_I72   +$signed(data_Q[73])*h_Q72  +
		$signed(data_I[74])*h_I73   +$signed(data_Q[74])*h_Q73  +
		$signed(data_I[75])*h_I74   +$signed(data_Q[75])*h_Q74  +
		$signed(data_I[76])*h_I75   +$signed(data_Q[76])*h_Q75  +
		$signed(data_I[77])*h_I76   +$signed(data_Q[77])*h_Q76  +
		$signed(data_I[78])*h_I77   +$signed(data_Q[78])*h_Q77  +
		$signed(data_I[79])*h_I78   +$signed(data_Q[79])*h_Q78  +
		$signed(data_I[80])*h_I79   +$signed(data_Q[80])*h_Q79  +
		$signed(data_I[81])*h_I80   +$signed(data_Q[81])*h_Q80  +
		$signed(data_I[82])*h_I81   +$signed(data_Q[82])*h_Q81  +
		$signed(data_I[83])*h_I82   +$signed(data_Q[83])*h_Q82  +
		$signed(data_I[84])*h_I83   +$signed(data_Q[84])*h_Q83  +
		$signed(data_I[85])*h_I84   +$signed(data_Q[85])*h_Q84  +
		$signed(data_I[86])*h_I85   +$signed(data_Q[86])*h_Q85  +
		$signed(data_I[87])*h_I86   +$signed(data_Q[87])*h_Q86  +
		$signed(data_I[88])*h_I87   +$signed(data_Q[88])*h_Q87  +
		$signed(data_I[89])*h_I88   +$signed(data_Q[89])*h_Q88  +
		$signed(data_I[90])*h_I89   +$signed(data_Q[90])*h_Q89  +
		$signed(data_I[91])*h_I90   +$signed(data_Q[91])*h_Q90  +
		$signed(data_I[92])*h_I91   +$signed(data_Q[92])*h_Q91  +
		$signed(data_I[93])*h_I92   +$signed(data_Q[93])*h_Q92  +
		$signed(data_I[94])*h_I93   +$signed(data_Q[94])*h_Q93  +
		$signed(data_I[95])*h_I94   +$signed(data_Q[95])*h_Q94  +	                   
		$signed(data_I[96])*h_I95   +$signed(data_Q[96])*h_Q95  +
		$signed(data_I[97])*h_I96   +$signed(data_Q[97])*h_Q96  +
		$signed(data_I[98])*h_I97   +$signed(data_Q[98])*h_Q97  +
		$signed(data_I[99])*h_I98   +$signed(data_Q[99])*h_Q98  +
		$signed(data_I[100])*h_I99  +$signed(data_Q[100])*h_Q99+
		$signed(data_I[101])*h_I100 +$signed(data_Q[101])*h_Q100+
		$signed(data_I[102])*h_I101 +$signed(data_Q[102])*h_Q101+
		$signed(data_I[103])*h_I102 +$signed(data_Q[103])*h_Q102+
		$signed(data_I[104])*h_I103 +$signed(data_Q[104])*h_Q103+
		$signed(data_I[105])*h_I104 +$signed(data_Q[105])*h_Q104+
		$signed(data_I[106])*h_I105 +$signed(data_Q[106])*h_Q105+
		$signed(data_I[107])*h_I106 +$signed(data_Q[107])*h_Q106+
		$signed(data_I[108])*h_I107 +$signed(data_Q[108])*h_Q107+
		$signed(data_I[109])*h_I108 +$signed(data_Q[109])*h_Q108+
		$signed(data_I[110])*h_I109 +$signed(data_Q[110])*h_Q109+
		$signed(data_I[111])*h_I110 +$signed(data_Q[111])*h_Q110 +
		$signed(data_I[112])*h_I111 +$signed(data_Q[112])*h_Q111 +
		$signed(data_I[113])*h_I112 +$signed(data_Q[113])*h_Q112 +
		$signed(data_I[114])*h_I113 +$signed(data_Q[114])*h_Q113 +
		$signed(data_I[115])*h_I114 +$signed(data_Q[115])*h_Q114 +
		$signed(data_I[116])*h_I115 +$signed(data_Q[116])*h_Q115 +
		$signed(data_I[117])*h_I116 +$signed(data_Q[117])*h_Q116 +
		$signed(data_I[118])*h_I117 +$signed(data_Q[118])*h_Q117 +
		$signed(data_I[119])*h_I118 +$signed(data_Q[119])*h_Q118 +
		$signed(data_I[120])*h_I119 +$signed(data_Q[120])*h_Q119 +
		$signed(data_I[121])*h_I120 +$signed(data_Q[121])*h_Q120 +
		$signed(data_I[122])*h_I121 +$signed(data_Q[122])*h_Q121 +
		$signed(data_I[123])*h_I122 +$signed(data_Q[123])*h_Q122 +
		$signed(data_I[124])*h_I123 +$signed(data_Q[124])*h_Q123 +
		$signed(data_I[125])*h_I124 +$signed(data_Q[125])*h_Q124 +
		$signed(data_I[126])*h_I125 +$signed(data_Q[126])*h_Q125 +
		$signed(data_I[127])*h_I126 +$signed(data_Q[127])*h_Q126 +
		$signed(data_I[128])*h_I127 +$signed(data_Q[128])*h_Q127 +
		$signed(data_I[129])*h_I128 +$signed(data_Q[129])*h_Q128 +
		$signed(data_I[130])*h_I129 +$signed(data_Q[130])*h_Q129 +
		$signed(data_I[131])*h_I130 +$signed(data_Q[131])*h_Q130 +
		$signed(data_I[132])*h_I131 +$signed(data_Q[132])*h_Q131 +
		$signed(data_I[133])*h_I132 +$signed(data_Q[133])*h_Q132 +
		$signed(data_I[134])*h_I133 +$signed(data_Q[134])*h_Q133 +
		$signed(data_I[135])*h_I134 +$signed(data_Q[135])*h_Q134 +
		$signed(data_I[136])*h_I135 +$signed(data_Q[136])*h_Q135 +
		$signed(data_I[137])*h_I136 +$signed(data_Q[137])*h_Q136 +
		$signed(data_I[138])*h_I137 +$signed(data_Q[138])*h_Q137 +
		$signed(data_I[139])*h_I138 +$signed(data_Q[139])*h_Q138 +
		$signed(data_I[140])*h_I139 +$signed(data_Q[140])*h_Q139 +
		$signed(data_I[141])*h_I140 +$signed(data_Q[141])*h_Q140 +
		$signed(data_I[142])*h_I141 +$signed(data_Q[142])*h_Q141 +
		$signed(data_I[143])*h_I142 +$signed(data_Q[143])*h_Q142 +
		$signed(data_I[144])*h_I143 +$signed(data_Q[144])*h_Q143 +
		$signed(data_I[145])*h_I144 +$signed(data_Q[145])*h_Q144 +
		$signed(data_I[146])*h_I145 +$signed(data_Q[146])*h_Q145 +
		$signed(data_I[147])*h_I146 +$signed(data_Q[147])*h_Q146 +
		$signed(data_I[148])*h_I147 +$signed(data_Q[148])*h_Q147 +
		$signed(data_I[149])*h_I148 +$signed(data_Q[149])*h_Q148 +
		$signed(data_I[150])*h_I149 +$signed(data_Q[150])*h_Q149 +
		$signed(data_I[151])*h_I150 +$signed(data_Q[151])*h_Q150 +
		$signed(data_I[152])*h_I151 +$signed(data_Q[152])*h_Q151 +
		$signed(data_I[153])*h_I152 +$signed(data_Q[153])*h_Q152 +
		$signed(data_I[154])*h_I153 +$signed(data_Q[154])*h_Q153 +
		$signed(data_I[155])*h_I154 +$signed(data_Q[155])*h_Q154 +
		$signed(data_I[156])*h_I155 +$signed(data_Q[156])*h_Q155 +
		$signed(data_I[157])*h_I156 +$signed(data_Q[157])*h_Q156 +
		$signed(data_I[158])*h_I157 +$signed(data_Q[158])*h_Q157 +
		$signed(data_I[159])*h_I158 +$signed(data_Q[159])*h_Q158 +
		$signed(data_I[160])*h_I159 +$signed(data_Q[160])*h_Q159 +
		$signed(data_I[161])*h_I160 +$signed(data_Q[161])*h_Q160 +
		$signed(data_I[162])*h_I161 +$signed(data_Q[162])*h_Q161 +
		$signed(data_I[163])*h_I162 +$signed(data_Q[163])*h_Q162 +
		$signed(data_I[164])*h_I163 +$signed(data_Q[164])*h_Q163 +
		$signed(data_I[165])*h_I164 +$signed(data_Q[165])*h_Q164 +
		$signed(data_I[166])*h_I165 +$signed(data_Q[166])*h_Q165 +
		$signed(data_I[167])*h_I166 +$signed(data_Q[167])*h_Q166 +
		$signed(data_I[168])*h_I167 +$signed(data_Q[168])*h_Q167 +
		$signed(data_I[169])*h_I168 +$signed(data_Q[169])*h_Q168 +
		$signed(data_I[170])*h_I169 +$signed(data_Q[170])*h_Q169 +
		$signed(data_I[171])*h_I170 +$signed(data_Q[171])*h_Q170 +
		$signed(data_I[172])*h_I171 +$signed(data_Q[172])*h_Q171 +
		$signed(data_I[173])*h_I172 +$signed(data_Q[173])*h_Q172 +
		$signed(data_I[174])*h_I173 +$signed(data_Q[174])*h_Q173 +
		$signed(data_I[175])*h_I174 +$signed(data_Q[175])*h_Q174 +
		$signed(data_I[176])*h_I175 +$signed(data_Q[176])*h_Q175 +
		$signed(data_I[177])*h_I176 +$signed(data_Q[177])*h_Q176 +
		$signed(data_I[178])*h_I177 +$signed(data_Q[178])*h_Q177 +
		$signed(data_I[179])*h_I178 +$signed(data_Q[179])*h_Q178 +
		$signed(data_I[180])*h_I179 +$signed(data_Q[180])*h_Q179 ;		
end
always@(posedge clk)
begin
if(!rst)
	PC_Q_temp<=0;
else
	PC_Q_temp<=
		-$signed(data_I[1 ])*h_Q0     +$signed(data_Q[1 ])*h_I0  
		-$signed(data_I[2 ])*h_Q1     +$signed(data_Q[2 ])*h_I1  
		-$signed(data_I[3 ])*h_Q2     +$signed(data_Q[3 ])*h_I2  
		-$signed(data_I[4 ])*h_Q3     +$signed(data_Q[4 ])*h_I3  
		-$signed(data_I[5 ])*h_Q4     +$signed(data_Q[5 ])*h_I4  
		-$signed(data_I[6 ])*h_Q5     +$signed(data_Q[6 ])*h_I5  
		-$signed(data_I[7 ])*h_Q6     +$signed(data_Q[7 ])*h_I6  
		-$signed(data_I[8 ])*h_Q7     +$signed(data_Q[8 ])*h_I7  
		-$signed(data_I[9 ])*h_Q8     +$signed(data_Q[9 ])*h_I8  
		-$signed(data_I[10])*h_Q9     +$signed(data_Q[10])*h_I9  
		-$signed(data_I[11])*h_Q10    +$signed(data_Q[11])*h_I10 
		-$signed(data_I[12])*h_Q11    +$signed(data_Q[12])*h_I11 
		-$signed(data_I[13])*h_Q12    +$signed(data_Q[13])*h_I12 
		-$signed(data_I[14])*h_Q13    +$signed(data_Q[14])*h_I13 
		-$signed(data_I[15])*h_Q14    +$signed(data_Q[15])*h_I14 
		-$signed(data_I[16])*h_Q15    +$signed(data_Q[16])*h_I15 
		-$signed(data_I[17])*h_Q16    +$signed(data_Q[17])*h_I16 
		-$signed(data_I[18])*h_Q17    +$signed(data_Q[18])*h_I17 
		-$signed(data_I[19])*h_Q18    +$signed(data_Q[19])*h_I18 
		-$signed(data_I[20])*h_Q19    +$signed(data_Q[20])*h_I19 
		-$signed(data_I[21])*h_Q20    +$signed(data_Q[21])*h_I20 
		-$signed(data_I[22])*h_Q21    +$signed(data_Q[22])*h_I21 
		-$signed(data_I[23])*h_Q22    +$signed(data_Q[23])*h_I22 
		-$signed(data_I[24])*h_Q23    +$signed(data_Q[24])*h_I23 
		-$signed(data_I[25])*h_Q24    +$signed(data_Q[25])*h_I24 
		-$signed(data_I[26])*h_Q25    +$signed(data_Q[26])*h_I25 
		-$signed(data_I[27])*h_Q26    +$signed(data_Q[27])*h_I26 
		-$signed(data_I[28])*h_Q27    +$signed(data_Q[28])*h_I27 
		-$signed(data_I[29])*h_Q28    +$signed(data_Q[29])*h_I28 
		-$signed(data_I[30])*h_Q29    +$signed(data_Q[30])*h_I29 
		-$signed(data_I[31])*h_Q30    +$signed(data_Q[31])*h_I30 
		-$signed(data_I[32])*h_Q31    +$signed(data_Q[32])*h_I31 
		-$signed(data_I[33])*h_Q32    +$signed(data_Q[33])*h_I32 
		-$signed(data_I[34])*h_Q33    +$signed(data_Q[34])*h_I33 
		-$signed(data_I[35])*h_Q34    +$signed(data_Q[35])*h_I34 
		-$signed(data_I[36])*h_Q35    +$signed(data_Q[36])*h_I35 
		-$signed(data_I[37])*h_Q36    +$signed(data_Q[37])*h_I36 
		-$signed(data_I[38])*h_Q37    +$signed(data_Q[38])*h_I37 
		-$signed(data_I[39])*h_Q38    +$signed(data_Q[39])*h_I38 
		-$signed(data_I[40])*h_Q39    +$signed(data_Q[40])*h_I39 
		-$signed(data_I[41])*h_Q40    +$signed(data_Q[41])*h_I40 
		-$signed(data_I[42])*h_Q41    +$signed(data_Q[42])*h_I41 
		-$signed(data_I[43])*h_Q42    +$signed(data_Q[43])*h_I42 
		-$signed(data_I[44])*h_Q43    +$signed(data_Q[44])*h_I43 
		-$signed(data_I[45])*h_Q44    +$signed(data_Q[45])*h_I44 
		-$signed(data_I[46])*h_Q45    +$signed(data_Q[46])*h_I45 
		-$signed(data_I[47])*h_Q46    +$signed(data_Q[47])*h_I46 
		-$signed(data_I[48])*h_Q47    +$signed(data_Q[48])*h_I47 
		-$signed(data_I[49])*h_Q48    +$signed(data_Q[49])*h_I48 
		-$signed(data_I[50])*h_Q49    +$signed(data_Q[50])*h_I49 
		-$signed(data_I[51])*h_Q50    +$signed(data_Q[51])*h_I50 
		-$signed(data_I[52])*h_Q51    +$signed(data_Q[52])*h_I51 
		-$signed(data_I[53])*h_Q52    +$signed(data_Q[53])*h_I52 
		-$signed(data_I[54])*h_Q53    +$signed(data_Q[54])*h_I53 
		-$signed(data_I[55])*h_Q54    +$signed(data_Q[55])*h_I54 
		-$signed(data_I[56])*h_Q55    +$signed(data_Q[56])*h_I55 
		-$signed(data_I[57])*h_Q56    +$signed(data_Q[57])*h_I56 
		-$signed(data_I[58])*h_Q57    +$signed(data_Q[58])*h_I57 
		-$signed(data_I[59])*h_Q58    +$signed(data_Q[59])*h_I58 
		-$signed(data_I[60])*h_Q59    +$signed(data_Q[60])*h_I59 
		-$signed(data_I[61])*h_Q60    +$signed(data_Q[61])*h_I60 
		-$signed(data_I[62])*h_Q61    +$signed(data_Q[62])*h_I61 
		-$signed(data_I[63])*h_Q62    +$signed(data_Q[63])*h_I62 
		-$signed(data_I[64])*h_Q63    +$signed(data_Q[64])*h_I63 
		-$signed(data_I[65])*h_Q64    +$signed(data_Q[65])*h_I64 
		-$signed(data_I[66])*h_Q65    +$signed(data_Q[66])*h_I65 
		-$signed(data_I[67])*h_Q66    +$signed(data_Q[67])*h_I66 
		-$signed(data_I[68])*h_Q67    +$signed(data_Q[68])*h_I67 
		-$signed(data_I[69])*h_Q68    +$signed(data_Q[69])*h_I68 
		-$signed(data_I[70])*h_Q69    +$signed(data_Q[70])*h_I69 
		-$signed(data_I[71])*h_Q70    +$signed(data_Q[71])*h_I70 
		-$signed(data_I[72])*h_Q71    +$signed(data_Q[72])*h_I71 
		-$signed(data_I[73])*h_Q72    +$signed(data_Q[73])*h_I72 
		-$signed(data_I[74])*h_Q73    +$signed(data_Q[74])*h_I73 
		-$signed(data_I[75])*h_Q74    +$signed(data_Q[75])*h_I74 
		-$signed(data_I[76])*h_Q75    +$signed(data_Q[76])*h_I75 
		-$signed(data_I[77])*h_Q76    +$signed(data_Q[77])*h_I76 
		-$signed(data_I[78])*h_Q77    +$signed(data_Q[78])*h_I77 
		-$signed(data_I[79])*h_Q78    +$signed(data_Q[79])*h_I78 
		-$signed(data_I[80])*h_Q79    +$signed(data_Q[80])*h_I79 
		-$signed(data_I[81])*h_Q80    +$signed(data_Q[81])*h_I80 
		-$signed(data_I[82])*h_Q81    +$signed(data_Q[82])*h_I81 
		-$signed(data_I[83])*h_Q82    +$signed(data_Q[83])*h_I82 
		-$signed(data_I[84])*h_Q83    +$signed(data_Q[84])*h_I83 
		-$signed(data_I[85])*h_Q84    +$signed(data_Q[85])*h_I84 
		-$signed(data_I[86])*h_Q85    +$signed(data_Q[86])*h_I85 
		-$signed(data_I[87])*h_Q86    +$signed(data_Q[87])*h_I86 
		-$signed(data_I[88])*h_Q87    +$signed(data_Q[88])*h_I87 
		-$signed(data_I[89])*h_Q88    +$signed(data_Q[89])*h_I88 
		-$signed(data_I[90])*h_Q89    +$signed(data_Q[90])*h_I89 
		-$signed(data_I[91])*h_Q90    +$signed(data_Q[91])*h_I90 
		-$signed(data_I[92])*h_Q91    +$signed(data_Q[92])*h_I91 
		-$signed(data_I[93])*h_Q92    +$signed(data_Q[93])*h_I92 
		-$signed(data_I[94])*h_Q93    +$signed(data_Q[94])*h_I93 
		-$signed(data_I[95])*h_Q94    +$signed(data_Q[95])*h_I94                    
		-$signed(data_I[96])*h_Q95    +$signed(data_Q[96])*h_I95 
		-$signed(data_I[97])*h_Q96    +$signed(data_Q[97])*h_I96 
		-$signed(data_I[98])*h_Q97    +$signed(data_Q[98])*h_I97 
		-$signed(data_I[99])*h_Q98    +$signed(data_Q[99])*h_I98 
		-$signed(data_I[100])*h_Q99   +$signed(data_Q[100])*h_I99 
		-$signed(data_I[101])*h_Q100  +$signed(data_Q[101])*h_I100  
		-$signed(data_I[102])*h_Q101  +$signed(data_Q[102])*h_I101  
		-$signed(data_I[103])*h_Q102  +$signed(data_Q[103])*h_I102  
		-$signed(data_I[104])*h_Q103  +$signed(data_Q[104])*h_I103  
		-$signed(data_I[105])*h_Q104  +$signed(data_Q[105])*h_I104  
		-$signed(data_I[106])*h_Q105  +$signed(data_Q[106])*h_I105  
		-$signed(data_I[107])*h_Q106  +$signed(data_Q[107])*h_I106  
		-$signed(data_I[108])*h_Q107  +$signed(data_Q[108])*h_I107  
		-$signed(data_I[109])*h_Q108  +$signed(data_Q[109])*h_I108  
		-$signed(data_I[110])*h_Q109  +$signed(data_Q[110])*h_I109  
		-$signed(data_I[111])*h_Q110  +$signed(data_Q[111])*h_I110 
		-$signed(data_I[112])*h_Q111  +$signed(data_Q[112])*h_I111 
		-$signed(data_I[113])*h_Q112  +$signed(data_Q[113])*h_I112 
		-$signed(data_I[114])*h_Q113  +$signed(data_Q[114])*h_I113 
		-$signed(data_I[115])*h_Q114  +$signed(data_Q[115])*h_I114 
		-$signed(data_I[116])*h_Q115  +$signed(data_Q[116])*h_I115 
		-$signed(data_I[117])*h_Q116  +$signed(data_Q[117])*h_I116 
		-$signed(data_I[118])*h_Q117  +$signed(data_Q[118])*h_I117 
		-$signed(data_I[119])*h_Q118  +$signed(data_Q[119])*h_I118 
		-$signed(data_I[120])*h_Q119  +$signed(data_Q[120])*h_I119 
		-$signed(data_I[121])*h_Q120  +$signed(data_Q[121])*h_I120 
		-$signed(data_I[122])*h_Q121  +$signed(data_Q[122])*h_I121 
		-$signed(data_I[123])*h_Q122  +$signed(data_Q[123])*h_I122 
		-$signed(data_I[124])*h_Q123  +$signed(data_Q[124])*h_I123 
		-$signed(data_I[125])*h_Q124  +$signed(data_Q[125])*h_I124 
		-$signed(data_I[126])*h_Q125  +$signed(data_Q[126])*h_I125 
		-$signed(data_I[127])*h_Q126  +$signed(data_Q[127])*h_I126 
		-$signed(data_I[128])*h_Q127  +$signed(data_Q[128])*h_I127 
		-$signed(data_I[129])*h_Q128  +$signed(data_Q[129])*h_I128 
		-$signed(data_I[130])*h_Q129  +$signed(data_Q[130])*h_I129 
		-$signed(data_I[131])*h_Q130  +$signed(data_Q[131])*h_I130 
		-$signed(data_I[132])*h_Q131  +$signed(data_Q[132])*h_I131 
		-$signed(data_I[133])*h_Q132  +$signed(data_Q[133])*h_I132 
		-$signed(data_I[134])*h_Q133  +$signed(data_Q[134])*h_I133 
		-$signed(data_I[135])*h_Q134  +$signed(data_Q[135])*h_I134 
		-$signed(data_I[136])*h_Q135  +$signed(data_Q[136])*h_I135 
		-$signed(data_I[137])*h_Q136  +$signed(data_Q[137])*h_I136 
		-$signed(data_I[138])*h_Q137  +$signed(data_Q[138])*h_I137 
		-$signed(data_I[139])*h_Q138  +$signed(data_Q[139])*h_I138 
		-$signed(data_I[140])*h_Q139  +$signed(data_Q[140])*h_I139 
		-$signed(data_I[141])*h_Q140  +$signed(data_Q[141])*h_I140 
		-$signed(data_I[142])*h_Q141  +$signed(data_Q[142])*h_I141 
		-$signed(data_I[143])*h_Q142  +$signed(data_Q[143])*h_I142 
		-$signed(data_I[144])*h_Q143  +$signed(data_Q[144])*h_I143 
		-$signed(data_I[145])*h_Q144  +$signed(data_Q[145])*h_I144 
		-$signed(data_I[146])*h_Q145  +$signed(data_Q[146])*h_I145 
		-$signed(data_I[147])*h_Q146  +$signed(data_Q[147])*h_I146 
		-$signed(data_I[148])*h_Q147  +$signed(data_Q[148])*h_I147 
		-$signed(data_I[149])*h_Q148  +$signed(data_Q[149])*h_I148 
		-$signed(data_I[150])*h_Q149  +$signed(data_Q[150])*h_I149 
		-$signed(data_I[151])*h_Q150  +$signed(data_Q[151])*h_I150 
		-$signed(data_I[152])*h_Q151  +$signed(data_Q[152])*h_I151 
		-$signed(data_I[153])*h_Q152  +$signed(data_Q[153])*h_I152 
		-$signed(data_I[154])*h_Q153  +$signed(data_Q[154])*h_I153 
		-$signed(data_I[155])*h_Q154  +$signed(data_Q[155])*h_I154 
		-$signed(data_I[156])*h_Q155  +$signed(data_Q[156])*h_I155 
		-$signed(data_I[157])*h_Q156  +$signed(data_Q[157])*h_I156 
		-$signed(data_I[158])*h_Q157  +$signed(data_Q[158])*h_I157 
		-$signed(data_I[159])*h_Q158  +$signed(data_Q[159])*h_I158 
		-$signed(data_I[160])*h_Q159  +$signed(data_Q[160])*h_I159 
		-$signed(data_I[161])*h_Q160  +$signed(data_Q[161])*h_I160 
		-$signed(data_I[162])*h_Q161  +$signed(data_Q[162])*h_I161 
		-$signed(data_I[163])*h_Q162  +$signed(data_Q[163])*h_I162 
		-$signed(data_I[164])*h_Q163  +$signed(data_Q[164])*h_I163 
		-$signed(data_I[165])*h_Q164  +$signed(data_Q[165])*h_I164 
		-$signed(data_I[166])*h_Q165  +$signed(data_Q[166])*h_I165 
		-$signed(data_I[167])*h_Q166  +$signed(data_Q[167])*h_I166 
		-$signed(data_I[168])*h_Q167  +$signed(data_Q[168])*h_I167 
		-$signed(data_I[169])*h_Q168  +$signed(data_Q[169])*h_I168 
		-$signed(data_I[170])*h_Q169  +$signed(data_Q[170])*h_I169 
		-$signed(data_I[171])*h_Q170  +$signed(data_Q[171])*h_I170 
		-$signed(data_I[172])*h_Q171  +$signed(data_Q[172])*h_I171 
		-$signed(data_I[173])*h_Q172  +$signed(data_Q[173])*h_I172 
		-$signed(data_I[174])*h_Q173  +$signed(data_Q[174])*h_I173 
		-$signed(data_I[175])*h_Q174  +$signed(data_Q[175])*h_I174 
		-$signed(data_I[176])*h_Q175  +$signed(data_Q[176])*h_I175 
		-$signed(data_I[177])*h_Q176  +$signed(data_Q[177])*h_I176 
		-$signed(data_I[178])*h_Q177  +$signed(data_Q[178])*h_I177 
		-$signed(data_I[179])*h_Q178  +$signed(data_Q[179])*h_I178 
		-$signed(data_I[180])*h_Q179  +$signed(data_Q[180])*h_I179 ;

end

assign pc_I=PC_I_temp;
assign pc_Q=PC_Q_temp;
always@(posedge clk)
begin
	pc_abs2=$signed(pc_I)*$signed(pc_I)+$signed(pc_Q)*$signed(pc_Q);
end

endmodule