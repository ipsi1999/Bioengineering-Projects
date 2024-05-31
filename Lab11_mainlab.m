function dxdt = incoherent_feedforward(t, x, k1, k2, k3, k4, k5, k6)
    I = 1; Ex = 1; Ey = 1;  % Assume concentrations as 1
    dxdt = zeros(6, 1);
    dxdt(1) = -k1 * I * x(1) + k2 * x(2);       % d[X]/dt
    dxdt(2) = k1 * I * x(1) - k2 * x(2);        % d[X-P]/dt
    dxdt(3) = -k3 * x(2) * x(3) + k4 * x(4);    % d[Y]/dt
    dxdt(4) = k3 * x(2) * x(3) - k4 * x(4);     % d[Y-P]/dt
    dxdt(5) = -k5 * x(2) * x(5) + k6 * x(4);    % d[Z]/dt
    dxdt(6) = k5 * x(2) * x(5) - k6 * x(4);     % d[Z-P]/dt
end

% Parameters
k1 = 1; k2 = 1; k3 = 1; k4 = 1; k5 = 1; k6 = 1;
x0 = [1; 0; 1; 0; 1; 0];  % Initial concentrations
tspan = [0 10];

% Solve ODE
[t, x] = ode45(@(t, x) incoherent_feedforward(t, x, k1, k2, k3, k4, k5, k6), tspan, x0);

% Plot
figure;
subplot(3, 1, 1);
plot(t, x(:, 2));
xlabel('Time');
ylabel('[X-P]');
title('Temporal profile of X-P');

subplot(3, 1, 2);
plot(t, x(:, 4));
xlabel('Time');
ylabel('[Y-P]');
title('Temporal profile of Y-P');

subplot(3, 1, 3);
plot(t, x(:, 6));
xlabel('Time');
ylabel('[Z-P]');
title('Temporal profile of Z-P');


%Computational Model of MAPK Cascade
function dxdt = MAPK_cascade(t, x, V1, k1, k2, k3, k4, k5, k6, K1, K2, K3, K4, K5, K6)
    dxdt = zeros(6, 1);
    dxdt(1) = V1 * (K1 / (K1 + x(1))) - k1 * x(1); % d[MKKK]/dt
    dxdt(2) = k1 * x(1) - k2 * x(2);               % d[MKKK-P]/dt
    dxdt(3) = k2 * x(2) - k3 * x(3);               % d[MKK]/dt
    dxdt(4) = k3 * x(3) - k4 * x(4);               % d[MKK-PP]/dt
    dxdt(5) = k4 * x(4) - k5 * x(5);               % d[MAPK]/dt
    dxdt(6) = k5 * x(5) - k6 * x(6);               % d[MAPK-PP]/dt
end

% Parameters
% Parameters
V1 = 0.1; k1 = 0.2; k2 = 0.3; k3 = 0.4; k4 = 0.5; k5 = 0.6; k6 = 0.7;
K1 = 0.1; K2 = 0.2; K3 = 0.3; K4 = 0.4; K5 = 0.5; K6 = 0.6;
x0 = [1; 0; 1; 0; 1; 0];  % Initial concentrations
tspan = [0 5000];

% Solve ODE
[t, x] = ode45(@(t, x) MAPK_cascade(t, x, V1, k1, k2, k3, k4, k5, k6, K1, K2, K3, K4, K5, K6), tspan, x0);

% Plot
figure;
subplot(3, 1, 1);
plot(t, x(:, 2));
xlabel('Time');
ylabel('[MKKK-P]');
title('Temporal profile of MKKK-P');

subplot(3, 1, 2);
plot(t, x(:, 4));
xlabel('Time');
ylabel('[MKK-PP]');
title('Temporal profile of MKK-PP');

subplot(3, 1, 3);
plot(t, x(:, 6));
xlabel('Time');
ylabel('[MAPK-PP]');
title('Temporal profile of MAPK-PP');

%Ultra Sensitivity
V1_values = 0:0.1:3;
max_MKKK_P = zeros(size(V1_values));
max_MKK_PP = zeros(size(V1_values));
max_MAPK_PP = zeros(size(V1_values));

for i = 1:length(V1_values)
    V1 = V1_values(i);
    [t, x] = ode45(@(t, x) MAPK_cascade(t, x, V1, k1, k2, k3, k4, k5, k6, K1, K2, K3, K4, K5, K6), tspan, x0);
    max_MKKK_P(i) = max(x(:, 2));
    max_MKK_PP(i) = max(x(:, 4));
    max_MAPK_PP(i) = max(x(:, 6));
end

% Plot
figure;
plot(V1_values, max_MKKK_P, 'r', V1_values, max_MKK_PP, 'g', V1_values, max_MAPK_PP, 'b');
xlabel('V1 values');
ylabel('Max Concentrations');
legend('MKKK-P', 'MKK-PP', 'MAPK-PP');
title('Ultra-sensitivity Analysis');
