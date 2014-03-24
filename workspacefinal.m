function [ valid ] = workspacefinal( theta_2, theta_3, theta_4, theta_5 )

valid = 1; %%%% IF THETAS ARE VALID, valid = 1; Otherwise, valid = 0 -> robot can't assume this position
d2 = 3041.38;
d3 = 2549.51;
d5 = 650;
R = 750;
theta2_min = -38.2;
theta2_max = 185.49;
thetaD_min = 13.88;
theta5 = theta_5 + 11.31;
theta3 = theta_3 + 78.69;
theta2 = theta_2;
theta4 = theta_4;
theta2_lim = 0;
thetaD_lim = 0;
aux = 0;
%% EVALUATING WHETHER ALL THE THETAS ARE BETWEEN THEIR EDGES
if(theta2 > theta2_max) || (theta2<theta2_min)
    valid = 0;
    return
end

if(theta5 > 105) || (theta5 < -105)
    valid = 0;
    return
end

% evaluating the projection of d5 (real distance between the frame 5 till
% the edge of the end-effector
 
 if(theta4 == 0)
     d5l = abs(d5*cos(theta5));
 end
 
 if(abs(theta4) == 90)
     d5l = abs(d5*(cos(theta5) + sin(theta5)*sin(theta4)));
 end
 
 
 if (theta4 > 90) && (theta4 < 180)
     theta4 = 180 - theta4;
 end
 
 if (theta4 < -90) && (theta4 > -180)
     theta4 = theta4 + 180;
 end
 
 if(abs(theta4) < 90) && (abs(theta4) > 0)
     d5l = abs(d5*sqrt((cos(theta5))^2+(sin(theta5)*sin(theta4))^2));
 end
 
 
aux = theta5;
theta5 = asind((sin(aux)*sin(aux)*d5)/(d5l));


%% Taking in consideration a cilinder under the arm holding it. So, it can't colide between each other

%% The problem Will be divided in some angle ranges... Starting with theta2

if(theta2 < 90)
    if(theta5 < 0)
        D = sqrt( (d3^2) * (d5l^2)- (2*d3*d5l*cos(180 - abs(theta5))));
        aux = acosd(((D^2)+(d3^2)-(d5l^2))/(2*D*d3));
        thetaD = 180 + aux + theta3;
    end
    if(theta5 > 0)
        D = d3;
        thetaD = 180 - abs(theta3);
    end
end

if(theta2 >= 90)
    if(theta5 > 0)
        D = sqrt( (d3^2) * (d5l^2)- (2*d3*d5l*cos(180 - abs(theta5))));
        aux = acosd(((D^2)+(d3^2)-(d5l^2))/(2*D*d3));
        thetaD = 180 - abs(aux) - abs(theta3);
    end
    
    if(theta5 < 0)
        D = d3;
        thetaD = 180 - abs(theta3);
    end
end

%%NOW WE CAN EVALUATE THE COLISIONS THAT MIGHT HAPPENN IN TERMS OF THETA2

%% SINCE THE CILINDER UNDER THE ARM HAS A VERY APPROXIMATED 

thetaD_lim = acos(((d2^2)+(D^2)-(R^2))/(2*D*d2));
theta2_lim = acos(((d2^2)+(R^2)-(D^2))/(2*R*d2));

%% TESTING THE RANGE BETWEEN THETA2_LIM (TIME THAT THE ARM GOES OUT OF THE CILINDER RANGE)

if(theta2 >= abs(theta2_lim)) && (theta2 >= abs(180 - theta2_lim))
    if(thetaD < thetaD_lim)
        valid = 0;
        return;
    end
end

%% TESTING THE RANGE UNDER THETA2_LIM AND OVER 180-THETA2_LIM

if( theta2 < abs(theta2_lim) )
    if( abs(d2*cos(theta2)) < abs( R + D*cos(thetaD)*cos(theta2)) )
        valid = 0;
        return
    end
end 

if( theta2 > abs(180-theta2_lim) )
    if( abs( d2*cos(180 - theta2) ) < abs( R + D*cos(thetaD)*cos(180 - theta2))   )
        valid =  0;
        return
    end
end


end %%%% FIM DA FUNCAO

