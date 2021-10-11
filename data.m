 % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
clc
clear
% data1=[];
% data2=[0 4.7;3 3.56;6 3.12;9 2.89;12 2.73;15 2.61;18 2.50;21 2.42;24 2.31;27 2.21;30 2.13;
%     33 2.04;36 1.94;39 1.83;42 1.74;45 1.66;48 1.55;51 1.44;54 1.33;57 1.20;59 1.06;60 0];
% %  data2=sortrows(data1.data,1);
% data3=[0 4.82;3 3.46;6 3.36;9 3.22;12 3.10;15 2.96;18 2.83;21 2.69;24 2.59;27 2.47;30 2.37;33 2.27;
%     36 2.23;39 2.04;42 1.94;45 1.85;48 1.75;51 1.64;54 1.56;57 1.47;59 1.47;60 0];
% % save measure_2021_04_15.t2xt -ascii data2
% V = output_file([data1],'measure_2021_07_19_0.2Hz 天线 .txt');
% V2 = output_file([data2,data3],'measure_2021_07_19_0.2Hz长铜管 单针探针.txt');
% data1 = str2double(measure202107025cm);
% figure(1)
% % left_color = [.5 .5 0];
% % right_color = [0 .5 .5];
% % set(fig,'defaultAxesColorOrder',[left_color; right_color]);
% % yyaxis left
% fidin=fopen('measure_2021_07_07_水槽深部测量.txt');                               % 打开test2.txt文件             
% fidout=fopen('mkmatlab.txt','w');                       % 创建MKMATLAB.txt文件
% while ~feof(fidin)                                      % 判断是否为文件末尾               
%     tline=fgetl(fidin);                                 % 从文件读行   
%     if double(tline(1))>=48&&double(tline(1))<=57       % 判断首字符是否是数值
%        fprintf(fidout,'%s\n\n',tline);                  % 如果是数字行，把此行数据写入文件MKMATLAB.txt
%        continue                                         % 如果是非数字继续下一次循环
%     end
% end
% fclose(fidout);
% data1 = str2double(measure202107025cm);
% plot(data1(:,1),data1(:,2),'bd-','linewidth',4.0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data2=importdata('mearsure_2021_09_23 偶极天线电势值.txt'); % 将生成的MKMATLAB.txt文件导入工作空间，变量名为MK，实际上它不显示出来 
data2=data2.data;
data1=importdata('measure_2021_07_01_水槽探针实验1MHz.txt');
plot(data2(:,1),data2(:,4),'rd-','linewidth',2.0);
hold on
plot(data2(:,5),data2(:,8),'go-','linewidth',2.0);
hold on
plot(data1(:,1),data1(:,2),'kp-','linewidth',2.0);
grid on
legend('1MHz antenna left ','1MHz antenna right','1MHz background');
xlabel('Distance(cm)','fontsize',12);
ylabel('voltage(v)','fontsize',12);
title('Equivalent center','fontsize',14);
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data2=data2(109:end,:);
% [f,lacation]=unique(data2(:,1),'rows','first');
% data2=data2(lacation,:);
% semilogx(data2(2:108,1),data2(2:108,2),'rd-','linewidth',2.0);
% hold on
% x=2e7:4e5:4e7;
% y=interp1(data2(:,1),data2(:,2),x,'pchip');%%%%%%%%%%插值算法
% plot(x,y,'co-','linewidth',2.0)
% hold on
% x=log10(data2(:,1));
% plot(x,data2(:,2),'rd-','linewidth',2.0);
% p = polyfit(x,data2(:,2),1);
% y1 = polyval(p,x);
% hold on
% plot(x,y1,'kd-','linewidth',2.0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=log10(data2(1:98,1));
plot(x,data2(1:98,2),'rd-','linewidth',2.0);
hold on
p = polyfit(x,data2(1:98,2),10);%%%%%%%非线性拟合
x1 = x;
y1 = polyval(p,x1);
plot(x1,y1,'kd-','linewidth',2.0);
hold on
% plot(data2(:,1),data2(:,3),'kp-','linewidth',2.0);
% hold on
% plot(data2(:,1),data2(:,4),'co-','linewidth',2.0);
% hold on
% plot(data2(:,1),data2(:,5),'gh-','linewidth',2.0);
legend('measurment phase','polyfit phase');
% data1=importdata('measure_2021_07_02_水槽探针实验测量5cm.txt');
% figure(2)
% data5=importdata('measure_2021_07_01_水槽探针实验1MHz.txt');
% data1=data1.data;
% hold on
% plot(data1(:,1),data1(:,2),'kd-','linewidth',2.0);
% hold on
% plot(data1(:,1),data1(:,3),'kp-','linewidth',2.0);
% hold on
% plot(data1(:,1),data1(:,4),'ko-','linewidth',2.0);
% hold on
% plot(data1(:,1),data1(:,5),'kh-','linewidth',2.0);
% legend('1MHz','background 1MHz');
xlabel('f(Hz)','fontsize',12);
ylabel('K','fontsize',12);
title('antenna phase','fontsize',14);
grid on
hold on
plot(x1,data2(1:87,4),'mp-','linewidth',2.0);
xlabel('f(Hz)','fontsize',12);
ylabel('phase','fontsize',12);
title('residual error','fontsize',14);
legend('measure k','polyfit k','residual k');
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3)
x2=data2(133:178,1);
plot(x2,data2(133:178,2),'rd-','linewidth',2.0);
hold on
p = polyfit(x2,data2(133:178,2),15);%%%%%%%非线性拟合
x3 = x2;
y3 = polyval(p,x3);
plot(x3,y3,'kd-','linewidth',2.0);
hold on
plot(x3,y3-data2(133:178,2),'mp-','linewidth',2.0);
legend('measurment k','polyfit k');
xlabel('f(Hz)','fontsize',12);
ylabel('K','fontsize',12);
title('transfor function','fontsize',14);
grid on
hold on
figure(4)
plot(data2(:,1),data2(:,2),'mp-','linewidth',2.0);
xlabel('f(Hz)','fontsize',12);
ylabel('k','fontsize',12);
title('residual error','fontsize',14);
legend('measure k','polyfit k','residual k');
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
x6=data2(154:178,1);
plot(x6,data2(154:178,2),'rd-','linewidth',2.0);
hold on
p = polyfit(x6,data2(154:178,2),2);%%%%%%%非线性拟合
x7 = x6;
y7= polyval(p,x7);
plot(x7,y7,'kd-','linewidth',2.0);
hold on
legend('measurment k','polyfit k');
xlabel('f(Hz)','fontsize',12);
ylabel('K','fontsize',12);
title('transfor function','fontsize',14);
grid on
hold on
plot(x7,y7-data2(154:178,2),'mp-','linewidth',2.0);
xlabel('f(Hz)','fontsize',12);
ylabel('k','fontsize',12);
title('residual error','fontsize',14);
legend('measure k','polyfit k','residual k');
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(5)
x4=data2(172:185,1);
plot(x4,data2(172:185,2),'rd-','linewidth',2.0);
hold on
p= polyfit(x4,data2(172:185,2),10);%%%%%%%非线性拟合
x5 = x4;
y5= polyval(p,x5);
plot(x5,y5,'kd-','linewidth',2.0);
hold on
legend('measurment k','polyfit k');
xlabel('f(Hz)','fontsize',12);
ylabel('K','fontsize',12);
title('transfor function','fontsize',14);
grid on
hold on
plot(x5,y5-data2(172:185,2),'mp-','linewidth',2.0);
xlabel('f(Hz)','fontsize',12);
ylabel('k','fontsize',12);
title('residual error','fontsize',14);
legend('measure k','polyfit k','residual k');
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data5=importdata('measure_2021_8_1.txt');
data6=data5.data;
figure(6)
plot(data6(:,1),data6(:,2),'ro-','linewidth',2.0)
hold on
plot(data6(:,1),data6(:,3),'kp-','linewidth',2.0)
hold on
plot(data6(:,1),data6(:,4),'mp-','linewidth',2.0)
hold on
plot(data6(:,1),data6(:,5),'gs-','linewidth',2.0)
hold on
plot(data6(:,1),data6(:,6),'bd-','linewidth',2.0)
legend({string(data5.textdata(:,2)),string(data5.textdata(:,3)),...
string(data5.textdata(:,4)),string(data5.textdata(:,5)),string(data5.textdata(:,6))});
xlabel({string(data5.textdata(:,1))},'fontsize',12);
ylabel('voltage(v)','fontsize',12);
title('measure-2021-08-01','fontsize',14);

subplot(2,1,1)
semilogx( data2(:,1), data2(:,2),'bd-','linewidth',2.0);
hold on
semilogx( data2(:,1), data2(:,3),'ro-','linewidth',2.0);
% % set(gca,'xtick',[])   hide X axes
% set(gca,'xticklabel',[]);
% grid on
% % xlabel('f(Hz)','fontsize',12)
% ylabel('E(v/m)','fontsize',12)
% legend('measurement','fitting');
% % title('electric filed');
% xlim([0.1 2.1e6])
% % set(gca,'position',[])
% subplot(2,1,2)
% % hold on
% semilogx( data2(:,1), smoothdata(data2(:,2)-data2(:,3),5),'ko-','linewidth',2.0);
% grid on
% hold on
% plot( data1(1:13,1), data1(1:13,3),'k*-','linewidth',2.0);
% hold on
% plot( data1(1:13,1), data1(1:13,4),'bd-','linewidth',2.0);
% hold on
% plot(data1(1:13,1), data1(1:13,5),'mp-','linewidth',2.0);
% grid on
% A= mean(data2(1:68,2:4),2);
% B=data2(1:68,1);
% hold on
% plot (data2(1:22,1), data2(1:22,6),'gh-','linewidth',2.0);
% xlabel('f(Hz)','fontsize',12)
% ylabel('E(v/m)','fontsize',12)
% legend('residual');
% title('electric filed');
xlim([0.1 2.1e6])
% figure(2)
% plot( data2(1:22,1), data2(1:22,6),'ro-','linewidth',2.0);
% hold on
% plot( data2(1:22,1), data2(1:22,7),'k*-','linewidth',2.0);
% hold on
% plot( data2(1:22,1), data2(1:22,8),'cs-','linewidth',2.0);
% hold on
% plot (data2(1:22,1), data2(1:22,9),'mp-','linewidth',2.0);
% grid on
% hold on
% plot (data2(1:22,1), data2(1:22,11),'gh-','linewidth',2.0);
% xlabel('f(Hz)','fontsize',12)
% ylabel('E(v/m)','fontsize',12)
% legend('6HZ','7Hz','8Hz','9Hz');
% title('电场测量');
% hold on
% plot( data2(:,1),mean(data2(:,2:4),2),'gh','linewidth',2.0);
% xlim([0 2e6])
% hold on
% plot( data2(:,1), data2(:,6),'y+-','linewidth',2.0);
% hold on
% plot( data2(:,1), data2(:,7),'cs-','linewidth',2.0);
% hold on
% % yyaxis right
% semilogx(  data2(:,1), data2(:,3),'k*-','linewidth',2.0);
% xlabel('Distance(cm)','fontsize',12)
% ylabel('Voltage(v)','fontsize',12)
% hold on
% plot(  data2(:,1), data2(:,3)-data2(:,2),'bd-','linewidth',2.0);
% xlabel('Distance(cm)')
% ylabel('Voltage(v)')
% % hold on
% % plot(  data2(53:66,1), data2(53:66,5),'mp-','linewidth',2.0);
% % xlabel('Distance(cm)')
% % ylabel('Voltage(v)')
% legend('test一','test二','test三','Mean');
% title('平行板不同频率电压');
% figure(2)
% contourf(data1(1:22,1),[5,15],[data1(1:22,2:3)-[data2(28:49,4),data2(3:24,4)]]',[0:0.01:0.2],'LineColor','none');
% c=colorbar;
% colormap(jet)
% caxis([0 0.2])
% hold on
% contour(data1(1:22,1),[5,15],[data1(1:22,2:3)-[data2(28:49,4),data2(3:24,4)]]','ShowText','on','LineStyle','--','Linecolor','k');
% xlabel('longitudinal Distance(cm)','fontsize',12)
% ylabel('transverse Distance(cm)','fontsize',12)
% title('1MHz mearsurement','fontsize',16)
% c=colorbar;
% colormap(jet)
% caxis([0 0.2])
% c.Label.String='voltage(v)';
% c.Label.FontSize=15;
% figure(3)
% contourf(data1(3:24,1),[5,15],[data1(28:49,4),data1(3:24,4)]',(0:0.01:5),'LineColor','none');
% c=colorbar;
% colormap(jet)
% caxis([0 5])
% hold on
% contour(data1(3:24,1),[5,15],[data1(28:49,4),data1(3:24,4)]',(0:0.5:5),'ShowText','on','LineStyle','--','Linecolor','k');
% xlabel('longitudinal Distance(cm)','fontsize',12)
% ylabel('transverse Distance(cm)','fontsize',12)
% title('100kHz mearsurement','fontsize',16)
% c=colorbar;
% colormap(jet)
% caxis([0 5])
% c.Label.String='voltage(v)';
% c.Label.FontSize=12;
% figure(4)
contourf(data1(3:24,1),[5,15],0.7.*abs(smoothdata(([data1(28:49,3),data1(3:24,3)]'-data2(:,2:3)'),2)),(0:0.001:0.2),'LineColor','none');
% contourf(data2(:,1),[5,15],data2(:,2:3)',(0:0.5:5));
xlabel('longitudinal Distance(cm)','fontsize',12)
ylabel('transverse Distance(cm)','fontsize',12)
title('horizental mearsurement','fontsize',16)
c=colorbar;
colormap(jet)
caxis([0 0.2])
c.Label.String='voltage(v)';
c.Label.FontSize=15;
hold on
contour(data1(3:24,1),[5,15],0.7.*abs(smoothdata(([data1(28:49,3),data1(3:24,3)]'-data2(:,2:3)'),2)),(0:0.05:0.2)','ShowText','on','LineStyle','--','Linecolor','k');
xlabel('longitudinal Distance(cm)','fontsize',12)
ylabel('transverse Distance(cm)','fontsize',12)
title('100Hz mearsurement','fontsize',16)
c=colorbar;
colormap(jet)
caxis([0 0.2])
c.Label.String='voltage(v)';
c.Label.FontSize=15;
% hold on
% plot( data2(:,1), data2(:,4),'bd-','linewidth',2.0);
% xlabel('Distance(cm)')
% ylabel('Voltage(v)')
% legend('100Hz','100KHz','1MHz');


% figure(2)
% x=diff(data2(:,1));
% y=diff(data2(:,2));
% y1=diff(data2(:,3));
% y2=diff(data2(:,4));
% plot( data2(2:end,1), -y.*1e2./x,'ko-','linewidth',2.0);
% xlabel('Distance(cm)')
% ylabel('E(v/m)')
% hold on
% % yyaxis right
% plot( data2(2:end,1), -y1.*1e2./x,'rs-','linewidth',2.0);
% xlabel('Distance(cm)')
% ylabel('E(v/m)')
% hold on
% plot(data2(2:end,1), -y2.*1e2./x,'bd-','linewidth',2.0);
% xlabel('Distance(cm)')
% ylabel('E(v/m)')
% legend('100Hz','100KHz','1MHz');






% figure(2)
% semilogx( data2(:,1), data2(:,2).*1e3./data2(:,3),'rs-','MarkerFaceColor','r','linewidth',2);
% xlabel('f(Hz)')
% ylabel('impedance(\Omega)')
% hold on
% semilogx( data2(:,1), data2(:,4),'bd-','linewidth',2.0);
% xlabel('f(Hz)')

% legend('功率计测量','示波器测量一','示波器测量二')
% yyaxis right
% semilogx( data2(:,1), data2(:,3),'.-');
% xlabel('f(Hz)')
% ylabel('I(mA)')
% figure(2)
% yyaxis left
% semilogx( data2(:,1), data2(:,2).*data2(:,3),'.-');
% ylabel('P(mw)')
% yyaxis right
% semilogx( data2(:,1), data2(:,4),'.-');
% xlabel('f(Hz)')
% ylabel('P(mw)')
% legend('计算','测量')
% figure(3)
% semilogx( data2(:,1), data2(:,2)./data2(:,3),'.-');
% xlabel('f(Hz)')
% ylabel('impedance(\Omega)')
% xlim([0 1e6])
% x=diff(data2(:,1)).*1e-2;
% y=diff(data2(:,2));
% y1=diff(data2(:,3));
% subplot(3,1,3)
% semilogx( data2(:,1),data2(:,4),'.-');
% ylabel('P(mw)')
% ylim([-0.4 0.8])
% hold on
% plot( data2(2:end,1).*1e-2,-y1./x,'.-');
% xlabel('Range(m)')
% ylabel('E(v/m)')
% title("频率DC,单探针测量电场随距离变化");
% legend('测量电场1','测量电场2');
% title(' Distance=6cm')
% figure(2)
% loglog( measure2021041912cm6cm, measure2021041912cm6cm,'.');
% % x=diff(data2(:,1));
% y=diff(data2(:,2));
% plot(data2(2:end,1),-y./x,'.');
% measure2021041612cm14V100K1=measure2021041612cm14V100K(2:end,:);
%  x=diff(measure2021041612cm14V100K1(:,1));
% y=diff(measure2021041612cm14V100K1(:,2));
% plot(measure2021041612cm14V100K1(:,1),measure2021041612cm14V100K1(:,2),'.');
% xlabel('Distance from the positive plate(m)')
% ylabel('Potential/v')
% title(' Distance=1mm  Iinput=14V')
% figure(2)
% plot(measure2021041612cm14V100K1(2:end,1),-y./x,'.');
% xlabel('Distance from the positive plate(m)')
% ylabel('Electric field(V/m)')
% title('f=100K Distance=0.12m  Iinput=14V')


% semilogx(data2(:,1),data2(:,2))
%  hold on


% data2=measure2021041515cm1;
% 
% loglog(data2(:,1),data2(:,2))
% hold on 
% loglog(data2(:,1),data2(:,3))
% hold on 
% loglog(data2(:,1),data2(:,4))
% hold on 
% loglog(data2(:,1),data2(:,5))
% hold on 
% loglog(data2(:,1),data2(:,6))
% hold on
% semilogx( unnamed(:,8), unnamed(:,10),'.');
% xlabel('f/Hz')100e3
% ylabel('Amplitude/V')
% xlabel('Distance from the positive plate')
% ylabel('Potential/V')
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% z=10+peaks;
% surf(z)
% hold on 
% image(z,'CDataMapping','scaled');



