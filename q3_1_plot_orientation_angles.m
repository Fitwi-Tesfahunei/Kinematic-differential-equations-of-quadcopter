clc
clear
close all
global w1 w2 w3;

z0 = [pi/6, pi/4, pi/3]; % Initial conditions
tspan = [0,10]; % Time range
[t,z] = ode45('q3_1', tspan, z0); % Integrate and solve for the angles

%% Define the angles
theta_1 = z(:,1);
theta_2 = z(:,2);
theta_3 = z(:,3);

%% Plot the orientation angles
plot(t,theta_1,t,theta_2,t,theta_3)
legend('Theta_1','Theta_2','Theta_3')
xlabel('Time (sec)')
ylabel('Theta (rad)')
title('Orientation Angles (Body Two 1-2-1)')
grid on

%% theta_2 to singularity
if sin(theta_2) > -0.01 & sin(theta_2) < 0.01
    disp(theta_2)
end