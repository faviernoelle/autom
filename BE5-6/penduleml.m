function [ xdot ] = penduleml( E )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global l m k g ;

xdot=zeros(2,1);
T = E(1);
x1 = E(2);
x2 = E(3);
xdot(1) = x2;
xdot(2) = -g/l*sin(x1)-k/m*x2+1/m*l*l*T;

end

