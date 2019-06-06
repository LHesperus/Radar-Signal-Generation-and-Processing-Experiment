clc
clear all
close all

fc=30e6;
B=5e6;
fs=120e6;
T=24e-6;

[IQ,t]=genLFM(fs,fc,B,T);           % generate LFM signal
IQ=[IQ zeros(1,9*length(IQ))];
I=real(IQ);
Q=imag(IQ);
figure 
plot(I)


%% RECEIVE
%IQ=IQ(1:5:end); %15Mhz
%fs=24e6;
I=real(IQ);
Q=imag(IQ);
figure 
plot(I)

L=length(IQ);
t=(0:L-1)/(fs);

xc=cos(2*pi*fc*t);   %you can see xc=1, because 30/7.5=4
xs=-sin(2*pi*fc*t);
figure
plot(xc)


I_af_LO=I.*xc;
Q_af_LO=I.*xs;


figure
subplot(2,1,1)
plot(I_af_LO)

subplot(2,1,2)
plot(Q_af_LO)

Hd = lowpass63;
h=Hd.Numerator;

I_fil=conv(I_af_LO,h);
Q_fil=conv(Q_af_LO,h);
figure
subplot(2,1,1)
plot(I_fil)

subplot(2,1,2)
plot(Q_fil)

%Down Sample D=2,fs=7.5MHz
I_fil=I_fil(1:16:end);
Q_fil=Q_fil(1:16:end);
fs=7.5e6;


%% PC

[IQ,t]=genLFM(fs,0,B,T);
H_I=real(IQ);
H_Q=-imag(IQ);
figure
subplot(2,1,1)
plot(H_I)
subplot(2,1,2)
plot(H_Q)

I_PC=conv(I_fil,H_I)-conv(Q_fil,H_Q);
Q_PC=conv(I_fil,H_Q)+conv(Q_fil,H_I);
%I_PC=conv(I_fil,Q_fil)+conv(Q_fil,I_fil);
%Q_PC=-conv(I_fil,I_fil)+conv(Q_fil,I_fil);
figure
subplot(2,1,1)
plot(I_PC)
subplot(2,1,2)
plot(Q_PC)


PC_abs=abs(I_PC+Q_PC*j);
figure
subplot(2,1,1)
plot(10*log10(PC_abs))
subplot(2,1,2)
plot((PC_abs))