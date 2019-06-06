clc
clear all
close all
Hd = lowpass63;
h=Hd.Numerator;
h=h/max(abs(h));
h=h*(2^11-1);
q = quantizer([12,0]);
y = num2hex(q,h); 

fid = fopen('fir64.txt','w');
for i=1:length(h)
  fprintf(fid,'%s','h');
  %fprintf(fid,'%d',63-i+1);
  fprintf(fid,'%d',i-1);
  fprintf(fid,'%s','=');
  fprintf(fid, '%d',h(i)-mod(h(i),1));  
  %fprintf(fid,'%f\n',h(i));
  fprintf(fid,'%s\n',',');
end