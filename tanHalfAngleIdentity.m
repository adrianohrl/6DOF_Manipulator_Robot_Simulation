% Using the "Tan Half Angle Identity":
%
%   a * sin(theta) + b * cos(theta) = c

function theta = tanHalfAngleIdentity(a, b, c)

A = c + b;
B = -2 * a;
C = c - b;
if A ~= 0
    % solving: A * t ^ 2 + B * t + C = 0
    t = (-B + sqrt(B ^ 2 - 4 * A * C)) / (2 * A);
    theta(1) = 2 * atan(t);
    t = (-B - sqrt(B ^ 2 - 4 * A * C)) / (2 * A);
    theta(2) = 2 * atan(t);
else
    theta = [0 pi];
end;

end