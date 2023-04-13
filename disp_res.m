function [] = disp_res(A)
    if isnumeric(A) && numel(A) == 1
        fprintf("%.20f\n",A);
    else
        [row, col] = size(A);
        for i = 1:row
            for j = 1:col
                fprintf('%.20f ', A(i, j));
            end
            fprintf('\n');
        end
    end
end

