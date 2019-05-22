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
[xi,yi] = polyxpoly(f,20*log10(IQ_S),f,-3*ones(1,size(f,2))); % find -3dB
hold on;plot(f,-3*ones(1,size(f,2)));hold on;plot(xi,yi,'o')
str=[num2str(round(xi)) [',' ;','] num2str(round(yi))];
text(xi,yi-1,str) %Display -3dB coordinates

figure
subplot(2,1,1)
plot(f,angle(fftshift(fft(IQ)))./pi*180);xlabel('frequency/Hz');ylabel('angle(degree)')
subplot(2,1,2)
plot(f,unwrap(angle(fftshift(fft(IQ))))./pi*180);xlabel('frequency/Hz');ylabel('angle(degree)')
suptitle('Phase spectrum of LFM')

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

