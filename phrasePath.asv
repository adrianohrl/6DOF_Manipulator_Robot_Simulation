function T = phrasePath(letter, scale, x0, y0, z0)

aux = 3;
scale = scale * aux;
x0 = x0 * aux;
y0 = y0 * aux;
z0 = z0 * aux;

% Parameters to build each letter
cte = .01 * scale;
letterHorizontalSize = floor(.6 * scale);
letterVerticalSize = floor(scale);

x = x0;
y = (y0 + cte);
z = z0;

switch letter
    case 'T'
        % first part
        x = cat(2, 2, x, (x0 + letterHorizontalSize / 2) * ones(1, letterVerticalSize + 1));
        y = cat(2, 2, y, y0 * ones(1, letterVerticalSize + 1));
        z = cat(2, 2, z, z0 : z0 + letterVerticalSize);

        % before go to next part
        x = cat(2, x, x(end));
        y = cat(2, y, y0 + cte);
        z = cat(2, z, z(end));

        % second part
        x = cat(2, x, x0 : x0 + letterHorizontalSize);
        y = cat(2, y, y0 * ones(1, letterHorizontalSize + 1));
        z = cat(2, z, (z0 + letterVerticalSize) * ones(1, letterHorizontalSize + 1));
    case 'H'
        % first part
        x = cat(2, x, x0 * ones(1, letterVerticalSize + 1));
        y = cat(2, y, y0 * ones(1, letterVerticalSize + 1));
        z = cat(2, z, z0 : z0 + letterVerticalSize);

        % before go to next part
        x = cat(2, x, x(end));
        y = cat(2, y, y0 + cte);
        z = cat(2, z, z(end));

        % second part
        x = cat(2, x, x0 : x0 + letterHorizontalSize);
        y = cat(2, y, y0 * ones(1, letterHorizontalSize + 1));
        z = cat(2, z, (z0 + letterVerticalSize / 2) * ones(1, letterHorizontalSize + 1));

        % before go to next part
        x = cat(2, x, x(end));
        y = cat(2, y, y0 + cte);
        z = cat(2, z, z(end));

        % third part
        x = cat(2, x, (x0 + letterHorizontalSize) * ones(1, letterVerticalSize + 1));
        y = cat(2, y, y0 * ones(1, letterVerticalSize + 1));
        z = cat(2, z, z0 : z0 + letterVerticalSize);
    case 'A'
        % first part
        x = cat(2, x, x0 * ones(1, letterVerticalSize + 1));
        y = cat(2, y, y0 * ones(1, letterVerticalSize + 1));
        z = cat(2, z, z0 : z0 + letterVerticalSize);
        
        % second part
        x = cat(2, x, x0 : x0 + letterHorizontalSize);
        y = cat(2, y, y0 * ones(1, letterHorizontalSize + 1));
        z = cat(2, z, (z0 + letterVerticalSize) * ones(1, letterHorizontalSize + 1));
        
        % third part
        x = cat(2, x, (x0 + letterHorizontalSize) * ones(1, letterVerticalSize + 1));
        y = cat(2, y, y0 * ones(1, letterVerticalSize + 1));
        z = cat(2, z, z0 + letterVerticalSize : -1 : z0);

        % before go to next part
        x = cat(2, x, x(end));
        y = cat(2, y, y0 + cte);
        z = cat(2, z, z(end));

        % forth part
        x = cat(2, x, x0 : x0 + letterHorizontalSize);
        y = cat(2, y, y0 * ones(1, letterHorizontalSize + 1));
        z = cat(2, z, (z0 + letterVerticalSize / 2) * ones(1, letterHorizontalSize + 1));
    case '`'
        x = cat(2, x, (x0 + letterHorizontalSize / 4) * ones(1, floor(letterVerticalSize / 4) + 2));
        y = cat(2, y, y0 * ones(1, floor(letterVerticalSize / 4) + 2));
        z = cat(2, z, z0 + floor(3 * letterVerticalSize / 4) : z0 + letterVerticalSize);
    case 'S'
        % first part
        x = cat(2, x, x0 : x0 + letterHorizontalSize);
        y = cat(2, y, y0 * ones(1, letterHorizontalSize + 1));
        z = cat(2, z, z0 * ones(1, letterHorizontalSize + 1));

        %second part
        x = cat(2, x, (x0 + letterHorizontalSize) * ones(1, floor(letterVerticalSize / 2) + 1));
        y = cat(2, y, y0 * ones(1, floor(letterVerticalSize / 2) + 1));
        z = cat(2, z, z0 : z0 + floor(letterVerticalSize / 2));

        % third part
        x = cat(2, x, x0 + letterHorizontalSize : -1 : x0);
        y = cat(2, y, y0 * ones(1, letterHorizontalSize + 1));
        z = cat(2, z, (z0 + letterVerticalSize / 2) * ones(1, letterHorizontalSize + 1));

        % forth part
        x = cat(2, x, x0 * ones(1, floor(letterVerticalSize / 2) + 1));
        y = cat(2, y, y0 * ones(1, floor(letterVerticalSize / 2) + 1));
        z = cat(2, z, z0 + floor(letterVerticalSize / 2) : z0 + letterVerticalSize);

        % fifth part
        x = cat(2, x, x0 : x0 + letterHorizontalSize);
        y = cat(2, y, y0 * ones(1, letterHorizontalSize + 1));
        z = cat(2, z, (z0 + letterVerticalSize)* ones(1, letterHorizontalSize + 1));
    case 'L'
        % first part
        x = cat(2, x, x0 * ones(1, letterVerticalSize + 1));
        y = cat(2, y, y0 * ones(1, letterVerticalSize + 1));
        z = cat(2, z, z0 + letterVerticalSize : -1 : z0);

        % second part
        x = cat(2, x, x0 : x0 + letterHorizontalSize);
        y = cat(2, y, y0 * ones(1, letterHorizontalSize + 1));
        z = cat(2, z, z0 * ones(1, letterHorizontalSize + 1));
    case 'F'
        % first part
        x = cat(2, x, x0 * ones(1, letterVerticalSize + 1));
        y = cat(2, y, y0 * ones(1, letterVerticalSize + 1));
        z = cat(2, z, z0 : z0 + letterVerticalSize);
        
        % second part
        x = cat(2, x, x0 : x0 + letterHorizontalSize);
        y = cat(2, y, y0 * ones(1, letterHorizontalSize + 1));
        z = cat(2, z, (z0 + letterVerticalSize) * ones(1, letterHorizontalSize + 1));

        % before go to next part
        x = cat(2, x, x(end));
        y = cat(2, y, y0 + cte);
        z = cat(2, z, z(end));

        % third part
        x = cat(2, x, x0 : x0 + floor(3 * letterHorizontalSize / 4));
        y = cat(2, y, y0 * ones(1, floor(3 * letterHorizontalSize / 4) + 1));
        z = cat(2, z, (z0 + letterVerticalSize / 2) * ones(1, floor(3 * letterHorizontalSize / 4) + 1));
    case 'O'
        % first part
        x = cat(2, x, x0 * ones(1, letterVerticalSize + 1));
        y = cat(2, y, y0 * ones(1, letterVerticalSize + 1));
        z = cat(2, z, z0 + letterVerticalSize : -1 : z0);

        % second part
        x = cat(2, x, x0 : x0 + letterHorizontalSize);
        y = cat(2, y, y0 * ones(1, letterHorizontalSize + 1));
        z = cat(2, z, z0 * ones(1, letterHorizontalSize + 1));

        % third part
        x = cat(2, x, (x0 + letterHorizontalSize) * ones(1, letterVerticalSize + 1));
        y = cat(2, y, y0 * ones(1, letterVerticalSize + 1));
        z = cat(2, z, z0 : z0 + letterVerticalSize);
        
        % forth part
        x = cat(2, x, x0 + letterHorizontalSize : -1 : x0);
        y = cat(2, y, y0 * ones(1, letterHorizontalSize + 1));
        z = cat(2, z, (z0 + letterVerticalSize) * ones(1, letterHorizontalSize + 1));
    case 'K'
        % first part
        x = cat(2, x, x0 * ones(1, letterVerticalSize + 1));
        y = cat(2, y, y0 * ones(1, letterVerticalSize + 1));
        z = cat(2, z, z0 : z0 + letterVerticalSize);

        % before go to next part
        x = cat(2, x, x(end));
        y = cat(2, y, y0 + cte);
        z = cat(2, z, z(end));

        % second part
        for i = x0 + letterHorizontalSize : -1 : x0
            x = cat(2, x, i);
            y = cat(2, y, y0);
            z = cat(2, z, letterVerticalSize * (i - x0 - letterHorizontalSize) / (2 * letterHorizontalSize) + z0 + letterVerticalSize);
        end;

        % third part
        for i = x0 : x0 + letterHorizontalSize
            x = cat(2, x, i);
            y = cat(2, y, y0);
            z = cat(2, z, -letterVerticalSize * (i - x0 - letterHorizontalSize)/(2 * letterHorizontalSize) + z0);
        end;
    case '!'
        % first part
        x = cat(2, x, x0 * ones(1, floor(3 * letterVerticalSize / 4) + 2));
        y = cat(2, y, y0 * ones(1, floor(3 * letterVerticalSize / 4) + 2));
        z = cat(2, z, floor(z0 + letterVerticalSize / 4) : z0 + letterVerticalSize);

        % before go to next part
        x = cat(2, x, x(end));
        y = cat(2, y, y0 + cte);
        z = cat(2, z, z(end));

        % second part
        x = cat(2, x, x0 * [1 1 1]);
        y = cat(2, y, y0 * [1 1 1]);
        z = cat(2, z, z0 * [.995 1.005 1]);
end;

x = cat(2, x, x(end)) / aux;
y = cat(2, y, y0 + cte) / aux;
z = cat(2, z, z(end)) / aux;

for i = 1 : length(x)
    T(:, :, i) = [1 0 0 x(i); 0 0 -1 y(i); 0 1 0 z(i); 0 0 0 1];
end;

end

