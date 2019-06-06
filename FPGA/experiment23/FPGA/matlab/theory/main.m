clc
clear all
close all

fc=10e6;
B=5e6;
fs=100e6;
T=10e-6;
D=10;
[IQ,t]=genLFM(fs,fc,B,T);           % generate LFM signal
%IQ=[IQ zeros(1,9*length(IQ))];
I=real(IQ);
Q=imag(IQ);
figure 
plot(t,I)
title('IF LFM')
xlabel('time/s')
axis([min(t) max(t) -1.5 1.5])

L=length(IQ);
t=(0:L-1)/(fs);
%fc=fc+ 234375;
xc=cos(2*pi*fc*t);
xs=-sin(2*pi*fc*t);
figure
plot(xc)


I_af_LO=I.*xc;
Q_af_LO=I.*xs;

figure
subplot(2,1,1)
plot(t,I_af_LO)
xlabel('time/s')
title('DDC I LFM before LPF')

subplot(2,1,2)
plot(t,Q_af_LO)
xlabel('time/s')
title('DDC Q LFM before LPF')

Hd = lowpass63;
h=Hd.Numerator;
figure
freqz(h)

I_fil=conv(I_af_LO,h);
Q_fil=conv(Q_af_LO,h);
I_fil=I_fil(1:D:end);
Q_fil=Q_fil(1:D:end);

figure
t=(0:length(I_fil)-1)/(fs/D);
subplot(2,1,1)
plot(t,I_fil)
xlabel('time/s')
title('DDC I out')
subplot(2,1,2)
plot(t,Q_fil)
xlabel('time/s')
title('DDC Q out')
%% PC

[IQ,t]=genLFM(fs/D,0,B,T);
H_I=real(IQ);
H_Q=-imag(IQ);
figure
subplot(2,1,1)
plot(t,H_I)
xlabel('time/s')
title('PC filter I')
subplot(2,1,2)
plot(t,H_Q)
xlabel('time/s')
title('PC filter Q')

I_PC=conv(I_fil,H_I)-conv(Q_fil,H_Q);
Q_PC=conv(I_fil,H_Q)+conv(Q_fil,H_I);
%I_PC=conv(I_fil,Q_fil)+conv(Q_fil,I_fil);
%Q_PC=-conv(I_fil,I_fil)+conv(Q_fil,I_fil);

figure
t=(0:length(I_PC)-1)/(fs/D);
subplot(2,1,1)
plot(t,I_PC)
xlabel('time/s')
title('PC I out')
subplot(2,1,2)
plot(t,Q_PC)
xlabel('time/s')
title('PC Q out')

figure
plot(t,abs(I_PC+Q_PC*j))
xlabel('time/s')
title('PC out')