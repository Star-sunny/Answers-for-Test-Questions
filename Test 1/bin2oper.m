% ---------------------------------------------------------------
% Name: Cen Liu
% Application No.: C2117860
% 
% Question: 1. Operations for the right sum
% Function: Express the binary operation vector by 'R' and 'D'
% ---------------------------------------------------------------
function char_oper = bin2oper(bin_oper)

char_oper = [];
for i = 1:length(bin_oper)
    if bin_oper(i) == 0
        char_oper = [char_oper, 'R'];
    else
        char_oper = [char_oper, 'D'];
    end
end