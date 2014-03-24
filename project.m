% ME4140 - Intro to Robotics
% Final Project Simulation
% Professor Dr. Canfield, Stephen
%
% Rossette Leite, Adriano Henrique 
% Mirapalheta Longaray, Matheus
% Araujo Leite, Michael Robson
%
% Description:
%   At first, this program import 6 objects generated from Solid Works software in
%   which are .STL files. 
%
%   Secondly, all this objects are moved to their origin and orientation.
%   The H&D table are applied to all them so that we can use the Forward 
%   Kinematics Technique, as well.
%
%   Finally, three diferent path are generated, and it is applied the
%   Inverse Kinematics equations to solve the joint variable problem so we
%   can find the desired tool position and orientation.


%% Preparing MATLAB to start working

clc
clear all
close all
format compact

%% Reading STL file

aux = 1e2;
base = stlread('base.stl'); base.facecolor = [0 0 0]; base.edgecolor = 'none'; base.vertices = base.vertices / aux;
link1 = stlread('link1.stl'); link1.facecolor = [.1 .1 .1]; link1.edgecolor = 'none'; link1.vertices = link1.vertices / aux;
link2 = stlread('link2.stl'); link2.facecolor = [.2 .2 .2]; link2.edgecolor = 'none'; link2.vertices = link2.vertices / aux;
link3 = stlread('link3.stl'); link3.facecolor = [.3 .3 .3]; link3.edgecolor = 'none'; link3.vertices = link3.vertices / aux;
link4 = stlread('link4.stl'); link4.facecolor = [.4 .4 .4]; link4.edgecolor = 'none'; link4.vertices = link4.vertices / aux;
link5 = stlread('link5.stl'); link5.facecolor = [.5 .5 .5]; link5.edgecolor = 'none'; link5.vertices = link5.vertices / aux;
end_effector = stlread('end_effector.stl'); end_effector.facecolor = [.6 .6 .6]; end_effector.edgecolor = 'none'; end_effector.vertices = end_effector.vertices / aux;

%% Declaring links fixed link lengths of the manipulator (from SolidWorks design)

global l1 l2 d2 l3 d3 l4 l5 l6;

l1 = 1800 / aux;
l2 = sqrt(500 ^ 2 + 3000 ^ 2) / aux;
d2 = 125 / aux;
l3 = 500 / aux;
d3 = 125 / aux;
l4 = 2500 / aux;
l5 = 100 / aux;
l6 = 300 / aux;

%% Moving parts to their origin and orientation

movePartsToOrigin();

theta = 0;
[T1_0 T2_0 T3_0 T4_0 T5_0 T6_0] = forwardKinematics(theta * ones(6, 1));
link1_cur = transformation(link1_new, T1_0);
link2_cur = transformation(link2_new, T2_0);
link3_cur = transformation(link3_new, T3_0);
link4_cur = transformation(link4_new, T4_0);
link5_cur = transformation(link5_new, T5_0);
end_effector_cur = transformation(end_effector_new, T6_0);

%% Using Inverse Kinematics to plot paths

global theta_2_priori theta_3_priori theta_4_priori theta_5_priori;
theta_2_priori = theta * pi / 180;
theta_3_priori = theta * pi / 180;
theta_4_priori = theta * pi / 180;
theta_5_priori = theta * pi / 180;


%% Creating path which describes a sphere. The end-effector points to the sphere center all the time.

m = 50; % number of circumferences
n = 32; % maximum number of points in a circumference

xc = 2500 / aux;
yc = 2500 / aux;
zc = 4000 / aux;
rho = 500 / aux;

i = 1;
phi = 0;
for j = 1 : n / 2
    for theta = linspace(0, 2 * pi, 2 * j - 1)
        T(:, :, i) = [sin(phi) * cos(theta)     cos(phi) * cos(theta)       -sin(theta)     xc + rho * sin(phi) * cos(theta)
            sin(phi) * sin(theta)               cos(phi) * sin(theta)       cos(theta)      yc + rho * sin(phi) * sin(theta)
            cos(phi)                            -sin(phi)                   0               zc + rho * cos(phi)
            0                                   0                           0               1];
        T(:, :, i) = T(:, :, i) * [0 0 -1 0; 0 1 0 0; 1 0 0 0; 0 0 0 1];
        i = i + 1;
    end;
    phi = phi +  pi / m;
end;
for j = 1 : m - n
    for theta = linspace(0, 2 * pi, n)
        T(:, :, i) = [sin(phi) * cos(theta)     cos(phi) * cos(theta)       -sin(theta)     xc + rho * sin(phi) * cos(theta)
            sin(phi) * sin(theta)               cos(phi) * sin(theta)       cos(theta)      yc + rho * sin(phi) * sin(theta)
            cos(phi)                            -sin(phi)                   0               zc + rho * cos(phi)
            0                                   0                           0               1];
        T(:, :, i) = T(:, :, i) * [0 0 -1 0; 0 1 0 0; 1 0 0 0; 0 0 0 1];
        i = i + 1;
    end;
    phi = phi +  pi / m;
end;
for j = n / 2 : -1 : 1
    for theta = linspace(0, 2 * pi, 2 * j - 1)
        T(:, :, i) = [sin(phi) * cos(theta)     cos(phi) * cos(theta)       -sin(theta)     xc + rho * sin(phi) * cos(theta)
            sin(phi) * sin(theta)               cos(phi) * sin(theta)       cos(theta)      yc + rho * sin(phi) * sin(theta)
            cos(phi)                            -sin(phi)                   0               zc + rho * cos(phi)
            0                                   0                           0               1];
        T(:, :, i) = T(:, :, i) * [0 0 -1 0; 0 1 0 0; 1 0 0 0; 0 0 0 1];
        i = i + 1;
    end;
    phi = phi +  pi / m;
end;

J = [];
tam = size(T, 3);
figure(1);
for i = 1 : tam
    % Inverse Kinematics
    [theta_1 theta_2 theta_3 theta_4 theta_5 theta_6] = inverseKinematics(T(:, :, i));
    J = cat(3, J, jacobianMatrix([theta_1 theta_2 theta_3 theta_4 theta_5 theta_6]));

    % Forward Kinematics
    [T1_0 T2_0 T3_0 T4_0 T5_0 T6_0] = forwardKinematics([theta_1 theta_2 theta_3 theta_4 theta_5 theta_6]);
    link1_cur = transformation(link1_new, T1_0);
    link2_cur = transformation(link2_new, T2_0);
    link3_cur = transformation(link3_new, T3_0);
    link4_cur = transformation(link4_new, T4_0);
    link5_cur = transformation(link5_new, T5_0);
    end_effector_cur = transformation(end_effector_new, T6_0);

    % Animate
    cla, hold on;
    patch(base_new); patch(link1_cur); patch(link2_cur); patch(link3_cur); 
    patch(link4_cur); patch(link5_cur); patch(end_effector_cur);
    patch(end_effector_cur);
    P1(i, 1) = T(1, 4, i); P1(i, 2) = T(2, 4, i); P1(i, 3) = T(3, 4, i);
    plot3(P1(:, 1), P1(:, 2), P1(:, 3), 'b');
    P2(i, 1) = T6_0(1, 4); P2(i, 2) = T6_0(2, 4); P2(i, 3) = T6_0(3, 4);
    plot3(P2(:, 1), P2(:, 2), P2(:, 3), 'r');
    hold off, axis equal;
    max = l1 + l2 + l3 + l4 + l5 + l6;
    min = -max;
    axis([min max min max 0 max]);
    view(3), xlabel('x'), ylabel('y'), zlabel('z'), grid on;
    pause(.00001)
end;

while(~waitforbuttonpress)
end;

%% Creating a path that describes the sentence THAT'S ALL FOLKS!.
scale = 5;
x0 = -35.5;
y0 = -25;
z0 = 0;
T = [];

for letter = 'THAT`S ALL FOLKS!'
    if letter ~= ' '
        T = cat(3, T, phrasePath(letter, scale, x0, y0, z0));
    end;
    x0 = x0 + .9 * scale;
    if letter == '`'
        x0 = x0 - .2 * scale;
    elseif letter == '!'
        x0 = x0 - .4 * scale;
    end;
end;

tam = size(T, 3);
figure(1);
for i = 1 : tam - 1
    % Inverse Kinematics
    [theta_1 theta_2 theta_3 theta_4 theta_5 theta_6] = inverseKinematics(T(:, :, i));
    J = cat(3, J, jacobianMatrix([theta_1 theta_2 theta_3 theta_4 theta_5 theta_6]));

    % Forward Kinematics
    [T1_0 T2_0 T3_0 T4_0 T5_0 T6_0] = forwardKinematics([theta_1 theta_2 theta_3 theta_4 theta_5 theta_6]);
    link1_cur = transformation(link1_new, T1_0);
    link2_cur = transformation(link2_new, T2_0);
    link3_cur = transformation(link3_new, T3_0);
    link4_cur = transformation(link4_new, T4_0);
    link5_cur = transformation(link5_new, T5_0);
    end_effector_cur = transformation(end_effector_new, T6_0);

    % Animate
    cla, hold on;
    patch(base_new); patch(link1_cur); patch(link2_cur); patch(link3_cur); 
    patch(link4_cur); patch(link5_cur); patch(end_effector_cur);
    if T(2, 4, i) == y0
        P3(i, 1) = T(1, 4, i); P3(i, 2) = T(2, 4, i); P3(i, 3) = T(3, 4, i);
        plot3(P3(:, 1), P3(:, 2), P3(:, 3), '.b');
        P4(i, 1) = T6_0(1, 4); P4(i, 2) = T6_0(2, 4); P4(i, 3) = T6_0(3, 4);
        plot3(P4(:, 1), P4(:, 2), P4(:, 3), '*r');
    end;
    hold off, axis equal;
    max = l1 + l2 + l3 + l4 + l5 + l6;
    min = -max;
    axis([min max min max 0 max]);
    view(3), xlabel('x'), ylabel('y'), zlabel('z'), grid on;
    pause(.0001);
end;

%% Play a song
music = wavread('ltune.wav');
sound(music, 10e3);

%% Creating a path the circle the previous word.
x_center = 0;
z_center = 2.5;
A = 38;
B = 10;
P4 = [];
T = [];
tam = 250;
beta = pi * linspace(-1, 1, tam);

for i = 1 : tam
    x = x_center + A * cos(beta(i));
    z = z_center + B * sin(beta(i));
    T(:, :, i) = [1 0 0 x; 0 0 -1 y0; 0 1 0 z; 0 0 0 1];
end;

figure(1);
for i = 1 : tam
    % Inverse Kinematics
    [theta_1 theta_2 theta_3 theta_4 theta_5 theta_6] = inverseKinematics(T(:, :, i));
    J = cat(3, J, jacobianMatrix([theta_1 theta_2 theta_3 theta_4 theta_5 theta_6]));

    % Forward Kinematics
    [T1_0 T2_0 T3_0 T4_0 T5_0 T6_0] = forwardKinematics([theta_1 theta_2 theta_3 theta_4 theta_5 theta_6]);
    link1_cur = transformation(link1_new, T1_0);
    link2_cur = transformation(link2_new, T2_0);
    link3_cur = transformation(link3_new, T3_0);
    link4_cur = transformation(link4_new, T4_0);
    link5_cur = transformation(link5_new, T5_0);
    end_effector_cur = transformation(end_effector_new, T6_0);

    % Animate
    cla, hold on;
    patch(base_new); patch(link1_cur); patch(link2_cur); patch(link3_cur); 
    patch(link4_cur); patch(link5_cur); patch(end_effector_cur);
    if T(2, 4, i) == y0
        plot3(P3(:, 1), P3(:, 2), P3(:, 3), '.b');
        P4(i, 1) = T6_0(1, 4); P4(i, 2) = T6_0(2, 4); P4(i, 3) = T6_0(3, 4);
        plot3(P4(:, 1), P4(:, 2), P4(:, 3), '*r');
    end
    hold off, axis equal;
    max = l1 + l2 + l3 + l4 + l5 + l6;
    min = -max;
    axis([min max min max 0 max]);
    view(3), xlabel('x'), ylabel('y'), zlabel('z'), grid on;
    pause(.00001);
end;

%% Ploting joint velocities graphs

V(1, :) = J(1, i, :);
V(2, :) = J(2, i, :);
V(3, :) = J(3, i, :);
w(1, :) = J(4, i, :);
w(2, :) = J(5, i, :);
w(3, :) = J(6, i, :);
point = 1 : size(J, 3);

for i = 1 : 6
    %Linear Velocities
    figure(i + 1);
    subplot(3, 2, 1);
    plot(point, V(1, :), 'LineWidth', 2);
    ylabel('Vx');
    xlabel('Point');
    title(['Joint ' num2str(i) ' Vx']);
    subplot(3, 2, 3);
    plot(point, V(2, :), 'LineWidth', 2);
    ylabel('Vy');
    xlabel('Point');
    title(['Joint ' num2str(i) ' Vy']);
    subplot(3, 2, 5);
    plot(point, V(3, :), 'LineWidth', 2);
    ylabel('Vz');
    xlabel('Point');
    title(['Joint ' num2str(i) ' Vz']);
    %Angular Velocities
    subplot(3, 2, 2);
    plot(point, w(1, :), 'LineWidth', 2);
    ylabel('\omegax');
    xlabel('Point');
    title(['Joint ' num2str(i) ' \omegax']);
    subplot(3, 2, 4);
    plot(point, w(2, :), 'LineWidth', 2);
    ylabel('\omegay');
    xlabel('Point');
    title(['Joint ' num2str(i) ' \omegay']);
    subplot(3, 2, 6);
    plot(point, w(3, :), 'LineWidth', 2);
    ylabel('\omegaz');
    xlabel('Point');
    title(['Joint ' num2str(i) ' \omegaz']);
end;
