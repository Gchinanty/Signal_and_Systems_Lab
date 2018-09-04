clear all;
filename = 'ding.wav';

Fs = 5000;                     % ������5000HZ
Ts = 1/Fs;                      % �������
N = 0;                           %��������Ϊʵ�ʳ���

Fs1=5000;                      %������5000HZ
Ts1 = 1/Fs1;                   % �������
N1 = 2048;                     % ��������2048��

Fs2=5000;                        %������5000HZ
Ts2 = 1/Fs2;                   % �������
N2 = 1024;                     % ��������1024��

[y,Fs] = audioread(filename);
N = length(y);                %��������Ϊʵ�ʳ���
y=y(:,1);
sound(y,Fs);

[y1,Fs1] = audioread(filename);
y1=y1(:,1);
%sound(y1,Fs1);

[y2,Fs2] = audioread(filename);
y2=y2(:,1);
%sound(y2,Fs2);

figure('NumberTitle', 'off', 'Name', 'wav_signal_synthesis');
subplot(2,2,1)
plot(y);
title('����������','FontSize',16);
xlabel('��������/��','FontSize',12) ;ylabel('ding.wav/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';

yfft = abs(fft(y)/N);
t=Ts*(1:N);
yf = ifft(yfft,'symmetric');     %����Ҷ��任
yfft=yfft(1:N/2+1);
yfft(2:end-1) = 2*yfft(2:end-1);
F = Fs*(0:(N/2))/N;
subplot(2,2,2)
plot(F,yfft);
title('wav-ʵ�ʳ��ȸ���Ҷ�仯','FontSize',16);
xlabel('f/HZ','FontSize',12) ;ylabel('ding.wav/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';


yfft1 = abs(fft(y1,N1)/N1);
yfft1=yfft1(1:N1/2+1);
yfft1(2:end-1) = 2*yfft1(2:end-1);
F1 = Fs1*(0:(N1/2))/N1;
subplot(2,2,3)
plot(F1,yfft1); 
title('wav-2048����Ҷ�仯','FontSize',16);
xlabel('f/HZ','FontSize',12) ;ylabel('ding.wav/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';

yfft2 = abs(fft(y2,N2)/N2);
yfft2=yfft2(1:N2/2+1);
yfft2(2:end-1) = 2*yfft2(2:end-1);
F2 = Fs2*(0:N2/2)/N2;
subplot(2,2,4)
plot(F2,yfft2); 
title('wav-1024����Ҷ�仯','FontSize',16);
xlabel('f/HZ','FontSize',12) ;ylabel('ding.wav/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';

figure('NumberTitle', 'off', 'Name', 'ifft-����Ҷ��任');
plot(yf);
title('wav����Ҷ�仯��仯','FontSize',16);
xlabel('��������/��','FontSize',12) ;ylabel('ding.wav/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
