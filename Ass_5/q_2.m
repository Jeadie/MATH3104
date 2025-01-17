n=1000; 
i=1;
s= 0.0:0.05/n:0.05; 

analytic_func = @(s) ((0.21-9.5 .*s) - sqrt((9.5*s-0.21).^2 -2*(0.2-10.*s).*s))./ (0.4 - 20.*s);
y = analytic_func(s);

% fix discontinuity 
y(1,401) = 0.5;

plot(s, y); 
xlabel('s')
ylabel('equilibrium')
title('Analytic solution to Rp concentration for various synthesis rates')
return 


% Question 2
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
hold off


% Question 3
clf;
n = 100;

t_span = [0, 30]; 
y0 = .90; % if this gets above about 0.92 it goes above 1 else it is bound by 1.  


final_y = nan(2*(n-1), 1); 
i=1;
y_steady = 0; 

for s= 0.0:0.05/n:0.1
    p_0 = 10*s; 
    ode_func = @(t,y) (((s/(0.6-0.5*y) + (p_0-s/(0.6-0.5*y))*exp(-t/(0.6-0.5*y)))*(1-y))/(1.05-y)) - (0.2*y/(y+0.05)); 
    [t,y] = ode45(ode_func, t_span, y_steady);
    
    final_y(i,1) = y(length(y), 1);  
    if ~ isnan(y(length(y), 1))
        y_steady =y(length(y), 1);
    end
   i= i +1;
end

i=1;
final_y2 = nan(n-1, 1); 
for s= 0.1:-0.05/n:0.0
    p_0 = 10*s; 
    ode_func = @(t,y) (((s/(0.6-0.5*y) + (p_0-s/(0.6-0.5*y))*exp(-t/(0.6-0.5*y)))*(1-y))/(1.05-y)) - (0.2*y/(y+0.05)); 
    [t,y] = ode45(ode_func, t_span, y_steady);
    
    final_y2(i,1) = y(length(y), 1);  
    if ~ isnan(y(length(y), 1))
        y_steady =y(length(y), 1);
    end 
    i= i +1; 
end

hold on
plot(0.0:0.05/n:0.1, final_y, 'b.')  
plot(0.1:-0.05/n:0.0, final_y2, 'b.') 

xlabel('s')
ylabel('Rp Equilibrium');
title('Equilibrium value of concentration of  phosphorylated R');
pause 
