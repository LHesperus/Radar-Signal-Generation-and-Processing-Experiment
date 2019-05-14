clc
close all
clear all
%% Parameter

B=5e6;                              %chirp frequency modulation bandwidth 
T=10e-6;                            % pulse duration time
fs=10e6;                            % sample frequency
%fs=20e6;
fc=0;                               % IF

%% gen baseband LFM signal
[IQ,t]=genLFM(fs,fc,B,T);
N=length(IQ);
I=real(IQ);
Q=imag(IQ);
figure
plot(t,I,'b')
hold on
plot(t,Q,'r')
xlabel('time/s')
zoom xon; grid on; 
legend('I','Q')
title('LFM baseband')

%%  plot spectrum
f=(-N/2:N/2-1)*(fs/N);
figure
IQ_S=abs(fftshift(fft(IQ)))/max(abs(fftshift(fft(IQ))));
plot(f,20*log10(IQ_S));title('Amplitude spectrum of LFM');xlabel('frequency/Hz');ylabel('Normalized amplitude(dB)')
figure
plot(f,angle(fftshift(fft(IQ)))./pi*180);title('Phase spectrum of LFM');xlabel('frequency/Hz');ylabel('angle(degree)')

%% Quantized
WIDTH=12;                                                    %Quantization Bits
WAVEDATA=fix(IQ*(2^(WIDTH-1)-1));                            %1 to max 
figure;
plot(t,real(WAVEDATA),'r');
hold on;
plot(t,imag(WAVEDATA),'b');
title('Quantized LFM');xlabel('time/s'); ylabel('Quantized Amplitude');
zoom xon; grid on; 
axis([min(t) max(t) -2^(WIDTH-1) 2^(WIDTH-1)]);
