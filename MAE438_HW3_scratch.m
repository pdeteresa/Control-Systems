w = logspace(-1,4,5000); % freq range
% origin slope = +20 dB/dec
% initial magnitude = -77.15 dB at w = 10^-1
kb = 10^((-77.15+20)/20); % kb = 0.0014
z1 = (1/2)*10^((-22)/20);
p1 = (1/2)*10^((-10)/20);
% g1 --- kb and zero at origin
% num = kb*[1 0];
% den = 1;

% g2 --- complex zero at w = 14.08 rad/s
num = kb*conv([1/4 1],conv([1 0],[1/(14.08)^2 2*z1/14.08 1]));
den = conv([1/900 1],conv([1/75 1],conv([1/20 1],[1/66^2 2*p1/66 1])));
[mag,ph] = bode(num,den,w);
% semilogx(w,20*log10(mag),'g')
% semilogx(w,ph,'g')