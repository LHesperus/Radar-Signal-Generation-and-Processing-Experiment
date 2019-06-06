clc
clear all
close all

%%  IF LFM
fc=30e6;
B=5e6;
fs=120e6;
T=24e-6;

[IQ,t]=genLFM(fs,fc,B,T);            % generate LFM signal
I=real(IQ);
%I=[I zeros(1,9*length(I))];
I=[I zeros(1,1216)];                   %4096 points
figure
plot(I)

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


%% sin 
L=256;
t=(0:1/L:1);
I_LO=sin(2*pi*t);



%% quantizer
width=12;
I_LO=(2^(width-1)-1)*I_LO;
figure
plot(I_LO)

q = quantizer([width,0]);
y = num2hex(q,I_LO);                      %generate data
 
fid = fopen('sin_256.mif','w');
fprintf(fid,'%s\n','DEPTH = 256;');
fprintf(fid,'%s\n','WIDTH = 12;');
fprintf(fid,'%s\n','ADDRESS_RADIX = HEX;');
fprintf(fid,'%s\n','DATA_RADIX = HEX;');
fprintf(fid,'%s\n\t','CONTENT');
fprintf(fid,'%s\n','BEGIN');
for i=1:length(I_LO)
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
