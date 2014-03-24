% Using the "Another Approach":
%
%   a * sin(theta) + b * cos(theta) = c

function theta = anotherApproch(a, b, c)

r = sqrt(a ^ 2 + b ^ 2);
theta = -acos(c / r) - atan2(-a, b); 

end