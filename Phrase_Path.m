function [ T ] = Phrase_Path(par, x0, z0, yy)

cte = 3;
a = .6 * par;
b = par;
offset_l = .9 * par;
offset_w = 1.5 * par;

j = 1;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 1.1
xx = x0 + a/2;
for i=z0:1:(z0+b)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 1.2
zz = z0 + b;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0
x0 = x0 + offset_l;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 2.1
xx = x0;
for i=z0:1:(z0+b)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 2.2
zz = z0 + b/2;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 2.3
xx = x0 + a;
for i=z0:1:(z0+b)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0
x0 = x0 + offset_l;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 3.1
xx = x0;
for i=z0:1:(z0+b)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 3.2
zz = z0 + b;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 3.3
xx = x0 + a;
for i=(z0+b):-1:z0
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 3.4
zz = z0 + b/2;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0
x0 = x0 + offset_l;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 4.1
xx = x0 + a/2;
for i=z0:1:(z0+b)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 4.2
zz = z0 + b;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0
x0 = x0 + offset_l;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 5.1
xx = x0 + a/4;
for i=(z0+3*b/4):1:(z0+b)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0
x0 = x0 + offset_l*2/3;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 6.1
zz = z0;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 6.2
xx = x0 + a;
for i=z0:1:(z0+b/2)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 6.3
zz = z0 + b/2;
for i=(x0+a):-1:x0
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 6.4
xx = x0;
for i=(z0+b/2):1:(z0+b)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 6.5
zz = z0 + b;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0 (word)
x0 = x0 + offset_w;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 7.1
xx = x0;
for i=z0:1:(z0+b)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 7.2
zz = z0 + b;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 7.3
xx = x0 + a;
for i=(z0+b):-1:z0
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 7.4
zz = z0 + b/2;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0
x0 = x0 + offset_l;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 8.1
xx = x0;
for i=(z0+b):-1:z0
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 8.2
zz = z0;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0
x0 = x0 + offset_l;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 9.1
xx = x0;
for i=(z0+b):-1:z0
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 9.2
zz = z0;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0 (word)
x0 = x0 + offset_w;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 10.1
xx = x0;
for i=z0:1:(z0+b)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 10.2
zz = z0 + b;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 10.3
zz = z0 + b/2;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0
x0 = x0 + offset_l;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 11.1
xx = x0;
for i=(z0+b):-1:z0
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 11.2
zz = z0;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 11.3
xx = x0 + a;
for i=z0:1:(z0+b)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 11.4
zz = z0 + b;
for i=(x0+a):-1:x0
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0
x0 = x0 + offset_l;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 12.1
xx = x0;
for i=(z0+b):-1:z0
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 12.2
zz = z0;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0
x0 = x0 + offset_l;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 13.1
xx = x0;
for i=z0:1:(z0+b)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 13.2
for i=(x0+a):-1:x0
   xx = i;
   zz = b*(xx-x0-a)/(2*a) + z0 + b;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 13.3
for i=x0:1:(x0+a)
   xx = i;
   zz = -b*(xx-x0-a)/(2*a) + z0;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

% Update x0
x0 = x0 + offset_l;

yy = yy + cte;
PATH(j,1) = x0;
PATH(j,2) = yy;
PATH(j,3) = z0;
j = j + 1;
yy = yy - cte;

% Path 14.1
zz = z0;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 14.2
xx = x0 + a;
for i=z0:1:(z0+b/2)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 14.3
zz = z0 + b/2;
for i=(x0+a):-1:x0
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 14.4
xx = x0;
for i=(z0+b/2):1:(z0+b)
   zz = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

yy = yy + cte;
PATH(j,1) = xx;
PATH(j,2) = yy;
PATH(j,3) = zz;
j = j + 1;
yy = yy - cte;

% Path 14.5
zz = z0 + b;
for i=x0:1:(x0+a)
   xx = i;
   PATH(j,1) = xx;
   PATH(j,2) = yy;
   PATH(j,3) = zz;
   j = j + 1;
end

for i = 1 : 1 : j-1
    T(:, :, i) = [1 0 0 PATH(i,1)
                  0 0 -1 PATH(i,2)
                  0 1 0 PATH(i,3)
                  0 0 0 1];
end

end

