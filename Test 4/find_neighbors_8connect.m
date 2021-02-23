% ---------------------------------------------------------------
% Name: Cen Liu
% Application No.: C2117860
% 
% Question: 4. Connected components
% Function: Find the neighbors of given pixels based on 8-connectivity
% ---------------------------------------------------------------
function neighbors = find_neighbors_8connect(index, M, N)

neighbors = [];
for i = 1:length(index)
    if index(i) == 1
        % Top left corner
        neighbors = [neighbors, 2, M+1, M+2];  
    elseif index(i) == M
        % Bottom left corner
        neighbors = [neighbors, M-1, 2*M-1, 2*M];
    elseif index(i) == M*(N-1)+1
        % Top right corner
        neighbors = [neighbors, M*(N-2)+1, M*(N-2)+2, M*(N-1)+2];
    elseif index(i) == M*N
        % Bottom right corner
        neighbors = [neighbors, M*(N-1)-1, M*(N-1), M*N-1];
    elseif (1<index(i)) && (index(i)<M)
        % Left side
        neighbors = [neighbors, index(i) + [-1, 1, M-1, M, M+1]];
    elseif (M*(N-1)+1<index(i)) && (index(i)<M*N)
        % Right side
        neighbors = [neighbors, index(i) + [-M-1, -M, -M+1, -1, 1]];
    elseif mod(index(i),M)==1
        % Top side
        neighbors = [neighbors, index(i) + [-M, -M+1, 1, M, M+1]]; 
    elseif mod(index(i),M)==0
        % Bottom side
        neighbors = [neighbors, index(i) + [-M-1, -M, -1, M-1, M]];
    else
        % Non-marginal components
        neighbors = [neighbors, index(i) + [-M-1, -M, -M+1, -1, 1, M-1, M, M+1]];
    end
end

neighbors = unique(neighbors);