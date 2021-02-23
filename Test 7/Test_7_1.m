% ---------------------------------------------------------------
% Name: Cen Liu
% Application No.: C2117860
% 
% Question: 7. Coordinates-to-index & Index-to-coordinates
% Solution: 7.1 2-dimension
% ---------------------------------------------------------------
clc; clearvars; close all

% % Read the input coordinates
% in_coordinate = importdata('input_coordinates_7_1.txt');
% in_coordinate = in_coordinate.data;
% save in_coordinate.mat in_coordinate
% 
% % Read the input coordinates
% in_index = importdata('input_index_7_1.txt');
% in_index = in_index.data;
% save in_index.mat in_index

load 'in_coordinate' % Load the input coordinates
load 'in_index' % Load the input indices

L1 = 50;
L2 = 57;
out_index = L1 * in_coordinate(:,2) + in_coordinate(:,1);
out_x2 = floor(in_index/L1);
out_x1 = in_index - L1 * out_x2;

% Print the output indices
fprintf('%s\n','index')
for i = 1:length(out_index)
    fprintf('%d\n',out_index(i))
end

fprintf('\n\n')

% Print the output coordinates
fprintf('%s\t%s\n','x1','x2')
for i = 1:length(out_x1)
    fprintf('%d\t%d\n',out_x1(i),out_x2(i))
end