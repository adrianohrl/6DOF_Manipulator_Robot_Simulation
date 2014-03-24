%This function calculate the holonomous transformation matrix

%alpha_i and theta_i must be in degrees

function Ti_i_1 = getTi_i_1(a_i, alpha_i, d_i, theta_i)

Ti_i_1 = [cosd(theta_i)   -sind(theta_i)*cosd(alpha_i)      sind(theta_i)*sind(alpha_i)      a_i*cosd(theta_i);
          sind(theta_i)    cosd(theta_i)*cosd(alpha_i)     -cosd(theta_i)*sind(alpha_i)      a_i*sind(theta_i);
              0                  sind(alpha_i)                     cosd(alpha_i)                  d_i;
              0                         0                               0                         1];

end
