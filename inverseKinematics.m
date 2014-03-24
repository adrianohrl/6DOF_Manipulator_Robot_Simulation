function [theta_1 theta_2 theta_3 theta_4 theta_5 theta_6] = inverseKinematics(T_given)

global l1 l2 d2 l3 d3 l4 l5 l6 theta_2_priori theta_3_priori theta_4_priori theta_5_priori;
% PART 1: (Wrist Position)

%         [x']   [x]               [r13]
%   Pc =  [y'] = [y] - (l5 + l6) * [r23]
%         [z']   [z]               [r33]

x = T_given(1, 4) - (l5 + l6) * T_given(1, 3);
y = T_given(2, 4) - (l5 + l6) * T_given(2, 3);
z = T_given(3, 4) - (l5 + l6) * T_given(3, 3);

K = .5 * (l2 ^ 2 + l3 ^ 2 + (l4 + d3) ^ 2 + d2 ^ 2  - x ^ 2  - y ^ 2  - (z - l1) ^ 2) / l2;
% Using the "Another Approach" to find theta_3:
%
%   a * sin(theta_3) + b * cos(theta_3) = c
%
% w/:
a = d3 + l4;
b = -l3;
c = K;
theta = tanHalfAngleIdentity(a, b, c);                       %2 solutions
if abs(abs(theta(1)) - abs(theta_3_priori)) == abs(abs(theta(2)) - abs(theta_3_priori))
    if abs(theta(1) - theta_3_priori) < abs(theta(2) - theta_3_priori)
        theta_3 = theta(1);
    else
        theta_3 = theta(2);
    end;
elseif abs(abs(theta(1)) - abs(theta_3_priori)) < abs(abs(theta(2)) - abs(theta_3_priori))
    theta_3 = theta(1);
else
    theta_3 = theta(2);
end;
theta_3_priori = theta_3;

% Known theta_3:
% Using the "Another Approach" to find theta_2:
%
%   a * sin(theta_2) + b * cos(theta_2) = c
%
% w/:
a = -(d3 + l4) * sin(theta_3) + l3 * cos(theta_3) + l2;
b = (d3 + l4) * cos(theta_3) + l3 * sin(theta_3);
c = z - l1;
theta = tanHalfAngleIdentity(a, b, c);                        %2 solutions
if abs(abs(theta(1)) - abs(theta_2_priori)) == abs(abs(theta(2)) - abs(theta_2_priori))
    if abs(theta(1) - theta_2_priori) < abs(theta(2) - theta_2_priori)
        theta_2 = theta(1);
    else
        theta_2 = theta(2);
    end;
elseif abs(abs(theta(1)) - abs(theta_2_priori)) < abs(abs(theta(2)) - abs(theta_2_priori))
    theta_2 = theta(1);
else
    theta_2 = theta(2);
end;
theta_2_priori = theta_2;

% Known theta_2 and theta_3:
% Using the "Two equations for theta_1":
%
%   a * cos(theta_1) - b * sin(theta_1) = x_
%   a * sin(theta_1) + b * cos(theta_1) = y_
%
% w/:
a = -(d3 + l4) * sin(theta_2 + theta_3) + l3 * cos(theta_2 + theta_3) + l2 * cos(theta_2);
b = -d2;
x_ = x;
y_ = y;
theta_1 = twoEquationsForTheta(a, b, x_, y_);                   %1 solution

r21 = -sin(theta_2 + theta_3) * (T_given(1, 1) * cos(theta_1) + T_given(2, 1) * sin(theta_1)) + T_given(3, 1) * cos(theta_2 + theta_3);
r22 = -sin(theta_2 + theta_3) * (T_given(1, 2) * cos(theta_1) + T_given(2, 2) * sin(theta_1)) + T_given(3, 2) * cos(theta_2 + theta_3);
r23 = -sin(theta_2 + theta_3) * (T_given(1, 3) * cos(theta_1) + T_given(2, 3) * sin(theta_1)) + T_given(3, 3) * cos(theta_2 + theta_3);

% Known theta_1, theta_2 and theta_3:
theta = acos(r23) * [1 -1];                     %2 solutions
if abs(abs(theta(1)) - abs(theta_5_priori)) == abs(abs(theta(2)) - abs(theta_5_priori))
    if abs(theta(1) - theta_5_priori) < abs(theta(2) - theta_5_priori)
        theta_5 = theta(1);
    else
        theta_5 = theta(2);
    end;
elseif abs(abs(theta(1)) - abs(theta_5_priori)) < abs(abs(theta(2)) - abs(theta_5_priori))
    theta_5 = theta(1);
else
    theta_5 = theta(2);
end;
theta_5_priori = theta_5;

% Known theta_1, theta_2, theta_3 and theta_5:
if theta_5 == 0 || theta_5 == pi
    theta_6 = pi / 2;
else
    theta_6 = atan2(-r22 / sin(theta_5), r21 / sin(theta_5));   %1 solution
end;

r31 = -sin(theta_6);
% Using the "Another Approach" to find theta_4:
%
%   a * sin(theta_4) + b * cos(theta_4) = c
%
% w/:
a = T_given(1, 1) * cos(theta_1) * cos(theta_2 + theta_3) + T_given(2, 1) * sin(theta_1) * cos(theta_2 + theta_3) + T_given(3, 1) * sin(theta_2 + theta_3);
b = T_given(1, 1) * sin(theta_1) - T_given(2, 1) * cos(theta_1);
c = r31;
theta = tanHalfAngleIdentity(a, b, c);                       %2 solutions

if abs(abs(theta(1)) - abs(theta_4_priori)) == abs(abs(theta(2)) - abs(theta_4_priori))
    if abs(theta(1) - theta_4_priori) < abs(theta(2) - theta_4_priori)
        theta_4 = theta(1);
    else
        theta_4 = theta(2);
    end;
elseif abs(abs(theta(1)) - abs(theta_4_priori)) < abs(abs(theta(2)) - abs(theta_4_priori))
    theta_4 = theta(1);
else
    theta_4 = theta(2);
end;
theta_4_priori = theta_4;

% converting to degrees
theta_1 = theta_1 * 180 / pi;
theta_2 = theta_2 * 180 / pi;
theta_3 = theta_3 * 180 / pi;
theta_4 = theta_4 * 180 / pi;
theta_5 = theta_5 * 180 / pi;
theta_6 = theta_6 * 180 / pi;

end