f0=50;                     %Ƶ��50HZ
Fs = 1000;              % ������1000HZ
Ts = 1/Fs;               % �������
N =  10000;            % ��������Ϊʵ�ʳ��� , 10s
t = 0:Ts:Ts*(N-1);   % ʱ����� 

figure('NumberTitle', 'off', 'Name', '50HZ,3V����&50HZ,3V����');
%����
ysquare=square(2*pi*f0*t,50) ; %ռ�ձ�Ϊ50%
subplot(2,2,1) 
plot(t,ysquare*3) ; % ����Ϊ3
title('����','FontSize',16);axis([0,10,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('Ysquare/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 
%��������Ҷ�仯
yfft = 3*abs(fft(ysquare)/N);
yfft=yfft(1:N/2+1);
yfft(2:end-1) = 2*yfft(2:end-1);
F = Fs*(0:N/2)/N;
subplot(2,2,2)
plot(F,yfft); 
title('��������Ҷ�仯','FontSize',16);
xlabel('f/HZ','FontSize',12) ;ylabel('amplitude/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 
%���ǲ�
ytriangular=sawtooth(2*pi*f0*t,f0*0.01) ;
subplot(2,2,3) 
plot(t,ytriangular*3) ; % ����Ϊ3
title('���ǲ�','FontSize',16);axis([0,10,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('Ytriangular/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 
%���ǲ�����Ҷ�仯
yfft = 3*abs(fft(ytriangular)/N);
yfft=yfft(1:N/2+1);
yfft(2:end-1) = 2*yfft(2:end-1);
F = Fs*(0:N/2)/N;
subplot(2,2,4)
plot(F,yfft); 
title('���ǲ�����Ҷ�仯','FontSize',16);
xlabel('f/HZ','FontSize',12) ;ylabel('amplitude/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 
