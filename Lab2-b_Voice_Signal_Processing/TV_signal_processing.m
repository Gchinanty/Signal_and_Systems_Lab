%% ��ʼ��
clc
clear all

%% ��������
filename = 'TV_noise.wav';
Fs = 10000;                     % ������10000HZ
Ts = 1/Fs;                        % �������

%% ��ȡ����
[y,Fs] = audioread(filename);
%y=y(:,1);
y12=y(:,1); % ��ȡ�� 1 ����

%% ������׼��
y12m=max(max(y12),abs(min(y12))); % �ҳ���ֵ
y=y12./y12m; % ��һ������
N = length(y);               %��������Ϊʵ�ʳ���
t=(0:N-1)/Fs;                 % ��������ʱ��

%% ���� FDATool ���һ�� bandpass-Butterworth �˲���ʵ���˲�300Hz-3000Hz
Y = doFilter(y12);

%% ԭʼ��Ƶ�ź�-ʱ��
figure('NumberTitle', 'off', 'Name', 'TV_signal_synthesis');
subplot(2,2,1);plot(t,y); % ����ԭ����ͼ
title('ԭʼ��Ƶ�ź�-ʱ��','FontSize',16);
xlabel('t/s','FontSize',12) ;ylabel('TV.wav/V','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% ��ֵ�˲�
Y = medfilt1(Y,20);% 20 points

%% �˲���Ƶ�ź�-ʱ��
subplot(2,2,3);plot(t,Y); % �����˲�����ͼ
title('�˲���Ƶ�ź�-ʱ��','FontSize',16);
xlabel('t/s','FontSize',12) ;ylabel('TV.wav/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% ������Ҷ�任��ԭƵ��
yf = abs(fft(y)/N);
yf=yf(1:N/2+1);
yf(2:end-1) = 2*yf(2:end-1); 

%% ������Ҷ�任���˲���Ƶ��
Yf = abs(fft(Y)/N);
Yf=Yf(1:N/2+1);
Yf(2:end-1) = 2*Yf(2:end-1); 

%% ԭʼ��Ƶ�ź�-Ƶ��
f = Fs*(0:N/2)/N;
subplot(2,2,2);plot(f,yf); % ����ԭ����Ƶ��ͼ
title('ԭʼ��Ƶ�ź�-Ƶ��','FontSize',16);
xlabel('f/HZ','FontSize',12) ;ylabel('|H(jw)|','FontSize',12); axis([0,6000,0,0.008]);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% �˲���Ƶ�ź�-Ƶ��
subplot(2,2,4);plot(f,Yf); % �����˲���Ƶ��ͼ
title('�˲���Ƶ�ź�-Ƶ��','FontSize',16);
xlabel('f/HZ','FontSize',12) ;ylabel('|H(jw)|','FontSize',12); axis([0,6000,0,0.008]);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% д�� WAV �ļ�
audiowrite('TV_new.wav',Y,Fs); 
