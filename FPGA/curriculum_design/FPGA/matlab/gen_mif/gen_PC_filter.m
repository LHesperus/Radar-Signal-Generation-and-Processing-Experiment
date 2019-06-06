clc
close all
clear
t=1/256:1/256:1;
a=(2^15-1)*sin(2*pi*t);
%% parameter
%len of LFM is 256
fc=30e6;
fc=0;
B=10e6;
fs=10e6;
T=6.4e-6;
%% gen baseband LFM signal
[IQ,t]=genLFM(fs,fc,B,T);           % generate LFM signal
I=real(IQ);
Q=imag(IQ);
%% quantizer

h=I;
h=h/max(abs(h));
h=h*(2^11-1);


fid = fopen('PC_I.txt','w');
for i=1:length(h)
  fprintf(fid,'%s','h_I');
  %fprintf(fid,'%d',63-i+1);
  fprintf(fid,'%d',i-1);
  fprintf(fid,'%s','=');
  fprintf(fid, '%d',h(i)-mod(h(i),1));  
  %fprintf(fid,'%f\n',h(i));
  fprintf(fid,'%s\n',',');
end


h=Q;
h=h/max(abs(h));
h=h*(2^11-1);
q = quantizer([12,0]);
y = num2hex(q,h); 

fid = fopen('PC_Q.txt','w');
for i=1:length(h)
  fprintf(fid,'%s','h_Q');
  %fprintf(fid,'%d',63-i+1);
  fprintf(fid,'%d',i-1);
  fprintf(fid,'%s','=');
  fprintf(fid, '%d',h(i)-mod(h(i),1));  
  %fprintf(fid,'%f\n',h(i));
  fprintf(fid,'%s\n',',');
end