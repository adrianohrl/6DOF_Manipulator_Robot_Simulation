% Moving base to align with frame 0
T = [1    0    0   -625 / aux
    0    1    0   -625 / aux
    0    0    1    0
    0    0    0    1];
base_new = transformation(base, T);


% Moving link1 to align with frame 0
T = [1    0    0   -750 / aux
    0    1    0   -750 / aux
    0    0    1   -1250 / aux
    0    0    0    1];
link1_new = transformation(link1, T);

T = [0    1    0    0
    0    0    1    0
    1    0    0    0
    0    0    0    1];
link1_new = transformation(link1_new, T);

% Moving link2 to align with frame 0
T = [1    0    0   -375 / aux
    0    1    0   -1000 / aux
    0    0    1   -3500 / aux
    0    0    0    1];
link2_new = transformation(link2, T);

T = [0    0    1    0
    0    1    0    0
    -1    0    0    0
    0    0    0    1];
link2_new = transformation(link2_new, T);

theta = -atan(500 / 3000);
T = [cos(theta)   -sin(theta)    0     0
    sin(theta)    cos(theta)    0     0
    0              0         1     0
    0              0         0     1];
link2_new = transformation(link2_new, T);

% Moving link3 to align with frame 0
T = [1   0    0   -250 / aux
    0   1    0   -750 / aux
    0   0    1   -125 / aux
    0   0    0    1];
link3_new = transformation(link3, T);

T = [0    1    0    0
    0    0    1    0
    1    0    0    0
    0    0    0    1];
link3_new = transformation(link3_new, T);

% Moving link4 to align with frame 0
T = [1    0    0   -125 / aux
    0    1    0   -2000 / aux
    0    0    1   -125 / aux
    0    0    0    1];
link4_new = transformation(link4, T);

% Moving link5 to align with frame 0
T = [1    0    0   -125 / aux
    0    1    0   -75 / aux
    0    0    1   -75 / aux
    0    0    0    1];
link5_new = transformation(link5, T);

T = [0   -1    0    0
    1    0    0    0
    0    0    1    0
    0    0    0    1];
link5_new = transformation(link5_new, T);

% Moving end_effector to align with frame 0
T = [1   0    0   -150 * cosd(30) / aux
    0   1    0       -100 / aux
    0   0    1       -300 / aux
    0   0    0         1];
end_effector_new = transformation(end_effector, T);

%% Ploting each part at the origin:

% figure, axis equal, view(3), xlabel('x'), ylabel('y'), zlabel('z'), grid on, hold on;
% patch(base_new);
% patch(link1_new);
% patch(link2_new);
% patch(link3_new);
% patch(link4_new);
% patch(link5_new);
% patch(end_effector_new);