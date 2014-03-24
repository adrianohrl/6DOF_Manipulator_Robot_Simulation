%%   D&H Table:

%   i       a_i         alpha_i         d_i        theta_i       Ti_i-1
%   1        0           90            l1          theta_1* `     T1_0
%   2        l2            0            d2         theta_2*      T2_1
%   3        l3          -90             0         theta_3*      T3_2
%   4        0            90          d3 + l4      theta_4*      T4_3
%   5        0           -90             0         theta_5*      T5_4
%   6        0            0           l5 + l6      theta_6*      T6_5

function [T1_0 T2_0 T3_0 T4_0 T5_0 T6_0] = forwardKinematics(theta)

global l1 l2 d2 l3 d3 l4 l5 l6;

a_1 = 0;
alpha_1 = 90;
d_1 = l1;
T1_0 = getTi_i_1(a_1, alpha_1, d_1, theta(1));

a_2 = l2;
alpha_2 = 0;
d_2 = d2;
T2_1 = getTi_i_1(a_2, alpha_2, d_2, theta(2));
T2_0 = T1_0 * T2_1;

a_3 = l3;
alpha_3 = -90;
d_3 = 0;
T3_2 = getTi_i_1(a_3, alpha_3, d_3, theta(3));
T3_0 = T2_0 * T3_2;

a_4 = 0;
alpha_4 = 90;
d_4 = d3 + l4;
T4_3 = getTi_i_1(a_4, alpha_4, d_4, theta(4));
T4_0 = T3_0 * T4_3;

a_5 = 0;
alpha_5 = -90;
d_5 = 0;
T5_4 = getTi_i_1(a_5, alpha_5, d_5, theta(5));
T5_0 = T4_0 * T5_4;

a_6 = 0;
alpha_6 = 0;
d_6 = l5 + l6;
T6_5 = getTi_i_1(a_6, alpha_6, d_6, theta(6));
T6_0 = T5_0 * T6_5;

end