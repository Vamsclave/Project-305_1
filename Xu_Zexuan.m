# Projet de groupe pour Info-f-305
# membres du groupe:
# - Xu Ze-xuan jason , 000541818
# - Bao Tran , 000516401

global R const_stefan absorbed_light E alpha_T A B Q

R = 2.912;#(w-yr)/((m^2)*k)
Q = 342 ;# W/(m^2)
alpha = 0.3 ;# albedo de la terre
const_stefan = 5.67*10^(-8);# W/((m^2)*(K^2)) , constante de Stefan-Boltzmann
absorbed_light = Q*(1-alpha);
E = 0.61; #facteur emissivite
A = 202;
B = 1.90;
alpha_T = @(T) 0.5 + 0.2 * tanh(0.1 * (265 - T - 273.5));




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
    legend('temperature','y=254.90');
    a = input('press enter to continue');
endfunction
function Question_1_bis(t,T0)
    display("graph for question 1")
    global R const_stefan absorbed_light
    ode_sys = @(t,T)[(absorbed_light-(const_stefan*T^4))/R];
    [t,T]= ode45(ode_sys, t, T0);
    plot(T,T,'DisplayName', 'temperature');
    hold on
    [t_bis,T_bis]= ode45(ode_sys, t, 400);
    plot(T_bis,T_bis,'DisplayName', 'temperature');
    xlabel('temperature(kelvin)')
    ylabel('temperature(kelvin)')
    hold on
    plot(254.9090, 254.9090,'ro')
    legend('temperature evolution with t0=0','temperature evolution with t0=400','temperature equilibrium = 254.90');
    a = input('press enter to continue');
endfunction
function Question_2(t,T0)
    display("graph for question 2")
    global R const_stefan Q
    legend_entries = {};
    for alpha = 0:0.1:1;
      ode_sys = @(t,T)[(Q*(1-alpha)-(const_stefan*T^4))/R];
      [t,T]= ode45(ode_sys, t, T0);
      plot(t,T,'DisplayName', 'temperature');

      xlabel('Time(years)');
      ylabel('temperature(kelvin)');
      hold on
      legend_entries = [legend_entries, sprintf('alpha = %.1f', alpha)];
    end
    legend(legend_entries, 'FontSize', 10);
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
    #ylim([0,500]) to be able to see all graph for e bigger than 0
    legend(legend_entries, 'FontSize', 10)
    a = input('press enter to continue');
endfunction
function Question_4(t,T0)
    display("graph for question 4")
    global R const_stefan absorbed_light A B
    ode_sys = @(t,T)[(absorbed_light-(A + B*T))/R];
    [t,T]= ode45(ode_sys, t, T0);
    plot(t,T,'DisplayName', 'temperature', 'LineWidth', 2);
    xlabel('Time(years)', 'FontSize', 24)
    ylabel('temperature(celcius)', 'FontSize', 24)
    set(gca, 'FontSize', 24);
    hold on
    a = input('press enter to continue');
endfunction
function Question_5()
    t = 2022:1:2300;
    T0 = 14.84;
    display("graph for question 5")
    global R const_stefan A B Q alpha_T
    ode_sys = @(t,T)[(Q*(1-alpha_T(T))-(A+(B*T)))/R];
    [t,T]= ode45(ode_sys, t, T0);
    plot(t,T,'DisplayName', 'temperature');
    hold on
    line([min(t), max(t)], [19.41, 19.41], 'Color', 'r', 'LineStyle', '--');
    legend('temperature','y=19.41')
    xlabel('Time(years)')
    ylabel('temperature(celsius)')
    a = input('press enter to continue');
endfunction
function Question_5_bis()
    display("graph for question 5")
    t = 2022:1:2300;
    T0 = 14.84;
    global R const_stefan A B Q alpha_T
    ode_sys = @(t,T)[(Q*(1-alpha_T(T))-(A+(B*T)))/R];
    [t,T]= ode45(ode_sys, t, T0);
    plot(T,T,'DisplayName', 'temperature');
    hold on
    [t_bis,T_bis]= ode45(ode_sys, t, 40);
    plot(T_bis,T_bis,'DisplayName', 'temperature');
    xlabel('temperature(celsius)')
    ylabel('temperature(celsius)')
    hold on
    plot( 19.41,  19.41,'ro')
    legend('temperature evolution with t0=14.84','temperature evolution with t0=40','temperature equilibrium = 19.41');
    a = input('press enter to continue');
endfunction

T0 = 0;# temperature moyenne
t = 0:1:(10^4); # temps en annee
#Question_1(t,T0);
#hold off;
#Question_1_bis(t,T0);
#hold off;
tq2 = 0:1:20
#Question_2(tq2,T0);
#hold off;

#Question_3(t,T0);
#hold off;
#Question_3_bis(t,T0);
#old off;
#Question_4(tq2, T0);

#Question_5()
#hold off;
#Question_5_bis()
#hold off;
