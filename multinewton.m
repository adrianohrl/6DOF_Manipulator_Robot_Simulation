function x=multinewton(f, x, NumIters)

[y dy] = f(x);

for j = 1 : NumIters
    s = dy \ y;
    x = x - s;
    [y dy] = f(x);
end
