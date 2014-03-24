function joint_variables = getInvKin(T6_0g)

global l1 d1 l2 d2 l3 d3 l4 l5 l6;

x =  T6_0g(1,4) - (l5+l6)*T6_0g(1,3);
y =  T6_0g(2,4) - (l5+l6)*T6_0g(2,3);
z =  T6_0g(3,4) - (l5+l6)*T6_0g(3,3);



end

