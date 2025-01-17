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
rnum_k1_1e_8_end(i17)=rnum_k1_1e_8(end);

% CABD_anal=CABD_anal_fun(tnum,k1,q,Vsoma,a21);
% Aanal_k1_1e_8=CABD_anal(1,:);
% Banal_k1_1e_8=CABD_anal(2,:);
% Danal_k1_1e_8=CABD_anal(3,:);
% ranal_k1_1e_8=(3.*Danal_k1_1e_8*Vsoma*MW/(4*pi*a21*NI*ro)).^(1/3);
Qanal_k1_1e_8(i17)=(qA/L)*tf^2/2;

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
rnum_k1_1e_6_end(i17)=rnum_k1_1e_6(end);

% CABD_anal=CABD_anal_fun(tnum,k1,q,Vsoma,a21);
% Aanal_k1_1e_6=CABD_anal(1,:);
% Banal_k1_1e_6=CABD_anal(2,:);
% Danal_k1_1e_6=CABD_anal(3,:);
% ranal_k1_1e_6=(3.*Danal_k1_1e_6*Vsoma*MW/(4*pi*a21*NI*ro)).^(1/3);
Qanal_k1_1e_6(i17)=(qA/L)*tf^2/2;

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
rnum_k1_1e_4_end(i17)=rnum_k1_1e_4(end);

% CABD_anal=CABD_anal_fun(tnum,k1,q,Vsoma,a21);
% Aanal_k1_1e_4=CABD_anal(1,:);
% Banal_k1_1e_4=CABD_anal(2,:);
% Danal_k1_1e_4=CABD_anal(3,:);
% ranal_k1_1e_4=(3.*Danal_k1_1e_4*Vsoma*MW/(4*pi*a21*NI*ro)).^(1/3);
Qanal_k1_1e_4(i17)=(qA/L)*tf^2/2;

end

close all

figure(1)
plot(tflin/(365*24*3600),Q_k1_1e_8,'-rx','LineWidth',1.5,'MarkerIndices',1:15:length(tflin));
hold on
plot(tflin/(365*24*3600),Q_k1_1e_6,'--bsquare','LineWidth',1.5,'MarkerIndices',1:20:length(tflin));
plot(tflin/(365*24*3600),Q_k1_1e_4,'-.g^','LineWidth',1.5,'MarkerIndices',1:25:length(tflin));
% plot(tflin/(365*24*3600),Qanal_k1_1e_8,':msquare','LineWidth',1.5,'MarkerIndices',1:28:length(tflin));
hold off
% ylim([0 0.18])
title('T_{1/2,A}=4.61\times10^3 s, \theta_{1/2,B}=10^7 s')
% title('T_{1/2,A}\rightarrow\infty, \theta_{1/2,B}\rightarrow\infty')
% title('T_{1/2,A}\rightarrow\infty, \theta_{1/2,B}\rightarrow0')
ylabel('\Xi (\muM s)');
xlabel('t (years)');
% legend('numerical k_2=9.44\times10^{-7} s^{-1}','numerical k_2=9.44\times10^{-6} s^{-1}','numerical k_2=9.44\times10^{-5} s^{-1}',...
%     'location','best') 
legend('numerical k_2=9.44\times10^{-7} \muM^{-1} s^{-1}','numerical k_2=9.44\times10^{-6} \muM^{-1} s^{-1}','numerical k_2=9.44\times10^{-5} \muM^{-1} s^{-1}',...
    'location','best') 

% create smaller axes in top right, and plot on it
axes('Position',[.27 .30 .25 .25])
box on
plot(tflin/(365*24*3600),Qanal_k1_1e_8,':m','LineWidth',1.5);
xlabel('t (years)');
ylabel('\Xi (\muM s)');
legend('analytical','location','best')

% return

figure(2)
plot(tflin/(365*24*3600),rnum_k1_1e_8_end,'-rx','LineWidth',1.5,'MarkerIndices',1:15:length(tflin));
hold on
plot(tflin/(365*24*3600),rnum_k1_1e_6_end,'--bsquare','LineWidth',1.5,'MarkerIndices',1:20:length(tflin));
plot(tflin/(365*24*3600),rnum_k1_1e_4_end,'-.g^','LineWidth',1.5,'MarkerIndices',1:25:length(tflin));
hold off
title('T_{1/2,A}=4.6\times10^3 s, \theta_{1/2,B}=10^7 s')
% title('T_{1/2,A}\rightarrow\infty, \theta_{1/2,B}\rightarrow\infty')
% title('T_{1/2,A}\rightarrow\infty, \theta_{1/2,B}\rightarrow0')
xlabel('t (years)');
ylabel('r_{ABP} (\mum)');
legend('numerical q_{A,0}=1.1\times10^{-6} \muM \mum s^{-1}','numerical q_{A,0}=1.1\times10^{-5} \muM \mum s^{-1}','nnumerical q_{A,0}=1.1\times10^{-4} \muM \mum s^{-1}',...
'location','best')

figure(3)
plot(rnum_k1_1e_8_end,Q_k1_1e_8,'-rx','LineWidth',1.5,'MarkerIndices',1:15:length(rnum_k1_1e_8_end));
hold on
plot(rnum_k1_1e_6_end,Q_k1_1e_6,'--bsquare','LineWidth',1.5,'MarkerIndices',1:20:length(rnum_k1_1e_6_end));
plot(rnum_k1_1e_4_end,Q_k1_1e_4,'-.g^','LineWidth',1.5,'MarkerIndices',1:25:length(rnum_k1_1e_4_end));
hold off
title('T_{1/2,A}=4.6\times10^3 s, \theta_{1/2,B}=10^7 s')
% title('T_{1/2,A}\rightarrow\infty, \theta_{1/2,B}\rightarrow\infty')
% title('T_{1/2,A}\rightarrow\infty, \theta_{1/2,B}\rightarrow0')
xlabel('r_{ABP} (\mum)');
ylabel('\Xi (\muM s)');
legend('numerical q_{A,0}=1.1\times10^{-6} \muM \mum s^{-1}','numerical q_{A,0}=1.1\times10^{-5} \muM \mum s^{-1}','nnumerical q_{A,0}=1.1\times10^{-4} \muM \mum s^{-1}',...
'location','best')
