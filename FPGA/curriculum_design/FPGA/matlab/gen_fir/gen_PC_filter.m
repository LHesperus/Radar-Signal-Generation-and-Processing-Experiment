clc
close all
clear

%% parameter
fc=0;
B=5e6;
fs=7.5e6;
T=24e-6;
D=1;
%% gen baseband LFM signal
[IQ,t]=genLFM(fs,fc,B,T);           % generate LFM signal
I=real(IQ);
Q=imag(IQ);
figure
subplot(2,1,1)
plot(I)
subplot(2,1,2)
plot(Q)
%% quantizer

h=I;
h=h/max(abs(h));
h=h*(2^11-1);


fid = fopen('PC_I.txt','w');
for i=1:D:length(h)
  fprintf(fid,'%s','h_I');
  %fprintf(fid,'%d',63-i+1);
  fprintf(fid,'%d',round((i-1)/D));
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
for i=1:D:length(h)
  fprintf(fid,'%s','h_Q');
  %fprintf(fid,'%d',63-i+1);
  fprintf(fid,'%d',round((i-1)/D));
  fprintf(fid,'%s','=');
  fprintf(fid, '%d',h(i)-mod(h(i),1));  
  %fprintf(fid,'%f\n',h(i));
  fprintf(fid,'%s\n',',');
end