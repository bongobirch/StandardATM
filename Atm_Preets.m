%% Aero 4710 Launch Vehicle Design
% Group Homework 1: Standard Atmosphere Model
% Author: Jacob Birch, Zach Eljich, Henry Humphrey, Preet Shah
% Date: 08/29/2022
%References: Anderson, J.D, Introduction to Flight, 2022.
%Hawley, Jim, Formulae and code for the U.S. Standard atmosphere, 1976.
% Returns plots
clc; clear all; close all;

%% Constants
Ti = [288.16,216.66,216.66,282.66,282.66,165.66,165.66,225.66]; %base temperatures [K]
g = 9.81; %acceleration due to gravity [m/s^2]
R = 287; %gas constant [J/(Kg*K)]
gama = 1.4; %specific heat ratios 
beta = 1.458 * 10^-6; %coefficient of air [kg/m.sec.sqrt(K)]
S = 110.4; %sutherland's constant for air [K]

for z = 1:105001
if z <= 11000
    j = 1; %index
    lamda = -6.5/1000; %gradient
    Tn = Ti(j);
    T(z) = Tn + ((z-0)*lamda); %Temperature
    p(z) = 101.325 * exp(-(g/(R*Tn))*(z-0)); %pressure
    rho(z) = p(z)/(R*T(z)); %density
elseif z <= 25000
    j = 2;
    lamda = 0;
    Tn = Ti(j);
    T(z) = Tn + ((z-11000)*lamda);
    p(z) = p(11000) * exp(-(g/(R*Tn))*(z-11000));
    rho(z) = p(z)/(R*T(z));
elseif z <= 47000
    j = 3;
    lamda = 3/1000;
    Tn = Ti(j);
    T(z) = Tn + ((z-25000)*lamda);
    p(z) = p(25000) * exp(-(g/(R*Tn))*(z-25000));
    rho(z) = p(z)/(R*T(z));
   
elseif z <= 53000
    j = 4;
    lamda =0;
    Tn = Ti(j);
    T(z) = Tn + ((z-47000)*lamda);
    p(z) = p(47000) * exp(-(g/(R*Tn))*(z-47000));
    rho(z) = p(z)/(R*T(z));
elseif z <= 79000
    j =5;
    lamda = -4.5/1000;
    Tn = Ti(j);
    T(z) = Tn + ((z-53000)*lamda);
    p(z) = p(53000) * exp(-(g/(R*Tn))*(z-53000));
    rho(z) = p(z)/(R*T(z));
elseif z <= 90000
    j =6;
    lamda = 0;
    Tn =Ti(j);
    T(z) = Tn + ((z-79000)*lamda);
    p(z) = p(79000) * exp(-(g/(R*Tn))*(z-79000));
    rho(z) = p(z)/(R*T(z));
else
    j =7;
    lamda = 4/1000;
    Tn = Ti(j);
    T(z) = Tn + ((z-90000)*lamda);
    p(z) = p(90000) * exp(-(g/(R*Tn))*(z-90000));
    rho(z) = p(z)/(R*T(z));

end 
end
aPREET = sqrt(gama*R.*T); %speed of sound
mu = (beta.*(T.^(3/2)))./(T+S); %viscosity
h = [0:105000];

rho = rho*1000;
%% Plotting
figure(1)
hold on
box on
grid on
plot(T,h,'LineWidth',2)
title('Temperature vs Altitude ')
xlabel('Temperature [K]')
ylabel('Altitude [m]')
figure(2)
hold on
box on
grid on
plot(p,h,'LineWidth',2)
title('Pressure vs Altitude')
xlabel('Pressure [Pa]')
ylabel('Altitude [m]')
figure (3)
hold on
box on
grid on
plot(rho,h,'LineWidth',2)
title('Density vs Altitude')
xlabel('Density [kg/m^3]')
ylabel('Altitude [m]')
figure (4)
hold on
box on
grid on
plot(aPREET,h,'LineWidth',2)
title('Speed of Sound vs Altitude')
xlabel('Speed of Sound [m/s]')
ylabel('Altitude [m]')
figure (5)
hold on
box on
grid on
plot(mu,h,'LineWidth',2)
title('Viscosity vs Altitude')
xlabel('Viscosity [N*s/m^2]')
ylabel('Altitude[m]')

    
