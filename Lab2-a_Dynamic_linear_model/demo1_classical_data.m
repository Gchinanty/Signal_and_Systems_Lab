%% ��ʼ��
clc ;
clear all ;

%% ������Ƶ
Fs = 22050;
filename = 'clicks.wav';
[y,Fs] = audioread(filename);
y=y(:,1);

%% ԭʼͼ��
figure('NumberTitle', 'off', 'Name', 'Original_signal');
plot(y); % ����ԭ����ͼ
title('ԭʼ��Ƶ�ź�-ʱ��','FontSize',16);
xlabel('������/��','FontSize',12) ;ylabel('clicks.wav','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% ģ�ʹ���
save('clicks.mat','y');
mat=importdata('clicks.mat');
A=1:10:length(mat);
mat=mat(A);
N=length(mat);
 t = (0:N-1)'; % time
 %s, ��ȷ����, demo��Ϊ15100
 s = sqrt(1000);
 %ģ�������󣬿�ƽ��
w123 = sqrt([755 755]);
out = dlmfit(mat,s,w123,[],[],[],struct('seas',0));

%% ƽ��ͼ��
figure('NumberTitle', 'off', 'Name', 'Signal_analysis_after_the_model');
dlmplotfit(out,t);
title('Smoothed-data','FontSize',16);
xlabel('������/��','FontSize',12) ;ylabel('clicks.wav','FontSize',12); axis([0,800,-0.5,0.5]);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

%% DLM�в��������غ���, ʣ��в����������ͼ
figure('NumberTitle', 'off', 'Name', 'Signal_analysis');
dlmplotdiag(out,t);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on
