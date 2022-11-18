function prop = atm(alt)

T0 = 288;
P0 = 101325;
g0 = -9.81; 
R = 287; 
alt0 = 0; 

% Lapse rates for each layer:
l1 = -0.0065;
l3 = 0.001;
l4 = 0.0028;
% L5 and L2 are not needed
l6 = -0.0028;
l7 = -0.002;

if alt >= 0 && alt <= 11000
    T = T0 + l1*(alt - alt0);
    P = P0 *(T/T0)^(g0/(l1*R));
    rho = P/(R*T);
elseif alt > 11000 && alt <= 20000
    T = T0 + l1*(11000 - alt0);
    P = P0*(T/T0)^(g0/(l1 * R));
    P = P*exp(((g0/(R* T)))*(alt-11000));
    rho = P/(T*R);
elseif alt > 20000 && alt <= 32000
    T = T0 + l1*(11000 - alt0);
    T1 = T; 
    P = P0 * (T/T0)^(g0/(l1 * R));
    P = P * exp(((g0/(R*T)))*(20000-11000));
    T = T + l3*(alt - 20000);
    P = P * (T/T1)^(g0/(l3 * R));
    rho = P/(R* T);
elseif alt > 32000 && alt <= 47000
    T = T0 + l1*(11000 - alt0);
    T1 = T;
    P = P0 * (T/T0)^(g0/(l1 * R));
    P = P * exp(((g0/(R *T)))*(20000-11000));
    T = T + l3*(32000 - 20000);
    
    T2 = T;
    P = P * (T/T1)^(g0/(l3 * R));
    T = T + l4*(alt - 32000);
    P = P * (T/T2)^(g0/(l4 * R));
    rho = P/(R*T);
elseif alt > 47000 && alt <= 51000
    T = T0 + l1*(11000 - alt0);
    T1 = T;
    P = P0 * (T/T0)^(g0/(l1 * R));
    P = P * exp(((g0/(R*T)))*(20000-11000));
    T = T + l3*(32000 - 20000);
    P = P * (T/T1)^(g0/(l3 * R));
    
    T2 = T;
    T = T + l4*(47000 - 32000);
    P = P * (T/T2)^(g0/(l4*R));
    P = P * exp(((g0/(R *T)))*(alt-47000));
    rho = P/(R*T);
elseif alt > 51000 && alt <= 71000
    T = T0 + l1*(11000 - alt0);
    T1 = T;
    P = P0 * (T/T0)^(g0/(l1*R));
    P = P * exp(((g0/(R*T)))*(20000-11000));
    T = T + l3*(32000 - 20000);
    P = P * (T/T1)^(g0/(l3 * R));
    T2 = T;
    T = T + l4*(47000 - 32000);
    T3 = T;
    P = P * (T/T2)^(g0/(l4 * R));
    P = P * exp(((g0/(R *T)))*(51000-47000));
    T = T + l6*(alt - 51000);
    P = P * (T/T3)^(g0/(l6 * R));
    rho = P/(R * T);
elseif alt > 71000
    T = T0 + l1*(11000 - alt0);
    T1 = T;
    P = P0 * (T/T0)^(g0/(l1 * R));
    P = P * exp(((g0/(R *T)))*(20000-11000));
    T = T + l3*(32000 - 20000);
    P = P * (T/T1)^(g0/(l3 * R));
    T2 = T;
    T = T + l4*(47000 - 32000);
    T3 = T;
    P = P * (T/T2)^(g0/(l4 * R));
    P = P * exp(((g0/(R *T)))*(51000-47000));
    T = T + l6*(71000 - 51000);
    T4 = T;
    P = P * (T/T3)^(g0/(l6 * R));
    T = T + l7*(alt - 71000);
    P = P * (T/T4)^(g0/(l7 * R));
    rho = P/(R* T);
end

% Time to convert

prop.T = T;
prop.P = P;
prop.rho = rho;
end
