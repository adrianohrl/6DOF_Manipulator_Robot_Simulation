% Using the "Two equations for theta":
%
%   a * cos(theta) - b * sin(theta) = x
%   a * sin(theta) + b * cos(theta) = y

function theta = twoEquationsForTheta(a, b, x, y)

r = sqrt(a ^ 2 + b ^ 2);
theta = atan2(y / r, x / r) - atan2(b / r, a / r); 

end