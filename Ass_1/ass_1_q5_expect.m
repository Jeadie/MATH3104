function firing_rate = ass_1_q5_expect( Iinj )
    Vrest = -70E-3; 
    R_m = 10E6; 
    tao = 10E-3; 
    Vth = -54E-3;
    Vreset = -80E-3; 
    time = 0.5; 

    % Chosen values
    Vspike = 0; 
    dt = 1E-4;
    firing_rate = 1 /(tao * log( (R_m * Iinj + Vrest - Vreset) / (R_m * Iinj + Vrest - Vth)) );

end

