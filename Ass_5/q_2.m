n=100; 
final_y = nan(n-1, 1); 
i=1;
for s= 0.0:0.05/n:0.05
    p_0 = 10*s; 
    C_p = @(t) 10*s-(p_0-10*s )* exp(-0.1*t) ; 
    cp = C_p(30); 
    rp = @(t) 0.1*cp / ((0.95 * cp - 0.21) + sqrt((0.95*cp-0.21)^2 - 0.2*(0.2- cp)*cp)); 
        
    final_y(i,1) = rp(30);   
    i= i +1; 
end
% plot(0.00:0.05/n:0.05, final_y) 
return


n = 100;
colours = ['r-', 'b-', 'g-', 'ro-', 'bo-', 'go-'];
t_span = [0, 30]; 
y0 = .90; % if this gets above about 0.92 it goes above 1 else it is bound by 1.  

hold on
final_y = nan(n-1, 1); 
i=1;
for s= 0.0:0.05/n:0.05
    p_0 = 10*s; 
    ode_func = @(t,y) (((10*s + (p_0-10*s)*exp(-t/10))*(1-y))/(1.05-y)) - (0.2*y/(y+0.05)); 
    [t,y] = ode45(ode_func, t_span, y0);
    
    plot(t,y, colours(mod(i,5) + 1));
    final_y(i,1) = y(length(y), 1);  
    i= i +1; 
end
xlabel('time t')
ylabel('Rp concentration')
title('Rp concentration for various synthesis rates')
hold off
pause


plot(0.00:0.05/n:0.05, final_y) 
xlabel('s')
ylabel('equilibrium');
title('equilibrium value of concentration of  phosphorylated R');
pause 

% Question 3

n = 100;
%p_0 = 0.25; 
colours = ['r-', 'b-', 'g-', 'ro-', 'bo-', 'go-'];
t_span = [0, 30]; 
y0 = .90; % if this gets above about 0.92 it goes above 1 else it is bound by 1.  

hold on
final_y = nan(n-1, 1); 
i=1;
for s= 0.0:0.05/n:0.1
    p_0 = 10*s; 
    ode_func = @(t,y) (((s/(0.6-0.5*y) + (p_0-s/(0.6-0.5*y))*exp(-t/(0.6-0.5*y)))*(1-y))/(1.05-y)) - (0.2*y/(y+0.05)); 
    [t,y] = ode45(ode_func, t_span, y0);
    
    plot(t,y, colours(mod(i,5) + 1));
    final_y(i,1) = y(length(y), 1);  
    i= i +1; 
end
xlabel('time t')
ylabel('Rp concentration')
title('Rp concentration for various synthesis rates')
hold off
pause


plot(0.00:0.05/n:0.1, final_y, 'ro') 
xlabel('s')
ylabel('equilibrium');
title('equilibrium value of concentration of  phosphorylated R');
pause 
