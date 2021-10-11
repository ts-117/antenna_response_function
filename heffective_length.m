%response function compared with Japan rheometry experiment
%author: Shi Tao
T=-1:0.2:7;
W=10.^T;

ep=8.85*10^(-12);
d1=3.6*10^(-3);
d2=3*10^(-3);
l=0.17;
CI=10*2*pi*ep/(log(d1/d2))*l;


sigma=1e-4;
RI=1/sigma*(1/(2*pi*l))*log(4*l/d2);

RM=1000/sigma*(1/(2*pi*(d1/2)));

r=1.5e-3;
RP=10/sigma*(1/(4*pi*r));


% CI=375.*10^(-12);
% RI=21.7*10^3;
% RM=416.2*10^3;
% RP=40.8*10^3;

L1=1+((2*pi*W.*CI.*(RI+RP./2)).^2);
L2=1+((2*pi*W.*CI.*(RI+RP)).^2);
L3=1+((2*pi*W.*CI.*(RI+RM./2)).^2);
L4=1+((2*pi*W.*CI.*(RI+RM)).^2); 
L5=1/2.*ones(1,31);
% for i=1:length(W)
% L1(i)=1+((W(i).*CI.*(RI+RP./2)).^2);
% L2(i)=1+((W(i).*CI.*(RI+RP)).^2);
% L3(i)=1+((W(i).*CI.*(RI+RM./2)).^2);
% L4(i)=1+((W(i).*CI.*(RI+RM)).^2);
% end
heff1=sqrt(L1./L2);
heff2=sqrt(L3./L4);
heff3=L5;
% semilogx(W,2*heff1,'ro-','linewidth',2.0);
%
% hold on
semilogx(W,2*heff2,'go-','linewidth',2.0)
hold on
semilogx(f,k_30,'k*-','linewidth',2.0)
% hold on
% semilogx(W,2*heff3,'b*-','linewidth',2.0);
title('response function simulation','FontSize',16);
% hold on
% title(date);
% ax = gca;
% ax.TitleHorizontalAlignment = 'right';
% title(date,'position',[10^5,1.1]);
% txt=date;
% text(5*10^3,2.24,txt,'FontSize',14)
% ax=gca;
% ax.HorizontalAlignment='right';
% ax.VerticalAlignment='right';
xlabel('frequency(Hz)','FontSize',14);
ylabel('K(2*heff/L)','FontSize',14);
legend('simulation result','actual result(30cm)','FontSize',10);
grid on
ylim([0,2.4]);
xlim([1e-1,2e6]);


