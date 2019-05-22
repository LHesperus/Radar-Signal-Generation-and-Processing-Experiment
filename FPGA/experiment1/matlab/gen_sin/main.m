clc
close all
clear
len=2048;
t=1/len:1/len:1;
a=sin(2*pi*t);


%% quantizer
width=12;
a=(2^(width-1)-1)*a;
plot(a)

q = quantizer([width,0]);
y = num2hex(q,a);                      %generate data
 
fid = fopen('NOC_sin.mif','w');
fprintf(fid,'%s\n','DEPTH = 2048;');
fprintf(fid,'%s\n','WIDTH = 12;');
fprintf(fid,'%s\n','ADDRESS_RADIX = HEX;');
fprintf(fid,'%s\n','DATA_RADIX = HEX;');
fprintf(fid,'%s\n\t','CONTENT');
fprintf(fid,'%s\n','BEGIN');
for i=1:length(a)
   fprintf(fid, '%04X',i-1);            %address
   fprintf(fid, '%s',' : '); 
   fprintf(fid, '%s',y(i,1));
   fprintf(fid, '%s',y(i,2));
   fprintf(fid, '%s',y(i,3));
   %fprintf(fid, '%s',y(i,4));
   fprintf(fid, '%s\n',';');
   %fprintf(fid, '%s\n',y(i,4));
end
fprintf(fid,'%s\n','END ;');
fclose(fid);



