figure('NumberTitle', 'off', 'Name', '���ǲ��ϳ�');
% ����Ϊ2s, Ƶ��Ϊ0.5HZ
E= 2 ; f0 = 0.5 ; 
%t�仯Ϊ10HZ
t=0:0.1:10;
ytriangular = E/2 ;
for n=1:2:19 
    ytriangular = ytriangular -(4*E/pi^2)*(cos(n*2*pi*f0*t))/n^2 ;
end
subplot(2,1,1)
plot(t,ytriangular) ;
title('���ǲ�1','FontSize',16);axis([0,10,0,2]);
xlabel('t/s','FontSize',12) ;ylabel('Ytriangular/V','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

ytriangular = 0 ;
for n=1:2:19 
    ytriangular = ytriangular -(4*E/pi^2)*(cos(n*2*pi*f0*(t+0.5)))/n^2 ;
end

subplot(2,1,2)
plot(t,ytriangular) ;
title('���ǲ�2','FontSize',16);axis([0,10,-1,1]);
xlabel('t/s','FontSize',12) ;ylabel('Ytriangular/V','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on

