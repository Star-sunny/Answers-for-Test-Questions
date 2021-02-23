% ---------------------------------------------------------------
% Name: Cen Liu
% Application No.: C2117860
% 
% Question: 8. Enzyme Kinetics
% Solution: 8.2 Solving the rate equations using the fourth-order RungeKutta method
%           8.3 Plot the velocity V as a function of the concentration of S
% ---------------------------------------------------------------
clc; clearvars; close all

tspan = [0 0.5];
y0 = [1;10;0;0];
[t,y] = ode45(@RateEquation, tspan, y0);

figure
plot(t,y(:,1),t,y(:,2),t,y(:,3),t,y(:,4),'LineWidth',1.5)
xlabel 'Time (min)'
ylabel 'Concentration (\muM)'
legend('Concentration of E','Concentration of S','Concentration of ES','Concentration of P','FontSize',12)
grid on

figure
plot(y(:,2),150*y(:,3),'LineWidth',1.5)
hold on
[M, I] = max(150*y(:,3));
plot(y(I,2),M,'o','LineWidth',1.5,'MarkerSize',10)
xlabel 'Concentration of S (\muM)'
ylabel 'Velocity V (\muM/min)'
legend('The velocity V as a function of the concentration of S','FontSize',12,'Location','northwest')
grid on