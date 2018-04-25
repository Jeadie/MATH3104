n = 5;
%p_0 = 0.25; 
colours = ['r-', 'b-', 'g-', 'ro-', 'bo-', 'go-'];
t_span = [0, 20]; 
y0 = .90; % if this gets above about 0.92 it goes above 1 else it is bound by 1.  

hold on
for s= 0.01:0.05/n:0.05
    p_0 = 10*s; 
    ode_func = @(t,y) (((10*s + (p_0-10*s)*exp(-t/10))*(1-y))/(1.05-y)) - (0.2*y/(y+0.05)); 
    [t,y] = ode45(ode_func, t_span, y0);
    plot(t,y, colours(100*s +1))
end

hold off 




% Question 3


% ode_func = @(t,y) (((10*s + (p_0-10*s)*exp(-t/10))*(1-y))/(1.05-y)) - ((0.6-0.5*y)*y/(y+0.05)); 
