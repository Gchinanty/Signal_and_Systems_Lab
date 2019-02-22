%% ��� %%%%%%%%%%%%%%%%%%
% ΢��������ϵͳ���2___�ۺ����1
% ��֤��Ƶ�ź�Ƶ���ǵ�ԭ�� 
% ����440HZ�绰�����źŵ���֤
% �人��ѧ������ϢѧԺ ׿����
% ����2016��      ����
% email: whu_guoyang@whu.edu.cn
%
%%%%%%%%%%%%%%%%%%%%%%%%

%% ��ʼ��
clc
clear all

%% ������Ƶ����
filename = './wav/sound-bell-440hz.wav';
[y,Fs] = audioread(filename);
y=y(:,1);
sound(y,Fs);
N=length(y);

%% ����ԭʼͼ��

figure('NumberTitle', 'off', 'Name', 'ԭʼ�ź�');
plot(y);
title('ԭʼ�źŲ���','FontSize',16);
xlabel('��������/��','FontSize',12) ;ylabel('��һ������/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% wav-ʵ�ʳ��ȸ���Ҷ�仯
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
