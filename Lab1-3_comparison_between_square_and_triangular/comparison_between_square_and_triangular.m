f0=50;                     %频率50HZ
Fs = 1000;              % 采样率1000HZ
Ts = 1/Fs;               % 采样间隔
N =  10000;            % 采样数量为实际长度 , 10s
t = 0:Ts:Ts*(N-1);   % 时间矩阵 

figure('NumberTitle', 'off', 'Name', '50HZ,3V方波&50HZ,3V方波');
%方波
ysquare=square(2*pi*f0*t,50) ; %占空比为50%
subplot(2,2,1) 
plot(t,ysquare*3) ; % 幅度为3
title('方波','FontSize',16);axis([0,10,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('Ysquare/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 
%方波傅里叶变化
yfft = 3*abs(fft(ysquare)/N);
yfft=yfft(1:N/2+1);
yfft(2:end-1) = 2*yfft(2:end-1);
F = Fs*(0:N/2)/N;
subplot(2,2,2)
plot(F,yfft); 
title('方波傅里叶变化','FontSize',16);
xlabel('f/HZ','FontSize',12) ;ylabel('amplitude/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 
%三角波
ytriangular=sawtooth(2*pi*f0*t,f0*0.01) ;
subplot(2,2,3) 
plot(t,ytriangular*3) ; % 幅度为3
title('三角波','FontSize',16);axis([0,10,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('Ytriangular/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 
%三角波傅里叶变化
yfft = 3*abs(fft(ytriangular)/N);
yfft=yfft(1:N/2+1);
yfft(2:end-1) = 2*yfft(2:end-1);
F = Fs*(0:N/2)/N;
subplot(2,2,4)
plot(F,yfft); 
title('三角波傅里叶变化','FontSize',16);
xlabel('f/HZ','FontSize',12) ;ylabel('amplitude/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 
