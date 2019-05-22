%%
% fpass : lowpass filter pass freq,Hz
%f_order :butter filter order
% in :   IF signal
%a,b:    gain
%phase1¡¢2:phase deviation
%I¡¢Q :DDC output
function [I,Q,IQ_nco]=DDC_filter(fs,fc,fpass,f_order,in,a,b,phase1,phase2)
j=sqrt(-1);
len=size(in,2);
t=(0:len-1)/fs;
NCO_I=a*cos(2*pi*fc*t+phase1);
NCO_Q=-b*sin(2*pi*fc*t+phase2);
y_i=NCO_I.*in;
y_q=NCO_Q.*in;
IQ_nco=y_i+y_q*j;
%[b,a] = butter(f_order,2*fpass/fs,'low');
%figure
%freqz(b,a)
%I = filter(b,a,y_i);
%Q = filter(b,a,y_q);


filter_coff=fir1(f_order,2*fpass/fs);
I=conv(y_i,filter_coff);
I=I./max(abs(I));
I=I(length(filter_coff):end);
Q=conv(y_q,filter_coff);
Q=Q./max(abs(Q));
Q=Q(length(filter_coff):end);
freqz(filter_coff)
end