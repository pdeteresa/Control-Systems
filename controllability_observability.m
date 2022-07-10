% find controllability test matrix Q without using MATLAB ctrb function
% Q = [B A*B A^2*B ... A^(n-1)*B]
A1 = [-4 1 2;1 -5 3;2 0 -6];
B1 = [1;0.5;2];
Q1 = [B1,A1*B1,A1^2*B1];
uncontrollability1 = length(A1)-rank(Q1)

A2 = [-2 0 0 0;
    0 -4 0 0;
    0 0 -5 0;
    0 0 0 0];
B2 = [1 0;0 1;2 0;10 5];
B22 = [1;0;2;10];
Q2 = [B2,A2*B2,A2^2*B2,A2^3*B2];
Q22 = [B22,A2*B22,A2^2*B22,A2^3*B22];
uncontrollability2 = length(A2)-rank(Q2)
uncontrollability22 = length(A2)-rank(Q22)

% find observability test matrix O and evaluate system for observability
A3 = [-4 1 2;1 -5 3;2 0 -6];
C3 = [0 1 0];
O3 = [C3;(A3'*C3')';(A3'^2*C3')'];
%      0     1     0
%      1    -5     3
%     -3    26   -31
unobservable3 = length(A3)-rank(O3)

A4 = [-2 0 0 0;0 -4 0 0;0 0 -5 0;0 0 0 0];
C4 = [1 2 0 1];
O4 = [C4;(A4'*C4')';(A4'^2*C4')';(A4'^3*C4')'];
unobservable4 = length(A4)-rank(O4)