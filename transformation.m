%Function takes the model_in and transitions it with the transformation matrix T. 

function model_out = transformation(model_in, T)

model_out = model_in;
for i = 1 : length(model_in.vertices(:, 1))
    
    model_out.vertices(i, :) = T(1 : 3, 1 : 3) * model_in.vertices(i,:)' + T(1 : 3, 4);

end;

end