clc
close all
clear
%% parameter
%len of LFM is 256
fc=30e6;
B=10e6;
fs=80e6;
T=6.4e-6;
%% gen baseband LFM signal
[IQ,t]=genLFM(fs,fc,B,T);           % generate LFM signal
I=real(IQ);
I=[zeros(1,length(I)) I zeros(1,6*length(I))];
%% quantizer
width=12;
I=(2^(width-1)-1)*I;
plot(I)

q = quantizer([width,0]);
y = num2hex(q,I);                      %generate data
 
fid = fopen('IF_LFM.mif','w');
fprintf(fid,'%s\n','DEPTH = 4096;');
fprintf(fid,'%s\n','WIDTH = 12;');
fprintf(fid,'%s\n','ADDRESS_RADIX = HEX;');
fprintf(fid,'%s\n','DATA_RADIX = HEX;');
fprintf(fid,'%s\n\t','CONTENT');
fprintf(fid,'%s\n','BEGIN');
for i=1:length(I)
   fprintf(fid, '%04X',i-1);            %address
   fprintf(fid, '%s',' : '); 
   fprintf(fid, '%s',y(i,1));
   fprintf(fid, '%s',y(i,2));
   fprintf(fid, '%s',y(i,3));
   fprintf(fid, '%s\n',';');
   %fprintf(fid, '%s\n',y(i,4));
end
fprintf(fid,'%s\n','END ;');
fclose(fid);


%% gen doppler
IQ=[zeros(1,length(IQ)) IQ zeros(1,6*length(IQ))];
len_ex=length(I);
t=(0:len_ex-1)*fs;
j=sqrt(-1);
lambda=3e-2;
v=68000;
f_d=2*v/lambda; %Doppler freq
IQ=IQ.*exp(j*2*pi*f_d*t);


SNR=20;                        % The algorithm is effective when SNR greater than -10dB
IQ=awgn(IQ,SNR,'measured');

%% gen baseband LFM signal

I=real(IQ);
I=I./abs(max(I));
I=[zeros(1,length(I)) I zeros(1,6*length(I))];
figure
plot(I)
%% quantizer
width=12;
I=(2^(width-1)-1)*I;
plot(I)

q = quantizer([width,0]);
y = num2hex(q,I);                      %generate data
 
fid = fopen('Doppler_LFM.mif','w');
fprintf(fid,'%s\n','DEPTH = 4096;');
fprintf(fid,'%s\n','WIDTH = 12;');
fprintf(fid,'%s\n','ADDRESS_RADIX = HEX;');
fprintf(fid,'%s\n','DATA_RADIX = HEX;');
fprintf(fid,'%s\n\t','CONTENT');
fprintf(fid,'%s\n','BEGIN');
for i=1:length(I)
   fprintf(fid, '%04X',i-1);            %address
   fprintf(fid, '%s',' : '); 
   fprintf(fid, '%s',y(i,1));
   fprintf(fid, '%s',y(i,2));
   fprintf(fid, '%s',y(i,3));
   fprintf(fid, '%s\n',';');
   %fprintf(fid, '%s\n',y(i,4));
end
fprintf(fid,'%s\n','END ;');
fclose(fid);


%% lowpass filter
Hd = lowpass63;
h=Hd.Numerator;
hA=h(1:4:end);
hB=h(3:4:end);
hC=h(2:4:end);
hD=h(4:4:end);
freqz(Hd)

%% no-High efficiency DDC test
I_rec=I;
len_NCO=length(I_rec);
NCO_I=cos(2*pi*fc/fs*(0:len_NCO-1)); 
NCO_Q=-sin(2*pi*fc/fs*(0:len_NCO-1));
I_no_effi=NCO_I.*I_rec;
Q_no_effi=NCO_Q.*I_rec;
IQ_no_effi=I_no_effi+Q_no_effi*j;
IQ_no_effi=filter(Hd,IQ_no_effi);
figure
suptitle('no-High efficiency DDC,filter out')
subplot(2,1,1)
plot(real(IQ_no_effi));
subplot(2,1,2)
plot(imag(IQ_no_effi))

figure
plot(abs(fftshift(fft(IQ_no_effi))));
title('no-High efficiency DDC,Spectrum');

% Down sample
IQ_no_effi=IQ_no_effi(1:D:end);
t_D=t(1:D:end)/D;
f_D=f(1:D:end)/D;
figure
suptitle('no-High efficiency DDC,Down sampling out')
subplot(2,1,1)
plot(real(IQ_no_effi))
subplot(2,1,2)
plot(imag(IQ_no_effi))
figure
plot(f_D,abs(fftshift(fft(IQ_no_effi))))
title('no-High efficiency DDC,Down sampling Spectrum')