function out = calTable(in)
    
    fx = zeros(length(in));

    for col = 1:length(in)-1
        for row = 1:length(x)-col
            fx(row,col+1) = fx(row+1,col) - fx(row,col);
        end
    end

    out = fx;
end