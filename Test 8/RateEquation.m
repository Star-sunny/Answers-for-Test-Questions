% ---------------------------------------------------------------
% Name: Cen Liu
% Application No.: C2117860
% 
% Question: 8. Enzyme Kinetics
% Function: Modeling the rate equations
% ---------------------------------------------------------------
function dydt = RateEquation(t, y)

dydt = [-100*y(1)*y(2) + 750*y(3);
        -100*y(1)*y(2) + 600*y(3);
         100*y(1)*y(2) - 750*y(3);
         150*y(3)];