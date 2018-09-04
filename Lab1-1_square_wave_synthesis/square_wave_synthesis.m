figure('NumberTitle', 'off', 'Name', '方波合成');
% 50 HZ,采样率为1000 HZ>>50HZ, 符合采样定理
t = 0: 0.0001: 10 ;
%分别显示
%基波**************************************************
y1 = oddwave(1) ;
subplot(2,2,1) 
plot(t,y1,'r') ;
title('基波','FontSize',16);axis([0,0.08,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('y_1/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 
%三次谐波+基波****************************************
y2 = y1+ oddwave(3) ;
subplot(2,2,2) 
plot(t,y2,'g') ;
title('三次谐波+基波','FontSize',16);axis([0,0.08,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('y_2/V','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on
%五个谐波相加*****************************************
ysum1 = 0 ;
for n=1:2:9 
    ysum1 = ysum1 + oddwave(n) ;
end
subplot(2,2,3) 
plot(t,ysum1,'b') ;
title('五个谐波相加','FontSize',16);axis([0,0.08,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('y_s_u_m_1/V','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on
%19个谐波相加*****************************************
ysum2 = 0 ;
for n=1:2:19 
    ysum2 = ysum2 + oddwave(n) ;
end
subplot(2,2,4) 
plot(t,ysum2,'k') ;
title('19个谐波相加','FontSize',16);axis([0,0.08,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('y_s_u_m_2/V','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on
%方波逼近过程******************************************
figure('NumberTitle', 'off', 'Name', '方波逼近过程');
plot(t,y1,'r',t,y2,'g',t,ysum1,'b',t,ysum2,'k');
legend('基波','三次谐波+基波','五个谐波相加','19个谐波相加');
title('方波逼近过程','FontSize',16);axis([0,10,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('Square wave/V','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on
%函数
function [ y ] = oddwave( n )
t = 0: 0.0001: 10 ;
y = (12/pi)*sin(100*pi*n*t)/n ;
end
