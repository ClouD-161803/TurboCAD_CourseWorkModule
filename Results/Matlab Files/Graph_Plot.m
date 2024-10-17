% Create a graph of efficiency vs volumetric flow rate
% Claudio Vestini
clc; clear;
% Data

% Volumetric flow rate (m^3/s)
Q_data = [0.002202889	0.002002191	0.00159118	0.001378002	0.001718671	...
    0.002154468	0.002342154	0.00238677
];
% Runner speed (RPM)
N_data = [1506	1503	1506	1509	1495	1504	1498	1505
];
% Guide vane angle (%)
Angle_data = [80	60	40	30	50	70	90	100
];
% Turbine efficiency (%)
n_data = [22.15904919	22.87471991	20.33630093	17.31455089	22.17086587 ...
    22.29029995	21.18653751	20.7886657
];

% Plot Graphs

% Turbine efficiency vs Volumetric flow rate

f1 = figure('Name','Efficiency Plot',...
    'NumberTitle','off');
% Get coefficients of a line fit through the data.
coefficients_1 = polyfit(Q_data, n_data, 2);
% Create a new x axis with exactly 1000 points.
xFit_1 = linspace(min(Q_data), max(Q_data), 1000);
% Get the estimated yFit value for each of those 1000 new x locations.
yFit_1 = polyval(coefficients_1 , xFit_1);
% Plot everything.
plot(Q_data, n_data, 'b.', 'MarkerSize', 15); % Plot training data.
% Set hold on so the next plot does not blow away the one we just drew.
hold on;
% Plot fitted line.
plot(xFit_1, yFit_1, 'k--', 'LineWidth', 2);
grid on;
xlabel('Volumetric flow rate (m^3/s)')
ylabel('Efficiency')
legend("Experimental data","Best fit line",'Location','southeast')

% Turbine efficiency vs Guide vane angle

f2 = figure('Name','Efficiency vs Angle',...
    'NumberTitle','off');
% Get coefficients of a line fit through the data.
coefficients_2 = polyfit(Angle_data, n_data, 2);
% Create a new x axis with exactly 1000 points.
xFit_2 = linspace(min(Angle_data), max(Angle_data), 1000);
% Get the estimated yFit value for each of those 1000 new x locations.
yFit_2 = polyval(coefficients_2 , xFit_2);
% Plot everything.
plot(Angle_data, n_data, 'r.', 'MarkerSize', 15); % Plot training data.
% Set hold on so the next plot does not blow away the one we just drew.
hold on;
% Plot fitted line.
plot(xFit_2, yFit_2, 'k--', 'LineWidth', 2);
grid on;
xlabel('Guide vane angle (%)')
ylabel('Efficiency (%)')
legend("Experimental data","Best fit line",'Location','southeast')

% Efficiency of Thom building turbine vs industrial turbine

% Industrial Turbine Data
industrial_Q = [0.081386684
0.10674116
0.128400969
0.150321739
0.17224251
0.195990011
0.225217705
0.254445399
0.294633479
0.334821558
0.375009637
0.418607614
0.452856476
0.495573875
0.535761955
0.575950034
0.612712993
0.656326193
0.696514272
0.736702351
0.778032138
0.81707851
0.857266589
0.897454669
0.940774287
0.975301508
1.018018907
1.058206986
1.098395065
1.136299731
1.178771224
1.218959303
1.259147383
1.301269648
1.339523541
1.379711621
1.4198997
1.463219318
1.49714432
1.540463938
1.580652018
1.620840097
1.660383448
1.701216256
1.741404335
1.781592414
1.825205614
1.861968573
1.902156652
1.942344732
1.984055087
2.019310993
2.06290897
2.103097049
2.143285128
2.182828479
2.223661287
2.263849366
2.304037446
2.347650645
2.372235398
];

industrial_n = [48.04708532
50.36982274
54.18750407
57.3103321
60.32082817
63.47896052
66.8061257
69.48337035
71.30076503
71.91348472
71.69290563
71.43719728
71.8305319
72.93059941
73.86193334
74.95257439
75.33399239
76.04321543
76.38633846
76.82749664
77.39809185
78.61663813
80.14843736
81.75376295
83.2172877
83.84832165
84.87863337
85.36880912
85.87123927
85.83983739
86.66777487
87.14569623
87.52558244
87.55009122
88.06477576
88.1995741
88.35888121
88.06039919
87.98337158
88.08928455
87.83194228
87.53783683
86.93160476
86.94962593
86.59424851
86.26337987
85.54496604
85.8222217
85.66291458
85.66291458
85.65168138
85.54608936
85.66291458
85.43008109
85.33204594
84.8620539
84.69481747
84.14336974
83.57966763
82.57097784
82.67488489
];
% Create figure
f3 = figure('Name','Industrial vs Thom',...
    'NumberTitle','off');
% Set hold on so the next plot does not blow away the one we just drew.
hold on;
% Plot fitted line.
plot(xFit_1*1000, yFit_1, 'k--', 'LineWidth', 2);
% Plot industrial line
plot(industrial_Q, industrial_n, 'b', 'LineWidth', 2)
grid on;
xlabel('Volumetric flow rate (L/s)')
ylabel('Efficiency')
legend("Thom Building Turbine","Industry Turbine",'Location','southeast')