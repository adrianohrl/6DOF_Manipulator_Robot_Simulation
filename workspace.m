function [ validacao ] = workspace(theta_2, theta_3, theta_4, theta_5)
d3 = 2549.51;
d5 = 650;
d2 = 3041.3812;
teta2_minimo = -27;
teta2_maximo = 189;
teta3_minimo = -241;
teta3_maximo = 82;
teta5_minimo = -105;
teta5_maximo = 105;
teta2 = theta_2;
teta3 = theta_3;
teta4 = theta_4;
teta5 = theta_5;
D = 0;
tetinha = 0;
R = ((625*sqrt(2)) + 500);
validacao = 1;

while(1)

% if( abs(teta5) >105 || teta2 > 189 || teta2 < -27 || teta3 > 82 || teta3 < -241) 
%     validacao = 0;
%     return
% end

% // VERIFICACAO DE TETA4 PARA ACHAR TETA 5 LINHA (NO PLANO) E D 5 LINHA NO PLANO DE MOVIMENTACAO

if(teta4 > 360)
n = teta4/360;
teta4 = teta4 - n*360;
end

if(teta4 == 0)
d5l = d5*(cos(teta5 + 11.31));
end

if(abs(teta4) == 90)
d5l = d5*(cos(teta5 + 11.31) + sin(teta5+11.31)*cos(teta4));
end

if(abs(teta4) == 180)
d5l = d5*cos(teta5 + 11.31);
end

if(90 < teta4) && (teta4 < 180) 
    teta4 = 180 - teta4;
end
    
    if(-90 > teta4) && (teta4 > -180) 
        teta4 = teta4 + 180;
    end

if(0 < abs(teta4)) && (abs(teta4) <90) 
d5l = d5*sqrt(((cos(teta5+11.31))^2)+((cos(teta4)*sin(teta5+11.31))^2));
end

teta5l = (teta5 - 11.31)*cos(teta4);
teta3l =  teta3 + 78.69;



% // PARA DEFINIR QUANDO USAR OU NAO A FORMULA (LEI DOS COSSENOS) DE "D" TEM QUE SABER SE O TETA2 > 0 OU TETA2 < 0, PARA DEPOIS SABER SE TETA5 > 0 OU TETA5 < 0

if(teta2 < 90) && (teta3l <= 0) %tem que verificar se o teta3 tambem ta entrando
if(teta5l < 0)
    D = sqrt((d3^2)+(d5l^2)-(2*d3*d5l*cos(180+teta5l)));
    tetinha = acosd(((d3^2)+(D^2)-(d5l^2))/(2*d3*D));
    tetaD = abs (180 - tetinha + teta3l);
end
    
    if(teta5l > 0)
        D = d3;
        tetinha = teta3l;
        tetaD = 180 + tetinha;
    end
end
if(teta2 >= 90) && (teta3l >= 0)
if(teta5l > 0)
    D = sqrt((d3^2)+(d5l^2)-(2*d3*d5l*cos(180+teta5l))); %%% OLHAR ESSE 180 + teta5l
    tetinha = acosd(((d3^2)+(D^2)-(d5l^2))/(2*d3*D));
    tetaD = 180 - tetinha - teta3l;
end
if(teta5l < 0) 
    D = d3;
    tetinha = teta3l;
    tetaD = 180 - tetinha;
    
end
end

teta2_limite1 = acosd(((d2^2)+(R^2)-(D))/(2*d2*R));
teta2_limite2 = 180 - teta2_limite1;
teta2_limite3 = acosd(((d2^2)+(750^2)-(D))/(2*d2*R));
teta2_limite4 = 180 - teta2_limite3;

% FAZER A ANALISE ENTRE teta2_minimo/teta2_limite1 ; teta2_limite1/teta2_limite3 ; teta2_limite4/teta2_limite2 ; teta2_limite2/teta2_maximo

if(teta2 < teta2_limite1) && (teta2 > teta2_minimo)
%     h = sqrt((D^2)+(d2^2)-(2*d2*D*cos(tetaD)));
        
    end
    if(d2*cos(teta2) < (R + D*cos(180 - tetaD - teta2)))
        validacao = 0;
        break
    end
% end
% if(teta2 < teta2_limite3) && (teta2 > teta2_limite1)
%    if(d2*sin(teta2) < D*sin(tetaD))
%        validacao = 0;
%        break
%    end
% end
% if(teta2 < teta2_limite2) && (teta2 > teta2_limite4)
%     
% end
% if(teta2 > teta2_limite4) && (teta2 < teta2_maximo)
%     if(d2*cos(teta2) < (R + D*cos(tetaD)*cos(teta2)))
%         validacao = 0;
%         break
%     end
% end





    break
end    %FIM DO LACO INFINITO

return
end