% ---------------------------------------------------------------
% Name: Cen Liu
% Application No.: C2117860
% 
% Question: 5. Coloring
% Solution: 5.2 L=64 with 139R, 1451B, 977G, 1072W and 457Y
% ---------------------------------------------------------------
clc; clearvars; close all

L = 64;
m1 = 30;
m2 = 15;
m3 = 14;
m4 = 4;

% Generate the first 30 rows contain B and G
row_BG = repmat('B G ', 1, 32);
row_GB = [row_BG, 'B'];
row_BG(length(row_BG)) = [];
row_GB([1,2]) = [];
matrix_1 = repmat([row_BG; row_GB], 15, 1);

% Generate the 16th to 45th rows contain B and W
row_BW = repmat('B W ', 1, 32);
row_WB = [row_BW, 'B'];
row_BW(length(row_BW)) = [];
row_WB([1,2]) = [];
matrix_2 = repmat([row_BW; row_WB], 7, 1);
matrix_2 = [matrix_2; row_BW];

% Generate the 46th to 59th rows contain W and Y
row_WY = repmat('W Y ', 1, 32);
row_YW = [row_WY, 'W'];
row_WY(length(row_WY)) = [];
row_YW([1,2]) = [];
matrix_3 = repmat([row_WY; row_YW], 7, 1);

% Generate the 60th to 63th rows contain W and R
row_WR = repmat('W R ', 1, 32);
row_RW = [row_WR, 'W'];
row_WR(length(row_WR)) = [];
row_RW([1,2]) = [];
matrix_4 = repmat([row_WR; row_RW], 2, 1);

% Generate the last row contains 11R, 11B, 17G, 16W and 9Y
row_last = [repmat('G R ', 1, 11), repmat('G B ', 1, 5), 'W G ', repmat('W B ', 1, 6), repmat('W Y ', 1, 9)];
row_last(length(row_last)) = [];

% Grid configuration with zero total penalty
solution = [matrix_1; matrix_2; matrix_3; matrix_4; row_last]