# Radar Signal Generation and Processing Experiment
## UESTC KB516

本实验分FPGA和Matlab，共5个实验，最终还有一个课程设计。<br>
Matlab已实现所有要求。<br>
Modelisim实现时所有波形和Matlab中基本一致。<br>
SignalTap抓的有问题，没时间调了<br>
软件有问题，FIR IP Core 生成卡死，强制生成后，不会用Modelsim仿真此IP<br>
故程序中的FIR全是直接存储Matlab中的滤波器系数，然后做的卷积，有的文件写了上千行<br>
其中Modelsim仿真文件在Quartus II工程的simulation文件夹下，<br>
为了github上传方便，只保留了关键的代码文件<br>
