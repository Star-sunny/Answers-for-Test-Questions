% ---------------------------------------------------------------
% Name: Cen Liu
% Application No.: C2117860
% 
% Question: 1. Operations for the right sum
% Solution: 1.(a) 9x9 matrix
% ---------------------------------------------------------------
clc; clearvars; close all

m = 9; % Matrix size
n = 9;
S = ones(m,n); % Matrix initialization
for i = 1:m
    S(i,:) = i * S(i,:);
end

origin = 1;
summation = origin;
N = m + n - 2; % Number of operations

% Select feasible operations
for decimal = 1 : 2^N - 1
    operation = de2bi(decimal); % 0 -> Right, 1 -> Down
    operation = [operation, zeros(1,N-length(operation))]; 
    if sum(operation) == N/2 % A feasible operation
        for i = 1:N
            if ~operation(i) % Go right
                summation = summation + origin;
            else % Go down
                origin = origin + 1;
                summation = summation + origin;
            end
        end
        if summation == 65 % Replace this value for other solutions, e.g. 65,72,90,110.
            formatSpec = '%d %s\n';
            fprintf(formatSpec,summation, bin2oper(operation))        
        end
    end
    origin = 1;
    summation = origin;
end