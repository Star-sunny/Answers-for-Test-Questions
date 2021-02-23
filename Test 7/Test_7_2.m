% ---------------------------------------------------------------
% Name: Cen Liu
% Application No.: C2117860
% 
% Question: 7. Coordinates-to-index & Index-to-coordinates
% Solution: 7.2 6-dimension
% ---------------------------------------------------------------
clc; clearvars; close all

% % Read the input coordinates
% in_coordinate = importdata('input_coordinates_7_2.txt');
% in_coordinate = in_coordinate.data;
% save in_coordinate_2.mat in_coordinate
% 
% % Read the input coordinates
% in_index = importdata('input_index_7_2.txt');
% in_index = in_index.data;
% save in_index_2.mat in_index

load 'in_coordinate_2' % Load the input coordinates
load 'in_index_2' % Load the input indices

L = [4,8,5,9,6,7];
out_index = in_coordinate(:,6)*L(5)*L(4)*L(3)*L(2)*L(1) + ...
            in_coordinate(:,5)*L(4)*L(3)*L(2)*L(1) + ...
            in_coordinate(:,4)*L(3)*L(2)*L(1) + ...
            in_coordinate(:,3)*L(2)*L(1) + ...
            in_coordinate(:,2)*L(1) + ...
            in_coordinate(:,1);

deno_6 = L(5)*L(4)*L(3)*L(2)*L(1);
deno_5 = L(4)*L(3)*L(2)*L(1);
deno_4 = L(3)*L(2)*L(1);
deno_3 = L(2)*L(1);
deno_2 = L(1);

out_x6 = floor(in_index/deno_6);
nume_5 = in_index - out_x6*L(5)*L(4)*L(3)*L(2)*L(1);
out_x5 = floor(nume_5/deno_5);
nume_4 = in_index - out_x6*L(5)*L(4)*L(3)*L(2)*L(1)...
                  - out_x5*L(4)*L(3)*L(2)*L(1);
out_x4 = floor(nume_4/deno_4);
nume_3 = in_index - out_x6*L(5)*L(4)*L(3)*L(2)*L(1)...
                  - out_x5*L(4)*L(3)*L(2)*L(1)...
                  - out_x4*L(3)*L(2)*L(1);
out_x3 = floor(nume_3/deno_3);
nume_2 = in_index - out_x6*L(5)*L(4)*L(3)*L(2)*L(1)...
                  - out_x5*L(4)*L(3)*L(2)*L(1)...
                  - out_x4*L(3)*L(2)*L(1)...
                  - out_x3*L(2)*L(1);
out_x2 = floor(nume_2/deno_2);
out_x1 = in_index - out_x6*L(5)*L(4)*L(3)*L(2)*L(1)...
                  - out_x5*L(4)*L(3)*L(2)*L(1)...
                  - out_x4*L(3)*L(2)*L(1)...
                  - out_x3*L(2)*L(1)...
                  - out_x2*L(1);

% Write the output indices into a file
fid = fopen('output_index_7_2.txt','w');
fprintf(fid, '%s\n', 'index');
for i = 1:length(out_index)
    fprintf(fid, '%d\n',out_index(i));
end
fclose(fid);

% Write the output coordinates into a file
fid = fopen('output_coordinates_7_2.txt','w');
fprintf(fid, '%s\t%s\t%s\t%s\t%s\t%s\n', 'x1','x2','x3','x4','x5','x6');
for i = 1:length(out_x1)
    fprintf(fid, '%d\t%d\t%d\t%d\t%d\t%d\n', out_x1(i),out_x2(i),out_x3(i),out_x4(i),out_x5(i),out_x6(i));
end
fclose(fid);