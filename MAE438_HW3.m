w = logspace(-1,4,5000); % freq range
kb = 10^((-77.15+20)/20); % kb = 0.0014
zeta_z3 = (1/2)*10^((-22)/20);
zeta_p4 = (1/2)*10^((-10)/20);

z1 = [1/4 1];
z2 = [1 0];
z3 = [1/(14.08)^2 2*zeta_z3/14.08 1];
p1 = [1/20 1];
p2 = [1/75 1];
p3 = [1/900 1];
p4 = [1/66^2 2*zeta_p4/66 1];
num = kb*conv(z3,conv(z2,z1));
den = conv(p4,conv(p3,conv(p2,p1)));
[mag,ph] = bode(num,den,w);
G_s = tf(num, den);

% semilogx(w,20*log10(mag),'m')
% semilogx(w,ph,'g')