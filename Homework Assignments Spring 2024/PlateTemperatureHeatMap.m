function [T_mean] = PlateTemperatureHeatMap(T_11, T_12, T_21, T_22)
% Plot a heat map of plate temperatures and return mean plate temperature.
% INPUT:
% plate interior temperatures: T11, T12, T21, and T22
% OUTPUT:
% mean plate temperature: T_mean
%
    % exterior temperatures (C)
    T_01 = 100;
    T_02 = 100;
    T_10 = 75;
    T_20 = 75;
    T_31 = 0;
    T_32 = 0;
    T_13 = 25;
    T_23 = 25;
    
    % corner temperatures (C)
    T_03 = mean([T_02 T_13]);
    T_33 = mean([T_23 T_32]);
    T_00 = mean([T_10 T_01]);
    T_30 = mean([T_20 T_21]);

    % plate temperatures
    T = [T_03 T_13 T_23 T_33;
        T_02 T_12 T_22 T_32;
        T_01 T_11 T_21 T_31;
        T_00 T_10 T_20 T_30
    ];
    
    % calc mean plate temperature
    T_mean = mean(T, 'all');
    fprintf("The mean plate temperature is %.2f.\n", T_mean)

    % generate a heat map plot
    heatmap(T);
    title("Steady-State Plate Temperature (C)")

end