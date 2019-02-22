%% 初始化
clc
clear all

%% 读入数据
filename = 'TV_noise.wav';
Fs = 10000;                     % 采样率10000HZ
Ts = 1/Fs;                        % 采样间隔

%% 抽取声道
[y,Fs] = audioread(filename);
%y=y(:,1);
y12=y(:,1); % 抽取第 1 声道

%% 音量标准化
y12m=max(max(y12),abs(min(y12))); % 找出极值
y=y12./y12m; % 归一化处理
N = length(y);               %采样数量为实际长度
t=(0:N-1)/Fs;                 % 计算数据时刻

%% 利用 FDATool 设计一个 bandpass-Butterworth 滤波器实现滤波300Hz-3000Hz
Y = doFilter(y12);

%% 原始音频信号-时域
figure('NumberTitle', 'off', 'Name', 'TV_signal_synthesis');
subplot(2,2,1);plot(t,y); % 绘制原波形图
title('原始音频信号-时域','FontSize',16);
xlabel('t/s','FontSize',12) ;ylabel('TV.wav/V','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% 中值滤波
Y = medfilt1(Y,20);% 20 points

%% 滤波音频信号-时域
subplot(2,2,3);plot(t,Y); % 绘制滤波波形图
title('滤波音频信号-时域','FontSize',16);
xlabel('t/s','FontSize',12) ;ylabel('TV.wav/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% 作傅里叶变换求原频谱
yf = abs(fft(y)/N);
yf=yf(1:N/2+1);
yf(2:end-1) = 2*yf(2:end-1); 

%% 作傅里叶变换求滤波后频谱
Yf = abs(fft(Y)/N);
Yf=Yf(1:N/2+1);
Yf(2:end-1) = 2*Yf(2:end-1); 

%% 原始音频信号-频域
f = Fs*(0:N/2)/N;
subplot(2,2,2);plot(f,yf); % 绘制原波形频谱图
title('原始音频信号-频域','FontSize',16);
xlabel('f/HZ','FontSize',12) ;ylabel('|H(jw)|','FontSize',12); axis([0,6000,0,0.008]);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% 滤波音频信号-频域
subplot(2,2,4);plot(f,Yf); % 绘制滤波后频谱图
title('滤波音频信号-频域','FontSize',16);
xlabel('f/HZ','FontSize',12) ;ylabel('|H(jw)|','FontSize',12); axis([0,6000,0,0.008]);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% 写成 WAV 文件
audiowrite('TV_new.wav',Y,Fs); 
