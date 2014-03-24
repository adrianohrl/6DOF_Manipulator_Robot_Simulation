%This function calculate the holonomous transformation matrix

%alpha_i and theta_i must be in degrees

function Ti_i_1 = getSymTi_i_1(a_i, alpha_i, d_i, theta_i)

alpha_i = alpha_i * pi / 180;

Ti_i_1 = [cos(theta_i)   -sin(theta_i)*round(cos(alpha_i))      sin(theta_i)*round(sin(alpha_i))      a_i*cos(theta_i);
          sin(theta_i)    cos(theta_i)*round(cos(alpha_i))     -cos(theta_i)*round(sin(alpha_i))      a_i*sin(theta_i);
              0                  round(sin(alpha_i))                     round(cos(alpha_i))                  d_i;
              0                       0                                      0                                 1];

end
