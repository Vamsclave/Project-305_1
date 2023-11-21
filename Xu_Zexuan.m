global R const_stefan absorbed_light E

R = 2.912;#(w-yr)/((m^2)*k)
Q = 342 # W/(m^2)
alpha = 0.3 ;# albedo de la terre
const_stefan = 5.67*10^(-8)# W/((m^2)*(K^2)) , constante de Stefan-Boltzmann
absorbed_light = Q*(1-alpha)
E = 0.61 #facteur emissivite
function Question_1(t,T0)
    display("graph for question 1")
    global R const_stefan absorbed_light
    ode_sys = @(t,T)[(absorbed_light-(const_stefan*T^4))/R];
    [t,T]= ode45(ode_sys, t, T0);
    plot(t,T,'DisplayName', 'temperature');
    xlabel('Time(years)')
    ylabel('temperature(kelvin)')
    hold on
    line([min(t), max(t)], [254.9090, 254.9090], 'Color', 'r', 'LineStyle', '--');
    legend('temperature','y=254.90')
    a = input('press enter to continue');
endfunction
function Question_2()
    a = input('press enter to continue');
endfunction
function Question_3(t,T0)
    display("graph for question 3")
    global R const_stefan absorbed_light E
    ode_sys = @(t,T)[(absorbed_light-(E*const_stefan*T^4))/R];
    [t,T]= ode45(ode_sys, t, T0);
    plot(t,T,'DisplayName', 'temperature');
    xlabel('Time(years)')
    ylabel('temperature(kelvin)')
    hold on
    line([min(t), max(t)], [288.4382, 288.4382], 'Color', 'r', 'LineStyle', '--');
    legend('temperature','y=288.4382')
    a = input('press enter to continue');
endfunction
function Question_3_bis(t,T0)
    display("graph for question 3")
    global R const_stefan absorbed_light
    legend_entries = {};
    for e = 0:0.1:1;
      ode_sys = @(t,T)[(absorbed_light-(e*const_stefan*T^4))/R];
      [t,T]= ode45(ode_sys, t, T0);
      plot(t,T,'DisplayName', 'temperature');
      hold on
      xlabel('Time(years)')
      ylabel('temperature(kelvin)')
      legend_entries = [legend_entries, sprintf('e = %.1f', e)];
    end
    legend(legend_entries)
    a = input('press enter to continue');
endfunction



T0 = 0;# temperature moyenne
t = 0:1:(10^4); # temps en annee
Question_1(t,T0);
hold off;

Question_3(t,T0);
hold off;
Question_3_bis(t,T0);
hold off;
