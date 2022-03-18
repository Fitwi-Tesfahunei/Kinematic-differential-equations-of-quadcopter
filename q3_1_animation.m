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

%% Animation of the robot in Body Two - 1-2-1 sequence
% Assumption: The robot is rectangluar with initial orientation given as:
% (0,0,2), (0,3,2), (5,3,2), (5,0,2)

for k = 1:length(theta_1)
    clf
    
    % Calculate new coordinates
    x = [0 0 5*cos(theta_2(k)) 5*cos(theta_2(k)) 0];
    y = [0 3*cos(theta_1(k))*cos(theta_3(k)) 3*cos(theta_1(k))*cos(theta_3(k)) 0 0];
    z = [2 2+3*sin(theta_1(k))+3*sin(theta_3(k)) 2+3*sin(theta_1(k))+5*sin(theta_2(k))+3*sin(theta_3(k)) 2+5*sin(theta_2(k)) 2];
    
    % Animate the robot in Body two - 1-2-1 sequence
    plot3(x,y,z)
    axis([-10 10 -10 10 -10 10])
    hold on
    grid on
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title(['theta_1 = ', num2str(theta_1(k)),'  theta_2 = ', num2str(theta_2(k)), '  theta_3 = ', num2str(theta_3(k))])

    movieVector(k) = getframe;
end

myWriter = VideoWriter('Body Two - 1-2-1')
myWriter.FrameRate = 10;

open(myWriter);
writeVideo(myWriter, movieVector);
close(myWriter);