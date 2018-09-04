Fs = 1000;              % 采样率1000HZ
Ts = 2;                    % 采样时间
N = Fs*Ts;              % 采样数量2000点 , 2s
t = 0:Ts:Ts*(N-1);   % 时间矩阵

y=sin(2*pi*1045*linspace(0,1,N+1)) ;%1045HZ

sound(y,Fs);
