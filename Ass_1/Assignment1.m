% From Question
Vrest = -70E-3; 
R_m = 10E6; 
tao = 10E-3; 
Vm = -70E-3;
Vth = -54E-3;
Vreset = -80E-3; 
time = 0.5; 

% Chosen values
Vspike = 0; 
dt = 1E-3;
I_max = 2E-9;

iterations =  time/dt;
I = zeros(iterations, 1); 
I(0.2* iterations + 1 : 0.8 * iterations) = I_max; 

% iterate through phase timesteps
for n= 1:iterations 

    % Manual Spikes
    if Vm == Vspike
        Vm = Vreset; 
    elseif Vm >= Vth
            Vm = Vspike;

    % Use the membrane equation
    else 
        dv = (1/tao) * ((-1* Vm) + Vrest + R_m*I(n,1)) * dt
        Vm = Vm + dv;
    end 

    % add to vector
    V(n, 1) = Vm; 
end

plot(V); 

