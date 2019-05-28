module MTI#(parameter width=12)(
input clk,
input [width-1:0]signal_I,
input [width-1:0]signal_Q,
input rec_flag,
output reg [width-1:0]MTI_I_out,
output reg [width-1:0]MTI_Q_out,
output reg [4*width-1:0]pulse_acc,
output reg start_flag
);

parameter
n_LFM=64,
r_prf=8,
n_prf=16;

/*MTI*/
reg rec_flag_before;
always@(posedge clk)
begin
  rec_flag_before<=rec_flag;
end

reg [13:0]count_rec=0;
always@(posedge clk)
begin
  if(rec_flag!=rec_flag_before)
		count_rec<=0;
  else if(rec_flag==1'b1)
		count_rec<=count_rec+1'b1;
end


reg [width-1:0]rec_I[1:n_LFM*r_prf*n_prf];
reg [width-1:0]rec_Q[1:n_LFM*r_prf*n_prf];
always@(posedge clk)
begin
	if(rec_flag==1'b1)
		begin 
			rec_I[count_rec+1'b1]<=signal_I;
			rec_Q[count_rec+1'b1]<=signal_Q;
		end
end


always@(posedge clk)
begin
		if(count_rec==n_LFM*r_prf*2'd2)
			begin
				start_flag<=1'b1;
			end
		else if(count_rec==n_LFM*r_prf*n_prf-1'b1)
			start_flag<=0;
end

reg [width-1:0]MTI_I[1:n_LFM*r_prf*(n_prf-2)];
reg [width-1:0]MTI_Q[1:n_LFM*r_prf*(n_prf-2)];

always@(posedge clk)
begin
	if(start_flag==1'b1)
		begin
		MTI_I[count_rec-n_LFM*r_prf*2'd2]<=rec_I[count_rec]+rec_I[count_rec-2*n_LFM*r_prf]-2*rec_I[count_rec-n_LFM*r_prf];
		MTI_I_out<=rec_I[count_rec]+rec_I[count_rec-2*n_LFM*r_prf]-2*rec_I[count_rec+-n_LFM*r_prf];
		MTI_Q[count_rec-n_LFM*r_prf*2'd2]<=rec_Q[count_rec]+rec_Q[count_rec-2*n_LFM*r_prf]-2*rec_Q[count_rec-n_LFM*r_prf];
		MTI_Q_out<=rec_Q[count_rec]+rec_Q[count_rec-2*n_LFM*r_prf]-2*rec_Q[count_rec-n_LFM*r_prf];
		end
end




/*pulse accumulation*/
reg start_flag_temp;
always@(posedge clk)
begin
	start_flag_temp<=start_flag;
end

reg [5:0]count_pa;
always@(posedge clk)
begin
	if(start_flag!=start_flag && start_flag==0)
		count_pa<=0;
	else if(count_pa<=n_LFM*r_prf-1'b1)
		count_pa<=count_pa+1'b1;
end

//reg [2*width-1:0]p_acc_I[1:n_LFM];
//reg [2*width-1:0]p_acc_Q[1:n_LFM];
reg [2*width-1:0]p_acc_I;
reg [2*width-1:0]p_acc_Q;
always@(posedge clk)
begin
		p_acc_I<=
		MTI_I[count_pa+1'b1             ]+
		MTI_I[count_pa+1'b1+n_LFM*r_prf]+
		MTI_I[count_pa+1'b1+2*n_LFM*r_prf]+
		MTI_I[count_pa+1'b1+3*n_LFM*r_prf]+
		MTI_I[count_pa+1'b1+4*n_LFM*r_prf]+
		MTI_I[count_pa+1'b1+5*n_LFM*r_prf]+
		MTI_I[count_pa+1'b1+6*n_LFM*r_prf]+
		MTI_I[count_pa+1'b1+7*n_LFM*r_prf]+
		MTI_I[count_pa+1'b1+8*n_LFM*r_prf]+
		MTI_I[count_pa+1'b1+9*n_LFM*r_prf]+
		MTI_I[count_pa+1'b1+10*n_LFM*r_prf]+
		MTI_I[count_pa+1'b1+11*n_LFM*r_prf]+
		MTI_I[count_pa+1'b1+12*n_LFM*r_prf]+
		MTI_I[count_pa+1'b1+13*n_LFM*r_prf];

		
end

always@(posedge clk)
begin
		p_acc_Q<=
		MTI_Q[count_pa+1'b1             ]+
		MTI_Q[count_pa+1'b1+n_LFM*r_prf]+
		MTI_Q[count_pa+1'b1+2*n_LFM*r_prf]+
		MTI_Q[count_pa+1'b1+3*n_LFM*r_prf]+
		MTI_Q[count_pa+1'b1+4*n_LFM*r_prf]+
		MTI_Q[count_pa+1'b1+5*n_LFM*r_prf]+
		MTI_Q[count_pa+1'b1+6*n_LFM*r_prf]+
		MTI_Q[count_pa+1'b1+7*n_LFM*r_prf]+
		MTI_Q[count_pa+1'b1+8*n_LFM*r_prf]+
		MTI_Q[count_pa+1'b1+9*n_LFM*r_prf]+
		MTI_Q[count_pa+1'b1+10*n_LFM*r_prf]+
		MTI_Q[count_pa+1'b1+11*n_LFM*r_prf]+
		MTI_Q[count_pa+1'b1+12*n_LFM*r_prf]+
		MTI_Q[count_pa+1'b1+13*n_LFM*r_prf];
end

always@(posedge clk)
begin
	pulse_acc<=$signed(p_acc_I)*$signed(p_acc_I)+$signed(p_acc_Q)*$signed(p_acc_Q);
end
endmodule