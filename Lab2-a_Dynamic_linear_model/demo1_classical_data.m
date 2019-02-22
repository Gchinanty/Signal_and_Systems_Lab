%% 初始化
clc ;
clear all ;

%% 输入音频
Fs = 22050;
filename = 'clicks.wav';
[y,Fs] = audioread(filename);
y=y(:,1);

%% 原始图像
figure('NumberTitle', 'off', 'Name', 'Original_signal');
plot(y); % 绘制原波形图
title('原始音频信号-时域','FontSize',16);
xlabel('采样点/个','FontSize',12) ;ylabel('clicks.wav','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% 模型处理
save('clicks.mat','y');
mat=importdata('clicks.mat');
A=1:10:length(mat);
mat=mat(A);
N=length(mat);
 t = (0:N-1)'; % time
 %s, 不确定度, demo中为15100
 s = sqrt(1000);
 %模型误差矩阵，开平方
w123 = sqrt([755 755]);
out = dlmfit(mat,s,w123,[],[],[],struct('seas',0));

%% 平滑图像
figure('NumberTitle', 'off', 'Name', 'Signal_analysis_after_the_model');
dlmplotfit(out,t);
title('Smoothed-data','FontSize',16);
xlabel('采样点/个','FontSize',12) ;ylabel('clicks.wav','FontSize',12); axis([0,800,-0.5,0.5]);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% DLM残差估计自相关函数, 剩余残差的正常概率图
figure('NumberTitle', 'off', 'Name', 'Signal_analysis');
dlmplotdiag(out,t);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on
