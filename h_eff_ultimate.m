T=-1:0.2:7;
W=10.^T;

%constants
%CI
ep=8.85*10^(-12);
d1=3.6*10^(-3);
d2=3*10^(-3);
l=0.17;
CI=10*2*pi*ep/(log(d1/d2))*l;
%RI
sigma=1e-4;
RI=1/sigma*(1/(2*pi*l))*log(4*l/d2);
%RM
RM=1000/sigma*(1/(2*pi*(d1/2)));

n=3000;
%A=1/12;
K1=sqrt(9+(2*pi*W.*CI.*(3*RI+RM)).^2);
K2=sqrt(1+(2*pi*W.*CI.*(RI+RM)).^2);


heff=(1/4).*K1./K2;
semilogx(W,heff,'ro-','LineWidth',2.0)
hold on
semilogx(f,k_30,'k*-','linewidth',2.0)
legend('simulation','actual(30cm)')
xlabel('f(Hz)')
ylabel('k')
ylim([0,5])
xlim([1e-1,1e7])



