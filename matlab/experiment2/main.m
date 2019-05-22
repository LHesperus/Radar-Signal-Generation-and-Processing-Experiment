clc
close all
clear all
j=sqrt(-1);
%% Parameter
B=5e6;                              %chirp frequency modulation bandwidth 
T=10e-6;                            % pulse duration time
fs=120e6;                           % sample frequency
fc=15e6;                            % IF
%fc=0;

%% gen baseband LFM signal
[IQ,t]=genLFM(fs,fc,B,T);           % generate LFM signal
N=length(IQ);
I=real(IQ);
Q=imag(IQ);
figure
plot(t,I,'b')
hold on
plot(t,Q,'r')
xlabel('time/s')
zoom xon; grid on;
axis([min(t) max(t) 1.5*min([I Q]) 1.5*max([I Q])]) ;
legend('I','Q')
title('LFM IF')

%  plot spectrum
f=(-N/2:N/2-1)*(fs/N);
figure
IQ_S=abs(fftshift(fft(IQ)))/max(abs(fftshift(fft(IQ))));
plot(f,20*log10(IQ_S));
title('Amplitude spectrum of LFM (IF)');xlabel('frequency/Hz');ylabel('Normalized amplitude(dB)')
figure
plot(f,angle(fftshift(fft(IQ)))./pi*180);
title('Phase spectrum of LFM (IF)');xlabel('frequency/Hz');ylabel('angle(degree)')

% DDC (NCO  Lowpass Filter and Down sample)
f_nco=fc;                       % NCO frequency
D=10;                           %D Sampling ratio
f_order=63;                     % lowpass filter order
fpass=fc;                       % pass freq
[I_ddc,Q_ddc,IQ_NCO]=DDC_filter(fs,f_nco,fpass,f_order,I,1,1,0,0);
figure
subplot(2,1,1)
plot(t,real(IQ_NCO));xlabel('time/s');
subplot(2,1,2)
plot(t,imag(IQ_NCO));xlabel('time/s');
suptitle('LFM after NCO')

figure
subplot(2,1,1)
IQ_NCO_S=fftshift(fft(IQ_NCO));
plot(f,10*log10(abs(IQ_NCO_S)/max(abs(IQ_NCO_S))));
title('spectrum LFM after NCO');xlabel('frequency/Hz');ylabel('Normalized amplitude(dB)')
subplot(2,1,2)
IQ_DDC_S=fftshift(fft(I_ddc+Q_ddc*j));
plot(f,10*log10(abs(IQ_DDC_S)/max(abs(IQ_DDC_S))));
title('spectrum LFM after DDC');xlabel('frequency/Hz');ylabel('Normalized amplitude(dB)')

figure
plot(t,I_ddc,'b')
hold on
plot(t,Q_ddc,'r')
suptitle('LFM by DDC')
legend('I','Q')

IQ_ddc=I_ddc+Q_ddc*j;
IQ_D=IQ_ddc(1:D:end);

%% pulse compression(PC)
PC_fil=conj(IQ_D);                   % h of pulse compression
PC_out=conv(PC_fil,IQ_D);
PC_len=length(PC_out);
t = (-PC_len/2:(PC_len/2-1))/fs*D;
figure
plot(t,10*log10(abs(PC_out)/max(abs(PC_out))));
zoom xon; grid on; 
axis([min(t) max(t) -60 0]) 
title('Pulse Compression Result');xlabel('time/s');ylabel('Normalized amplitude(dB)')

figure
f=(-PC_len/2:PC_len/2-1)*(fs/D/PC_len);
plot(f,abs(fftshift(fft(PC_out))));
title('spectrum LFM after Pulse Compression');xlabel('frequency/Hz');ylabel('Normalized amplitude(dB)')
