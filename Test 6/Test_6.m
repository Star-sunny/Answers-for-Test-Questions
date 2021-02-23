% ---------------------------------------------------------------
% Name: Cen Liu
% Application No.: C2117860
% 
% Question: 6. Points inside/outside polygon
% ---------------------------------------------------------------
clc; clearvars; close all

polyX = [4,2,3,2,5,9,14,20,18,11]; % Polygon
polyY = [3,6,12,17,20,21,19,14,3,7];
vertex = length(polyX); % Number of vertices of the polygon
x = [7,10,11,12,16,16,17,18,18,20]; % Test points
y = [11,14,4,21,3,10,4,7,17,7];

for k = 1:length(x)
    oddNodes = false;
    j = vertex;
    for i = 1:vertex
        if (y(k)>polyY(i) && y(k)<=polyY(j)) || (y(k)>polyY(j) && y(k)<=polyY(i))
            if polyX(i)+(y(k)-polyY(i))/(polyY(j)-polyY(i))*(polyX(j)-polyX(i))<x(k)
                oddNodes = ~oddNodes;
            end
        end
        j = i;
    end
    % Print the output
    formatSpec = '%d %d %s\n';
    if oddNodes == true
        fprintf(formatSpec,x(k),y(k),'inside')  
    else
        fprintf(formatSpec,x(k),y(k),'outside')
    end
end