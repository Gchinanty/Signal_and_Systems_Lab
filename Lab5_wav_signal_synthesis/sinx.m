Fs = 1000;              % ������1000HZ
Ts = 2;                    % ����ʱ��
N = Fs*Ts;              % ��������2000�� , 2s
t = 0:Ts:Ts*(N-1);   % ʱ�����

y=sin(2*pi*1045*linspace(0,1,N+1)) ;%1045HZ

sound(y,Fs);
