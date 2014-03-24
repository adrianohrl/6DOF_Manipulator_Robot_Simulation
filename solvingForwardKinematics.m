%% Solving symbolicly the Forward Kinematics for this project
clc
clear all

syms l1 d1 l2 d2 l3 d3 l4 l5 l6;
syms theta_1 theta_2 theta_3 theta_4 theta_5 theta_6; 

%%   D&H Table:

%   i       a_i         alpha_i         d_i        theta_i       Ti_i-1
%   1       -d1           90            l1         theta_1* `    T1_0
%   2        l2            0            d2         theta_2*      T2_1
%   3        l3          -90             0         theta_3*      T3_2
%   4        0            90          d3 + l4      theta_4*      T4_3
%   5        0           -90             0         theta_5*      T5_4
%   6        0            0           l5 + l6      theta_6*      T6_5

a_1 = 0;
alpha_1 = 90;
d_1 = l1;
T1_0 = getSymTi_i_1(a_1, alpha_1, d_1, theta_1);

a_2 = l2;
alpha_2 = 0;
d_2 = d2;
T2_1 = getSymTi_i_1(a_2, alpha_2, d_2, theta_2);
T2_0 = T1_0 * T2_1;

a_3 = l3;
alpha_3 = -90;
d_3 = 0;
T3_2 = getSymTi_i_1(a_3, alpha_3, d_3, theta_3);
T3_0 = T2_0 * T3_2;

a_4 = 0;
alpha_4 = 90;
d_4 = d3 + l4;
T4_3 = getSymTi_i_1(a_4, alpha_4, d_4, theta_4);
T4_0 = T3_0 * T4_3;

a_5 = 0;
alpha_5 = -90;
d_5 = 0;
T5_4 = getSymTi_i_1(a_5, alpha_5, d_5, theta_5);
T5_0 = T4_0 * T5_4;

a_6 = 0;
alpha_6 = 0;
d_6 = l5 + l6;
T6_5 = getSymTi_i_1(a_6, alpha_6, d_6, theta_6);
T6_0 = T5_0 * T6_5;

T6_4 = simple(T5_4 * T6_5);
T4_0 = simple(T4_0);

save symbolic_Ts l1 d1 l2 d2 l3 d3 l4 l5 l6 theta_1 theta_2 theta_3 theta_4 theta_5 theta_6 T1_0 T2_1 T3_2 T4_3 T5_4 T6_5 