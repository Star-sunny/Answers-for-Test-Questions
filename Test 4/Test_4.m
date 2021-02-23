% ---------------------------------------------------------------
% Name: Cen Liu
% Application No.: C2117860
% 
% Question: 4. Connected components
% Solutions for both 4-connectivity and 8-connectivity cases
% ---------------------------------------------------------------
clc; clearvars; close all

binmat = [0 0 0 0 1 1 0 0 0 1 0 1 0 1 1 1 0 0 1 1; % Input
          1 0 1 0 0 0 0 0 1 1 0 0 0 0 1 0 0 1 0 0;
          0 1 1 1 1 1 1 0 1 0 1 0 1 0 0 0 0 0 1 0;
          0 0 0 0 1 1 0 0 0 0 1 0 0 0 1 1 1 0 1 1;
          1 0 0 1 0 0 0 0 0 0 1 1 1 0 1 1 1 0 1 1;
          1 1 1 1 0 1 0 0 0 0 0 0 0 1 0 0 1 1 0 1;
          1 1 0 0 0 0 1 0 0 0 0 1 1 0 0 0 0 1 0 1;
          0 1 0 0 0 1 1 0 0 0 0 1 1 0 0 0 0 1 1 1;
          0 0 1 1 1 0 0 1 0 1 0 0 1 0 0 0 1 1 1 0;
          1 0 1 0 1 0 1 1 1 1 0 0 1 0 1 0 0 0 0 1];
[M, N] = size(binmat);
cluster = zeros(M, N); % Output
mark = 1;
index = [];

for i = 1:M
    for j = 1:N
        if binmat(i, j) == 1
            index = (j-1) * M + i;
            cluster(index) = mark;
            neighbors = [];
            while ~isempty(index)
                binmat(index) = 0;
                neighbors = find_neighbors_8connect(index, M, N); % 8-connectivity case
%                 neighbors = find_neighbors_4connect(index, M, N); % 4-connectivity case
                index = neighbors(find(binmat(neighbors)));
                cluster(index) = mark;
            end
            mark = mark + 1;
        end
    end
end

cluster