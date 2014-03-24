function [f df] = wristPositionEquations(theta)

global l1 d1 l2 d2 l3 d3 l4 x y z;

theta_2 = theta(1);
theta_3 = theta(2);

K = (x ^ 2 + y ^ 2 + (z + l1) ^ 2 - l2 ^ 2 - l3 ^ 2 - (d3 + l4) ^ 2 - d1 ^ 2 - d2 ^ 2) / 2;

f(1, 1) = d1 * ((d3 + l4) * sin(theta_2 + theta_3) - l3 * cos(theta_2 + theta_3)) - l2 * ((d3 + l4) * sin(theta_3) - l3 * cos(theta_3)) - d1 * l2 * cos(theta_2) - K;
f(2, 1) = (d3 + l4) * cos(theta_2 + theta_3) + l3 * sin(theta_2 + theta_3) + l2 * cos(theta_2) + l1 - z;

df(1, 1) = d1 * ((d3 + l4) * cos(theta_2 + theta_3) + l3 * sin(theta_2 + theta_3)) + d1 * l2 * sin(theta_2);
df(1, 2) = d1 * ((d3 + l4) * cos(theta_2 + theta_3) + l3 * sin(theta_2 + theta_3)) - l2 * ((d3 + l4) * cos(theta_3) + l3 * sin(theta_3));
df(2, 1) = -(d3 + l4) * sin(theta_2 + theta_3) + l3 * cos(theta_2 + theta_3) -l2 * sin(theta_2);
df(2, 2) = -(d3 + l4) * sin(theta_2 + theta_3) + l3 * cos(theta_2 + theta_3);

end