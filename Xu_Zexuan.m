global R const_stefan absorbed_light

R = 2.912;#(w-yr)/((m^2)*k)
Q = 342 # W/(m^2)
alpha = 0.3 ;# albedo de la terre
const_stefan = 5.67*10^(-8)# W/((m^2)*(K^2)) , constante de Stefan-Boltzmann
absorbed_light = Q*(1-alpha)
function Question_1(t,T0)
    hold on
    global R const_stefan absorbed_light
    ode_sys = @(t,T)[(absorbed_light-(const_stefan*T^4))/R];
    [t,T]= ode45(ode_sys, t, T0);
    plot(t,T);
    line([min(t), max(t)], [254.9090, 254.9090], 'Color', 'r', 'LineStyle', '--');
endfunction





T0 = 0;# temperature moyenne
t = 0:1000:(10^4); # temps en annee
Question_1(t,T0);

