clearvars

%dimensional input parameters

tf=10*3600*24*365;
tfyear=tf/(3600*24*365);

CA0=0;
% CAx0=0.3e-3;
k1=2.22e-9;
k2=9.44e-6;
% T12A=4.61e3;
T12A=1e20;

T12B=1e20;

T12D=1e20;

theta12B=1e20;
% theta12B=1e1;
% theta12B=1e7;

qA=1.1e-5;
L=50;
ro=1.35e-12;
MW=4.51e3;
a21=1e21;

Ntime=100;
% npoints=500;
npoints=50;
theta12Blin=logspace(log10(1e1),log10(1e20),npoints);

for i17 = 1:npoints
    i17
theta12B=theta12Blin(i17);

%%%%%%%%%%%%%%%%
% k1=1e-4;
% k1=1e-6;
k1=1e-8;

options = odeset('RelTol',1e-10,'AbsTol',1e-10);
tspan = [0 tf];
y0 = [0 0 0];
sol = ode45(@(t,CABD) funCABD_int(t,CABD,k1,k2,T12A,T12B,T12D,theta12B,qA,L),...
    tspan, y0, options);

tnum = linspace(0,tf,Ntime);
CABDnum = deval(sol,tnum);

Anum_k1_1e_8=CABDnum(1,:);
Bnum_k1_1e_8=CABDnum(2,:);
Dnum_k1_1e_8=CABDnum(3,:);
rnum_k1_1e_8=(3*MW*L^3.*Dnum_k1_1e_8/(2*pi*ro*a21)).^(1/3);

Q_k1_1e_8(i17)=trapz(tnum,Bnum_k1_1e_8);

% CABD_anal=CABD_anal_fun(tnum,k1,q,Vsoma,a21);
% Aanal_k1_1e_8=CABD_anal(1,:);
% Banal_k1_1e_8=CABD_anal(2,:);
% Danal_k1_1e_8=CABD_anal(3,:);
% ranal_k1_1e_8=(3.*Danal_k1_1e_8*Vsoma*MW/(4*pi*a21*NI*ro)).^(1/3);
Qanal_k1_1e_8(i17)=(qA/L)*tf^2/2;

%%%%%%%%%%%%%%%%
% k1=1e-4;
k1=1e-6;
% k1=1e-8;

options = odeset('RelTol',1e-10,'AbsTol',1e-10);
tspan = [0 tf];
y0 = [0 0 0];
sol = ode45(@(t,CABD) funCABD_int(t,CABD,k1,k2,T12A,T12B,T12D,theta12B,qA,L),...
    tspan, y0, options);
tnum = linspace(0,tf,Ntime);
CABDnum = deval(sol,tnum);

Anum_k1_1e_6=CABDnum(1,:);
Bnum_k1_1e_6=CABDnum(2,:);
Dnum_k1_1e_6=CABDnum(3,:);
rnum_k1_1e_6=(3*MW*L^3.*Dnum_k1_1e_6/(2*pi*ro*a21)).^(1/3);

Q_k1_1e_6(i17)=trapz(tnum,Bnum_k1_1e_6);

% CABD_anal=CABD_anal_fun(tnum,k1,q,Vsoma,a21);
% Aanal_k1_1e_6=CABD_anal(1,:);
% Banal_k1_1e_6=CABD_anal(2,:);
% Danal_k1_1e_6=CABD_anal(3,:);
% ranal_k1_1e_6=(3.*Danal_k1_1e_6*Vsoma*MW/(4*pi*a21*NI*ro)).^(1/3);
Qanal_k1_1e_6(i17)=(qA/L)*tf^2/2;

%%%%%%%%%%%%%%%%
k1=1e-4;
% k1=1e-6;
% k1=1e-8;

options = odeset('RelTol',1e-10,'AbsTol',1e-10);
tspan = [0 tf];
y0 = [0 0 0];
sol = ode45(@(t,CABD) funCABD_int(t,CABD,k1,k2,T12A,T12B,T12D,theta12B,qA,L),...
    tspan, y0, options);
tnum = linspace(0,tf,Ntime);
CABDnum = deval(sol,tnum);

Anum_k1_1e_4=CABDnum(1,:);
Bnum_k1_1e_4=CABDnum(2,:);
Dnum_k1_1e_4=CABDnum(3,:);
rnum_k1_1e_4=(3*MW*L^3.*Dnum_k1_1e_4/(2*pi*ro*a21)).^(1/3);

Q_k1_1e_4(i17)=trapz(tnum,Bnum_k1_1e_4);

% CABD_anal=CABD_anal_fun(tnum,k1,q,Vsoma,a21);
% Aanal_k1_1e_4=CABD_anal(1,:);
% Banal_k1_1e_4=CABD_anal(2,:);
% Danal_k1_1e_4=CABD_anal(3,:);
% ranal_k1_1e_4=(3.*Danal_k1_1e_4*Vsoma*MW/(4*pi*a21*NI*ro)).^(1/3);
Qanal_k1_1e_4(i17)=(qA/L)*tf^2/2;

end

close all

figure(1)
semilogx(theta12Blin,Q_k1_1e_8,'-rx','LineWidth',1.5,'MarkerIndices',1:20:length(theta12Blin))
hold on
semilogx(theta12Blin,Q_k1_1e_6,'--bsquare','LineWidth',1.5,'MarkerIndices',1:25:length(theta12Blin))
semilogx(theta12Blin,Q_k1_1e_4,'-.g^','LineWidth',1.5,'MarkerIndices',1:30:length(theta12Blin))
semilogx(theta12Blin,Qanal_k1_1e_8,':m>','LineWidth',1.5,'MarkerIndices',1:22:length(theta12Blin))
semilogx(theta12Blin,Qanal_k1_1e_6,'-c<','LineWidth',1.5,'MarkerIndices',1:27:length(theta12Blin))
semilogx(theta12Blin,Qanal_k1_1e_4,'--rpentagram','LineWidth',1.5,'MarkerIndices',1:32:length(theta12Blin))
semilogx(theta12Blin,2e9*Qanal_k1_1e_4./Qanal_k1_1e_4,'-kdiamond','LineWidth',1.5,'MarkerIndices',1:35:length(theta12Blin))
hold off
% title('T_{1/2,A}=4.61\times10^3 s')
title('T_{1/2,A}\rightarrow\infty')
xlabel('\theta_{1/2,B} (s)')
ylabel('\Xi (\muM s)');
legend('numerical k_1=10^{-8} s^{-1}','numerical k_1=10^{-6} s^{-1}','numerical k_1=10^{-4} s^{-1}',...
'analytical k_1=10^{-8} s^{-1}','analytical k_1=10^{-6} s^{-1}','analytical k_1=10^{-4} s^{-1}',...
'\Xi=2\times10^9 \muM s','Location','Best')

return

figure(1)
plot(tflin/(365*24*3600),Q_k1_1e_8,'-rx','LineWidth',1.5,'MarkerIndices',1:1:length(tflin));
hold on
plot(tflin/(365*24*3600),Q_k1_1e_6,'--bsquare','LineWidth',1.5,'MarkerIndices',1:3:length(tflin));
plot(tflin/(365*24*3600),Q_k1_1e_4,'-.g^','LineWidth',1.5,'MarkerIndices',1:7:length(tflin));
plot(tflin/(365*24*3600),Qanal_k1_1e_8,':m>','LineWidth',1.5,'MarkerIndices',1:2:length(tflin));
plot(tflin/(365*24*3600),Qanal_k1_1e_6,'-c<','LineWidth',1.5,'MarkerIndices',1:5:length(tflin));
plot(tflin/(365*24*3600),Qanal_k1_1e_4,'--ypentagram','LineWidth',1.5,'MarkerIndices',1:7:length(tflin));
hold off
% ylim([0 0.18])
% title('T_{1/2,A}->infinity, T_{1/2,B}->infinity, T_{1/2,D}->0')
xlabel('t (years)');
ylabel('\Xi (\muM s)');
legend('numerical q_{A,0}=1.1\times10^{-6} \muM \mum s^{-1}','numerical q_{A,0}=1.1\times10^{-5} \muM \mum s^{-1}','nnumerical q_{A,0}=1.1\times10^{-4} \muM \mum s^{-1}',...
'analytical q_{A,0}=1.1\times10^{-6} \muM \mum s^{-1}','analytical q_{A,0}=1.1\times10^{-5} \muM \mum s^{-1}','analytical q_{A,0}=1.1\times10^{-4} \muM \mum s^{-1}',...
'location','best')

figure(1)
plot(tflin/(365*24*3600),Q_k1_1e_8,'-rx','LineWidth',1.5,'MarkerIndices',1:1:length(tflin));
hold on
plot(tflin/(365*24*3600),Q_k1_1e_6,'--bsquare','LineWidth',1.5,'MarkerIndices',1:3:length(tflin));
plot(tflin/(365*24*3600),Q_k1_1e_4,'-.g^','LineWidth',1.5,'MarkerIndices',1:7:length(tflin));
plot(tflin/(365*24*3600),Qanal_k1_1e_8,':m>','LineWidth',1.5,'MarkerIndices',1:2:length(tflin));
plot(tflin/(365*24*3600),Qanal_k1_1e_6,'-c<','LineWidth',1.5,'MarkerIndices',1:5:length(tflin));
plot(tflin/(365*24*3600),Qanal_k1_1e_4,'--ypentagram','LineWidth',1.5,'MarkerIndices',1:7:length(tflin));
hold off
% ylim([0 0.18])
xlabel('t (years)');
ylabel('\Xi (\muM s)');
legend('numerical q_{A,0}=1.1\times10^{-6} \muM \mum s^{-1}','numerical q_{A,0}=1.1\times10^{-5} \muM \mum s^{-1}','nnumerical q_{A,0}=1.1\times10^{-4} \muM \mum s^{-1}',...
'analytical q_{A,0}=1.1\times10^{-6} \muM \mum s^{-1}','analytical q_{A,0}=1.1\times10^{-5} \muM \mum s^{-1}','analytical q_{A,0}=1.1\times10^{-4} \muM \mum s^{-1}',...
'location','best')

figure(2)
plot(tnum/(365*24*3600),rnum_k1_1e_8,'-rx','LineWidth',1.5,'MarkerIndices',1:15:length(rnum_k1_1e_8));
hold on
plot(tnum/(365*24*3600),rnum_k1_1e_6,'--bsquare','LineWidth',1.5,'MarkerIndices',1:20:length(rnum_k1_1e_6));
plot(tnum/(365*24*3600),rnum_k1_1e_4,'-.g^','LineWidth',1.5,'MarkerIndices',1:25:length(rnum_k1_1e_4));
hold off
title('T_{1/2,A}\rightarrow4.61e3 s, \theta_{1/2,B}\rightarrow1e7 s')
% title('T_{1/2,A}\rightarrow\infty, \theta_{1/2,B}\rightarrow\infty')
% title('T_{1/2,A}\rightarrow\infty, \theta_{1/2,B}\rightarrow0')
xlabel('t (years)');
ylabel('r_{ABP} (\mum)');
legend('numerical q_{A,0}=1.1\times10^{-6} \muM \mum s^{-1}','numerical q_{A,0}=1.1\times10^{-5} \muM \mum s^{-1}','nnumerical q_{A,0}=1.1\times10^{-4} \muM \mum s^{-1}',...
'location','best')

figure(3)
plot(rnum_k1_1e_8,Q_k1_1e_8,'-rx','LineWidth',1.5,'MarkerIndices',1:15:length(rnum_k1_1e_8));
hold on
plot(rnum_k1_1e_6,Q_k1_1e_6,'--bsquare','LineWidth',1.5,'MarkerIndices',1:20:length(rnum_k1_1e_6));
plot(rnum_k1_1e_4,Q_k1_1e_4,'-.g^','LineWidth',1.5,'MarkerIndices',1:25:length(rnum_k1_1e_4));
hold off
title('T_{1/2,A}\rightarrow4.61e3 s, \theta_{1/2,B}\rightarrow1e7 s')
% title('T_{1/2,A}\rightarrow\infty, \theta_{1/2,B}\rightarrow\infty')
% title('T_{1/2,A}\rightarrow\infty, \theta_{1/2,B}\rightarrow0')
xlabel('r_{ABP} (\mum)');
ylabel('\Xi (\muM s)');
legend('numerical q_{A,0}=1.1\times10^{-6} \muM \mum s^{-1}','numerical q_{A,0}=1.1\times10^{-5} \muM \mum s^{-1}','nnumerical q_{A,0}=1.1\times10^{-4} \muM \mum s^{-1}',...
'location','best')

figure(1)
plot(tnum/(365*24*3600),Anum_k1_1e_8,'-rx','LineWidth',1.5,'MarkerIndices',1:15:length(Anum_k1_1e_8));
hold on
plot(tnum/(365*24*3600),Anum_k1_1e_6,'--bsquare','LineWidth',1.5,'MarkerIndices',1:20:length(Anum_k1_1e_6));
plot(tnum/(365*24*3600),Anum_k1_1e_4,'-.g^','LineWidth',1.5,'MarkerIndices',1:25:length(Anum_k1_1e_4));
hold off
% ylim([0 0.18])
% title('T_{1/2,A}->infinity, T_{1/2,B}->infinity, T_{1/2,D}->0')
xlabel('t (years)');
ylabel('C_A (\muM)');
legend('numerical k_1=10^{-8} s^{-1}','numerical k_1=10^{-6} s^{-1}','numerical k_1=10^{-4} s^{-1}',...
    'location','best')

figure(2)
plot(tnum/(365*24*3600),Bnum_k1_1e_8,'-rx','LineWidth',1.5,'MarkerIndices',1:15:length(Bnum_k1_1e_8));
hold on
plot(tnum/(365*24*3600),Bnum_k1_1e_6,'--bsquare','LineWidth',1.5,'MarkerIndices',1:20:length(Bnum_k1_1e_6));
plot(tnum/(365*24*3600),Bnum_k1_1e_4,'-.^g','LineWidth',1.5,'MarkerIndices',1:25:length(Bnum_k1_1e_4));
hold off
% ylim([0 1])
% title('T_{1/2,A}->infinity, T_{1/2,B}->infinity, T_{1/2,D}->0')
xlabel('t (years)');
ylabel('C_B (\muM)');
legend('numerical k_1=10^{-8} s^{-1}','numerical k_1=10^{-6} s^{-1}','numerical k_1=10^{-4} s^{-1}',...
    'location','best')

figure(3)
plot(tnum/(365*24*3600),Dnum_k1_1e_8,'-rx','LineWidth',1.5,'MarkerIndices',1:15:length(Dnum_k1_1e_8));
hold on
plot(tnum/(365*24*3600),Dnum_k1_1e_6,'--bsquare','LineWidth',1.5,'MarkerIndices',1:20:length(Dnum_k1_1e_6));
plot(tnum/(365*24*3600),Dnum_k1_1e_4,'-.g^','LineWidth',1.5,'MarkerIndices',1:25:length(Dnum_k1_1e_4));
hold off
% title('T_{1/2,A}->infinity, T_{1/2,B}->infinity, T_{1/2,D}->0')
xlabel('t (years)');
ylabel('C_D (\muM)');
legend('numerical k_1=10^{-8} s^{-1}','numerical k_1=10^{-6} s^{-1}','numerical k_1=10^{-4} s^{-1}',...
    'location','best')

figure(4)
plot(tnum/(365*24*3600),rnum_k1_1e_8,'-rx','LineWidth',1.5,'MarkerIndices',1:15:length(rnum_k1_1e_8));
hold on
plot(tnum/(365*24*3600),rnum_k1_1e_6,'--bsquare','LineWidth',1.5,'MarkerIndices',1:20:length(rnum_k1_1e_6));
plot(tnum/(365*24*3600),rnum_k1_1e_4,'-.g^','LineWidth',1.5,'MarkerIndices',1:25:length(rnum_k1_1e_4));
hold off
% title('T_{1/2,A}->infinity, T_{1/2,B}->infinity, T_{1/2,D}->0')
xlabel('t (years)');
ylabel('r_{ABP} (\mum)');
legend('numerical k_1=10^{-8} s^{-1}','numerical k_1=10^{-6} s^{-1}','numerical k_1=10^{-4} s^{-1}',...
    'location','best')
