% ---------------------------------------------------------------
% Name: Cen Liu
% Application No.: C2117860
% 
% Question: 1. Operations for the right sum
% Solution: 1.(b) 90,000x100,000 matrix
% ---------------------------------------------------------------
clc; clearvars; close all
% Times of 'R' or 'D' are determined by a heuristic approach described on the answer sheet
R1 = 30100;
D1 = 1;
R2 = 48291;
D2 = 89998;
R3 = 21608;
num_oper = R1 + R2 + R3 + D1 + D2;
bin_oper = [zeros(1,R1),ones(1,D1),zeros(1,R2),ones(1,D2),zeros(1,R3)];
char_oper = bin2oper(bin_oper);

formatSpec = '%d %s\n';

fprintf(formatSpec,87127231192, 'No solution')

fprintf(formatSpec,5994891682, char_oper)