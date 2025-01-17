function dydt = funCABD_int(t,y,k1,k2,T12A,T12B,T12D,theta12B,qA,L)
% y1=CA
% y2=CB
% y3=CD
dydt = zeros(3,1);

dydt(1) = -k1*y(1)-k2*y(1)*y(2)-y(1)*log(2)/T12A+qA/L;
  dydt(2) = k1*y(1)+k2*y(1)*y(2)-y(2)*log(2)/T12B-y(2)*log(2)/theta12B;
  dydt(3) = y(2)*log(2)/theta12B-y(3)*log(2)/T12D;
end