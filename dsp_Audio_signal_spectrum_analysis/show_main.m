%% 简介 %%%%%%%%%%%%%%%%%%
% 微处理器与系统设计2___综合设计1
% 验证音频信号频谱仪的原理 
% 对于440HZ电话铃声信号的验证
% 武汉大学电子信息学院 卓工班
% 本科2016级      郭洋
% email: whu_guoyang@whu.edu.cn
%
%%%%%%%%%%%%%%%%%%%%%%%%

%% 初始化
clc
clear all

%% 读入音频数据
filename = './wav/sound-bell-440hz.wav';
[y,Fs] = audioread(filename);
y=y(:,1);
sound(y,Fs);
N=length(y);

%% 画出原始图像

figure('NumberTitle', 'off', 'Name', '原始信号');
plot(y);
title('原始信号波形','FontSize',16);
xlabel('采样点数/个','FontSize',12) ;ylabel('归一化幅度/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% wav-实际长度傅里叶变化
yfft = abs(fft(y)/N);
Ts=1/Fs;
t=Ts*(1:N);
yfft=yfft(1:N/2+1);
yfft(2:end-1) = 2*yfft(2:end-1);
F = Fs*(0:(N/2))/N;
figure('NumberTitle', 'off', 'Name', 'Audio_signal_spectrum_analysis');
plot(F,yfft);
title('FFT','FontSize',16);%axis([0,10000,0,0.015]);
xlabel('f/HZ','FontSize',12) ;ylabel('|fft(y)|','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on
