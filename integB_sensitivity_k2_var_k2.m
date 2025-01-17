clearvars

%dimensional input parameters

tf=10*3600*24*365;
tfyear=tf/(3600*24*365);

CA0=0;
% CAx0=0.3e-3;
k1=2.22e-9;
k2=9.44e-6;
T12A=4.61e3;
% T12A=1e20;

T12B=1e20;

T12D=1e20;

% theta12B=1e20;
% theta12B=1e1;
theta12B=1e7;

qA=1.1e-5;
L=50;
ro=1.35e-12;
MW=4.51e3;
a21=1e21;

delta=0.001;

Ntime=100;
npoints=100;
tflin=linspace(1,tf,npoints);

for i17 = 1:npoints
    i17
tf=tflin(i17);

%%%%%%%%%%%%%%%%
% k2=9.44e-6*10;
% k2=9.44e-6;
k2=9.44e-6*0.1;

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

%%%

k2=k2*(1+delta);

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

Q_k1_1e_8_delta(i17)=trapz(tnum,Bnum_k1_1e_8);

Qanal_k1_1e_8_delta(i17)=(qA/L)*tf^2/2;

S_k1_1e_8(i17)=(1/Q_k1_1e_8(i17))*(Q_k1_1e_8_delta(i17)-Q_k1_1e_8(i17))/delta;

%%%%%%%%%%%%%%%%
% k2=9.44e-6*10;
k2=9.44e-6;
% k2=9.44e-6*0.1;

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

%%%

k2=k2*(1+delta);

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

Q_k1_1e_6_delta(i17)=trapz(tnum,Bnum_k1_1e_6);

Qanal_k1_1e_6_delta(i17)=(qA/L)*tf^2/2;

S_k1_1e_6(i17)=(1/Q_k1_1e_6(i17))*(Q_k1_1e_6_delta(i17)-Q_k1_1e_6(i17))/delta;

%%%%%%%%%%%%%%%%
k2=9.44e-6*10;
% k2=9.44e-6;
% k2=9.44e-6*0.1;

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

%%%

k2=k2*(1+delta);

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

Q_k1_1e_4_delta(i17)=trapz(tnum,Bnum_k1_1e_4);

Qanal_k1_1e_4_delta(i17)=(qA/L)*tf^2/2;

S_k1_1e_4(i17)=(1/Q_k1_1e_4(i17))*(Q_k1_1e_4_delta(i17)-Q_k1_1e_4(i17))/delta;

end

close all

figure(1)
plot(tflin/(365*24*3600),S_k1_1e_8,'-rx','LineWidth',1.5,'MarkerIndices',1:20:length(tflin))
hold on
plot(tflin/(365*24*3600),S_k1_1e_6,'--bsquare','LineWidth',1.5,'MarkerIndices',1:25:length(tflin))
plot(tflin/(365*24*3600),S_k1_1e_4,'-.g^','LineWidth',1.5,'MarkerIndices',1:30:length(tflin))
plot(tflin/(365*24*3600),0.*S_k1_1e_4,':msquare','LineWidth',1.5,'MarkerIndices',1:33:length(tflin))
hold off
title('T_{1/2,A}=4.61\times10^3 s, \theta_{1/2,B}=10^7 s')
% title('T_{1/2,A}\rightarrow\infty, \theta_{1/2,B}\rightarrow\infty')
% title('T_{1/2,A}\rightarrow\infty, \theta_{1/2,B}\rightarrow0')
xlabel('t (years)')
ylabel('S^{\Xi}_{k_2}')
legend('numerical k_2=9.44\times10^{-7} \muM^{-1} s^{-1}','numerical k_2=9.44\times10^{-6} \muM^{-1} s^{-1}','numerical k_2=9.44\times10^{-5} \muM^{-1} s^{-1}',...
    'analytical','location','best')

