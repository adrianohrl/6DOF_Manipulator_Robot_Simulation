function J = jacobianMatrix(theta)

global l1 l2 d2 l3 d3 l4 l5 l6;

z0 = [0
      0 
      1];
z1 = [sind(theta(1))
      -cosd(theta(1))
      0];
z2 = [sind(theta(1))
      -cosd(theta(1))
      0];
z3 = [-cosd(theta(1)) * sind(theta(2) + theta(3))
      -sind(theta(1)) * sind(theta(2) + theta(3))
      cosd(theta(2) + theta(3))];
z4 = [cosd(theta(1)) * cosd(theta(2) + theta(3)) * sind(theta(4)) + sind(theta(1)) * cosd(theta(4))
      sind(theta(1))*cosd(theta(2) + theta(3)) * sind(theta(4)) - cosd(theta(1)) * cosd(theta(4))
      sind(theta(2) + theta(3)) * sind(theta(4))];
z5 = [-(cosd(theta(1)) * cosd(theta(2) + theta(3)) * cosd(theta(4)) - sind(theta(1)) * sind(theta(4))) * sind(theta(5)) - cosd(theta(1)) * sind(theta(2) + theta(3)) * cosd(theta(5))
      -(sind(theta(1)) * cosd(theta(2) + theta(3)) * cosd(theta(4)) + cosd(theta(1)) * sind(theta(4))) * sind(theta(5)) - sind(theta(1)) * sind(theta(2) + theta(3)) * cosd(theta(5))
      -sind(theta(2) + theta(3)) * cosd(theta(4)) * sind(theta(5)) - cosd(theta(2) + theta(3)) * cosd(theta(5))];

o0 = [0
      0
      0];
o1 = [0
      0
      l1];
o2 = [l2 * cosd(theta(1)) * cosd(theta(2)) + d2 * sind(theta(1))
      l2 * sind(theta(1))*cosd(theta(2)) - d2 * cosd(theta(1))
      l2 * sind(theta(2)) + l1];
o3 = [l3 * cosd(theta(1)) * cosd(theta(2) + theta(3)) + l2 * cosd(theta(1)) * cosd(theta(2)) + d2 * sind(theta(1))
      l3 * sind(theta(1)) * cosd(theta(2) + theta(3)) + l2 * sind(theta(1)) * cosd(theta(2)) - d2 * cosd(theta(1))
      l3 * sind(theta(2) + theta(3)) + l2 * sind(theta(2)) + l1];
o4 = [-(d3 + l4) * cosd(theta(1)) * sind(theta(2) + theta(3)) + l3 * cosd(theta(1)) * cosd(theta(2) + theta(3)) + l2 * cosd(theta(1)) * cosd(theta(2)) + d2 * sind(theta(1))
      -(d3 + l4) * sind(theta(1)) * sind(theta(2) + theta(3)) + l3 * sind(theta(1)) * cosd(theta(2) + theta(3)) + l2 * sind(theta(1)) * cosd(theta(2)) - d2 * cosd(theta(1))
      (d3 + l4) * cosd(theta(2) + theta(3)) + l3 * sind(theta(2) + theta(3)) + l2 * sind(theta(2)) + l1];
o5 = [-(d3 + l4) * cosd(theta(1)) * sind(theta(2) + theta(3)) + l3 * cosd(theta(1)) * cosd(theta(2) + theta(3)) + l2 * cosd(theta(1)) * cosd(theta(2)) + d2 * sind(theta(1))
      -(d3 + l4) * sind(theta(1)) * sind(theta(2) + theta(3)) + l3 * sind(theta(1)) * cosd(theta(2) + theta(3)) + l2 * sind(theta(1)) * cosd(theta(2)) - d2 * cosd(theta(1))
       (d3 + l4) * cosd(theta(2) + theta(3)) + l3 * sind(theta(2) + theta(3)) + l2 * sind(theta(2)) + l1];
o6 = [-(l5 + l6) * ((cosd(theta(1)) * cosd(theta(2) + theta(3)) * cosd(theta(4)) - sind(theta(1)) * sind(theta(4))) * sind(theta(5)) + cosd(theta(1)) * sind(theta(2) + theta(3)) * cosd(theta(5))) - (d3 + l4) * cosd(theta(1)) * sind(theta(2) + theta(3)) + l3 * cosd(theta(1)) * cosd(theta(2) + theta(3)) + l2 * cosd(theta(1)) * cosd(theta(2)) + d2 * sind(theta(1))
      -(l5 + l6) * ((sind(theta(1)) * cosd(theta(2) + theta(3)) * cosd(theta(4)) + cosd(theta(1)) * sind(theta(4))) * sind(theta(5)) + sind(theta(1)) * sind(theta(2) + theta(3)) * cosd(theta(5))) - (d3 + l4) * sind(theta(1)) * sind(theta(2) + theta(3)) + l3 * sind(theta(1)) * cosd(theta(2) + theta(3)) + l2 * sind(theta(1)) * cosd(theta(2)) - d2 * cosd(theta(1))
      (l5 + l6) * (-sind(theta(2) + theta(3)) * cosd(theta(4)) * sind(theta(5)) + cosd(theta(2) + theta(3)) * cosd(theta(5))) + (d3 + l4) * cos(theta(2) + theta(3)) + l3 * sind(theta(2) + theta(3)) + l2 * sind(theta(2)) + l1];
  
J(:, 1) = [cross(z0, o6 - o0); z0];
J(:, 2) = [cross(z1, o6 - o1); z1];
J(:, 3) = [cross(z2, o6 - o2); z2];
J(:, 4) = [cross(z3, o6 - o3); z3];
J(:, 5) = [cross(z4, o6 - o4); z4];
J(:, 6) = [cross(z5, o6 - o5); z5];

end