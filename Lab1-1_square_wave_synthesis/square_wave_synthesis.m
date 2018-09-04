figure('NumberTitle', 'off', 'Name', '�����ϳ�');
% 50 HZ,������Ϊ1000 HZ>>50HZ, ���ϲ�������
t = 0: 0.0001: 10 ;
%�ֱ���ʾ
%����**************************************************
y1 = oddwave(1) ;
subplot(2,2,1) 
plot(t,y1,'r') ;
title('����','FontSize',16);axis([0,0.08,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('y_1/V','FontSize',12); 
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on 
%����г��+����****************************************
y2 = y1+ oddwave(3) ;
subplot(2,2,2) 
plot(t,y2,'g') ;
title('����г��+����','FontSize',16);axis([0,0.08,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('y_2/V','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on
%���г�����*****************************************
ysum1 = 0 ;
for n=1:2:9 
    ysum1 = ysum1 + oddwave(n) ;
end
subplot(2,2,3) 
plot(t,ysum1,'b') ;
title('���г�����','FontSize',16);axis([0,0.08,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('y_s_u_m_1/V','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on
%19��г�����*****************************************
ysum2 = 0 ;
for n=1:2:19 
    ysum2 = ysum2 + oddwave(n) ;
end
subplot(2,2,4) 
plot(t,ysum2,'k') ;
title('19��г�����','FontSize',16);axis([0,0.08,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('y_s_u_m_2/V','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on
%�����ƽ�����******************************************
figure('NumberTitle', 'off', 'Name', '�����ƽ�����');
plot(t,y1,'r',t,y2,'g',t,ysum1,'b',t,ysum2,'k');
legend('����','����г��+����','���г�����','19��г�����');
title('�����ƽ�����','FontSize',16);axis([0,10,-4,4]);
xlabel('t/s','FontSize',12) ;ylabel('Square wave/V','FontSize',12);
h = zoom; h.Motion = 'horizontal'; h.Enable = 'on';
grid on
%����
function [ y ] = oddwave( n )
t = 0: 0.0001: 10 ;
y = (12/pi)*sin(100*pi*n*t)/n ;
end
