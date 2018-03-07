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

% rsa value from question 
tao_sra = 100E-3;
dg_sra = 0.3;
V_k = -70E-3; 
r_sra = 1; 
g_sra_init = 0; 
g_sra = g_sra_init; 



iterations =  time/dt;
I = zeros(iterations, 1); 
I(0.2* iterations + 1 : 0.8 * iterations) = I_max; 

% iterate through phase timesteps
for n= 1:iterations 

    % Manual Spikes 
    if Vm >= Vth
        V(n, 1) = Vspike;
        Vm = Vreset;
        g_sra += dg_sra; 

    % Use the membrane equation
    else 
        dv = (1/tao) * ((-1* Vm) + Vrest + R_m*I(n,1) - g_sra * r_sra * (Vm - V_k) ) * dt 
        Vm = Vm + dv;
        
        % Spike rate adaptation variable updates
        dg = (-1 * g_sra/tao_sra) * dt
        g_sra = g_sra + dg; 
        V(n, 1) = Vm; 
    end 
end

hold on 
xlabel('Time (ms)')
ylabel('Membrane Voltage (V) ')
title('Membrane Voltage with spike rate adaptation(V) vs Time (ms)')
plot(V); 
hold off

