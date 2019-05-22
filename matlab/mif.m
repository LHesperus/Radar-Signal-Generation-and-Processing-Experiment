clc
clear
t=1/256:1/256:1;
a=(2^14-1)*sin(2*pi*t);
q = quantizer([14,0]);
y = num2hex(q,a);                      %generate data
 
fid = fopen('data.mif','w');
fprintf(fid,'%s\n','DEPTH = 256;');
fprintf(fid,'%s\n','WIDTH = 14;');
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
   fprintf(fid, '%s\n',y(i,4));
end
fprintf(fid,'%s\n','END ;');
fclose(fid);
