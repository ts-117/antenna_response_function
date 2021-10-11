%frequency response of double antenna in different postion in water vat
%author: Shi Tao
filename='response_function.xlsx';
sheet=1;

l_left=xlsread(filename,sheet,'A104:A108');
f_left_100=xlsread(filename,sheet,'D104:D108');
f_left_100k=xlsread(filename,sheet,'G104:G108');
f_left_1M=xlsread(filename,sheet,'J104:J108');

l_right=xlsread(filename,sheet,'K104:K108');
f_right_100=xlsread(filename,sheet,'N104:N108');
f_right_100k=xlsread(filename,sheet,'O104:O108');
f_right_1M=xlsread(filename,sheet,'T104:T108');

%background_field
l=xlsread(filename,sheet,'A111:A132');
f_100=(xlsread(filename,sheet,'B111:B132')+xlsread(filename,sheet,'C111:C132'))/2;
f_100k=(xlsread(filename,sheet,'D111:D132')+xlsread(filename,sheet,'E111:E132'))/2;
f_1M=(xlsread(filename,sheet,'F111:F132')+xlsread(filename,sheet,'G111:G132'))/2;

figure(1)
plot(l_left,f_left_100,'ro-','linewidth',2.0)
hold on
plot(l_right,f_right_100,'go-','linewidth',2.0)
hold on
plot(l,f_100,'k*-','linewidth',2.0)

legend('100Hz right','100Hz left','100Hz background')

figure(2)
plot(l_left,f_left_100k,'ro-','linewidth',2.0)
hold on
plot(l_right,f_right_100k,'go-','linewidth',2.0)
hold on
plot(l,f_100k,'k*-','linewidth',2.0)
legend('100kHz right','100kHz left','100kHz background')

figure(3)
plot(l_left,f_left_1M,'ro-','linewidth',2.0)
hold on
plot(l_right,f_right_1M,'go-','linewidth',2.0)
hold on
plot(l,f_1M,'k*-','linewidth',2.0)
legend('100MHz right','100MHz left','100MHz background')




