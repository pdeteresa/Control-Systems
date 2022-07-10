% F-16 Aircraft Longitudinal and Lateral-Directional Analysis
% Linear Dynamics - Longitudinal and Lateral-Directional
% F-16 High Performance Aircraft Model (NASA-TP-1538, Dec 1979)
% Rectilinear, Wings Horizontal, Level Equilibrium
% H = 20,000 ft
% VT = 700 ft/s
% THTA = 1.9970 deg
% cbar = 11.32 ft
% xcmb = 0.30 -
% Longitudinal Linear Model
% States: x = [vcm alfa q thta]'
% Inputs: u = [elev thtl]'
% Units: s, ft, rad, -
 a_long = [-1.0889e-02 2.8539e+01 -2.3779e+01 -3.2154e+01
 -9.1949e-05 -7.9044e-01 9.4864e-01 -1.6017e-03
 3.1611e-05 -6.3460e-01 -1.0254e+00 0
 0 0 1.0000e+00 0];
 b_long = [ 9.9851e+00 1.6333e+01
 -1.0219e-01 0
 -1.1464e+01 0
 0 0];
 c_long = eye(4);
 d_long = zeros(4,2);
% Lateral-Directional Linear Model
% States: x = [beta p r phi]'
% Inputs: u = [ail rdr]'
% Units: s, rad
 a_latdir = [-2.2351e-01 3.4561e-02 -9.9532e-01 4.5935e-02
 -3.0041e+01 -2.7294e+00 5.1704e-01 0
 8.3569e+00 -1.4062e-02 -3.6752e-01 0
 0 1.0000e+00 3.4868e-02 0];
 b_latdir = [ 1.3281e-02 3.5281e-02
 -4.3692e+01 7.7641e+00
 -1.8776e+00 -3.8313e+00
 0 0];
 c_latdir = eye(4);
 d_latdir = zeros(4,2);
% Compute Constants
 d2r = pi/180; % rad/deg
 r2d = 180/pi; % deg/rad
% Compute Time Responses for Elevator Input - Problem 1
 t_long = linspace(0,10,1001)';
 u_long = [-0.1*ones(1,1001)*d2r
 +0.0*ones(1,1001) ]';
 [y_long,x_long] = lsim(a_long,b_long,c_long,d_long,u_long,t_long);
 figure(1), clf
 plot(t_long,x_long(:,1),'-k')
 grid
 xlabel('t (s)'), ylabel('v_c_m (ft/s)')
 figure(2), clf
 plot(t_long,x_long(:,2)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('\alpha (deg)')
 figure(3), clf
 plot(t_long,x_long(:,3)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('q (deg/s)')
 figure(4), clf
 plot(t_long,x_long(:,4)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('\theta (deg)')
% Compute Time Responses for Throttle Input - Problem 1
 t_long = linspace(0,10,1001)';
 u_long = [-0.0*ones(1,1001)*d2r
 +0.1*ones(1,1001) ]';
 [y_long,x_long] = lsim(a_long,b_long,c_long,d_long,u_long,t_long);
 figure(5), clf
 plot(t_long,x_long(:,1),'-k')
 grid
 xlabel('t (s)'), ylabel('v_c_m (ft/s)')
 figure(6), clf
 plot(t_long,x_long(:,2)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('\alpha (deg)')
 figure(7), clf
 plot(t_long,x_long(:,3)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('q (deg/s)')
 figure(8), clf
 plot(t_long,x_long(:,4)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('\theta (deg)')
% Compute Steady State Responses for Elevator-Throttle Input
% Problem 2 - Question 6
 u_long_step = [-0.1*d2r +0.1].'; % deg, - (dE,dTh)
 x_long_inf = -inv(a_long)*b_long*u_long_step;
 v_cm_inf = x_long_inf(1);
 alfa_inf = x_long_inf(2)*r2d;
 q_inf = x_long_inf(3)*r2d;
 thta_inf = x_long_inf(4)*r2d;
% Compute Time Responses for Aileron - Problem 3
 t_latdir = linspace(0,10,1001)';
 u_latdir = [-1*ones(1,100)*d2r 0*ones(1,901)*d2r
 -0*ones(1,100)*d2r 0*ones(1,901)*d2r]';
 [y_latdir,x_latdir] = lsim(a_latdir,b_latdir,c_latdir,d_latdir,u_latdir,t_latdir);
 figure(9), clf
 plot(t_latdir,x_latdir(:,1)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('\beta (deg)')
 figure(10), clf
 plot(t_latdir,x_latdir (:,2)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('p (deg/s)')
  figure(11), clf
 plot(t_latdir,x_latdir(:,3)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('r (deg/s)')
 figure(12), clf
 plot(t_latdir,x_latdir(:,4)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('\phi (deg)')
% Compute Time Responses for Rudder Input - Problem 3
 t_latdir = linspace(0,10,1001)';
 u_latdir = [-0*ones(1,100)*d2r 0*ones(1,901)*d2r
 -1*ones(1,100)*d2r 0*ones(1,901)*d2r]';
 [y_latdir,x_latdir] = lsim(a_latdir,b_latdir,c_latdir,d_latdir,u_latdir,t_latdir);
 figure(13), clf
 plot(t_latdir,x_latdir(:,1)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('\beta (deg)')
 figure(14), clf
 plot(t_latdir,x_latdir (:,2)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('p (deg/s)')
 figure(15), clf
 plot(t_latdir,x_latdir(:,3)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('r (deg/s)')
 figure(16), clf
 plot(t_latdir,x_latdir(:,4)*r2d,'-k')
 grid
 xlabel('t (s)'), ylabel('\phi (deg)')
% Compute Steady State Response for Aileron Input
% Problem 4 - Question 2
 THTA = 1.9970; % deg
 a_latdir_5s = [a_latdir zeros(4,1)
 0 0 1/cosd(THTA) 0 0 ];
 b_latdir_5s = [b_latdir
 zeros(1,2)];
 c_latdir_5s = eye(5);
 d_latdir_5s = zeros(5,2);
 t_latdir_5s = linspace(0,2000,200001)';
 u_latdir_5s = [-1*ones(1,100)*d2r 0*ones(1,199901)*d2r
 -0*ones(1,100)*d2r 0*ones(1,199901)*d2r]';
 [y_latdir_5s,x_latdir_5s] = lsim(a_latdir_5s,b_latdir_5s,c_latdir_5s,d_latdir_5s,u_latdir_5s,t_latdir_5s);
 x_latdir_inf = x_latdir_5s(end,:);
 psi_inf = x_latdir_inf(5)*r2d;
% Compute Step Inputs for Steady State Yaw Rate - Roll Angle Response
% Problem 4 - Question 3
 y_til = [+0.7*d2r +15*d2r].'; % deg/s, deg (r,phi)
 B_til = [a_latdir(:,3) a_latdir(:,4)];
 A_til = [b_latdir(:,1) b_latdir(:,2) a_latdir(:,1) a_latdir(:,2)];
x_til = -inv(A_til)*B_til*y_til;
 dA_bar = x_til(1)*r2d;
 dR_bar = x_til(2)*r2d;
 beta_inf = x_til(3)*r2d;
 p_inf = x_til(4)*r2d;