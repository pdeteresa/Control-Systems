w = logspace(0,4,5000); % frequency range 10^0 to 10^4
% origin slope = -40 dB/dec
% initial magnitude = 27.6 dB at w = 10^0
kb = 10^(27.6/20); % kb = 23.9883

%g1 with kb and pole at origin
% g2 = tf(kb*[1 0],[1/2.87 1]);
z1 = (1/2)*10^(-(1.98+11.84)/20); % w = 9.57 rad/s
z2 = (1/2)*10^((-100+90)/20); % w = 119.5 ~120 rad/s
% g3 = tf(kb*[1 0],conv([1/9.57^2 2*z1/9.57 1],[1 0 0]));
% num = kb*conv([1/50 1],[1/120^2 2*z2/120 1]);
% den = conv([1/9.57^2 2*z1/9.57 1],[1 0 0]);

num = kb*conv([1/140 1],conv([1/50 1],[1/120^2 2*z2/120 1]));
den = conv([1/500 1],conv([1/10^2 2*z1/10 1],[1 0 0]));
[mag,ph] = bode(num,den,w);
% semilogx(w,20*log10(mag),'g')
% semilogx(w,ph,'g')