%% ��� %%%%%%%%%%%%%%%%%%
% ΢��������ϵͳ���2___�ۺ����1
% ��֤��Ƶ�ź�Ƶ���ǵ�ԭ��
% �人��ѧ������ϢѧԺ ׿����
% ����2016��      ����
% email: whu_guoyang@whu.edu.cn
%
%%%%%%%%%%%%%%%%%%%%%%%%

%% ��ʼ��
clc
clear all

%% ������Ƶ���ݣ���ѡ������3���ź�
% MATLAB�Դ�ding�ź�
filename = './wav/ding.wav';
% С�����ź�
filename1 = './wav/violin.wav';
% 440HZ �绰�����ź�
filename2 = './wav/sound-bell-440hz.wav';
[y,Fs] = audioread(filename);
% ����ź�Ϊ˫������ȡ����һ������
y=y(:,1);
% ������������ת����һά��������
csvwrite('./vector_of_wav/var.txt',y');
% �����ź�
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
subplot(2,3,1)
plot(F,yfft);
title([num2str(Fs) 'Hz,df=' num2str(Fs/N) 'Hz'],'FontSize',16);%axis([0,10000,0,0.015]);
xlabel('f/HZ','FontSize',12) ;ylabel('|fft(y)|','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% wav-N1����Ҷ�仯
N1=8192;
yfft1 = abs(fft(y,N1)/N1);
t1=Ts*(1:N1);
yfft1=yfft1(1:N1/2+1);
yfft1(2:end-1) = 2*yfft1(2:end-1);
F1 = Fs*(0:(N1/2))/N1;
subplot(2,3,2)
plot(F1,yfft1); 
title([num2str(Fs) 'Hz,df=' num2str(Fs/N1) 'Hz'],'FontSize',16);%axis([0,10000,0,0.02]);
xlabel('f/HZ','FontSize',12) ;ylabel('|fft(y)|','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% wav-N2����Ҷ�仯
N2=1024;
yfft2= abs(fft(y,N2)/N2);
t2=Ts*(1:N2);
yfft2=yfft2(1:N2/2+1);
yfft2(2:end-1) = 2*yfft2(2:end-1);
F2 = Fs*(0:(N2/2))/N2;
subplot(2,3,3)
plot(F2,yfft2); 
title([num2str(Fs) 'Hz,df=' num2str(Fs/N2) 'Hz'],'FontSize',16);%axis([0,10000,0,0.02]);
xlabel('f/HZ','FontSize',12) ;ylabel('|fft(y)|','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% wav-N3����Ҷ�仯
N3=882;
yfft3= abs(fft(y,N3)/N3);
t3=Ts*(1:N3);
yfft3=yfft3(1:N3/2+1);
yfft3(2:end-1) = 2*yfft3(2:end-1);
F3 = Fs*(0:(N3/2))/N3;
subplot(2,3,4)
plot(F3,yfft3); 
title([num2str(Fs) 'Hz,df=' num2str(Fs/N3) 'Hz'],'FontSize',16);%axis([0,10000,0,0.02]);
xlabel('f/HZ','FontSize',12) ;ylabel('|fft(y)|','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% wav-N4����Ҷ�仯
N4=870;
yfft4= abs(fft(y,N4)/N4);
t4=Ts*(1:N4);
yfft4=yfft4(1:N4/2+1);
yfft4(2:end-1) = 2*yfft4(2:end-1);
F4 = Fs*(0:(N4/2))/N4;
subplot(2,3,5)
plot(F4,yfft4); 
title([num2str(Fs) 'Hz,df=' num2str(Fs/N4) 'Hz'],'FontSize',16);%axis([0,10000,0,0.02]);
xlabel('f/HZ','FontSize',12) ;ylabel('|fft(y)|','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% wav-N5����Ҷ�仯
N5=860;
yfft5= abs(fft(y,N5)/N5);
t5=Ts*(1:N5);
yfft5=yfft5(1:N5/2+1);
yfft5(2:end-1) = 2*yfft5(2:end-1);
F5 = Fs*(0:(N5/2))/N5;
subplot(2,3,6)
plot(F5,yfft5); 
title([num2str(Fs) 'Hz,df=' num2str(Fs/N5) 'Hz'],'FontSize',16);%axis([0,10000,0,0.02]);
xlabel('f/HZ','FontSize',12) ;ylabel('|fft(y)|','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on
