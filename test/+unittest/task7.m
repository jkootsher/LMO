%% ASEN 5010 Task 7 Capstone Standalone Function

%% Execute and verify
TOLERANCEa = [0.001,0.001,0.001];
TOLERANCEb = [0.00001,0.00001,0.00001];

constant = tools.get.constant.value;

% Control Torque of [0;0;0]
constant.L = [0;0;0];

[H,T,s] = standalone.task7.integrator;

% Angular momentum (inertial,body), kinetic energy (rotational), MRP set
RESULT(:,1) = abs(H(:,1)' - [-0.264126,0.252782,0.055269]) <= TOLERANCEa;
RESULT(:,2) = abs(H(:,2)' - [0.137897,0.132662,-0.316388]) <= TOLERANCEa;
RESULT(:,3) = abs(T' - [0.009384,0,0]) <= TOLERANCEb;
RESULT(:,4) = abs(s' - [0.137659,0.560270,-0.032173]) <= TOLERANCEa;

% Issue reset to clear data buffers
evalin('base','clearvars -except RESULT');
TOLERANCEa = [0.001,0.001,0.001];
constant = tools.get.constant.value;

% Control Torque of [0.01;-0.01;0.02]
constant.L = [0.01;-0.01;0.02];

[~,~,s] = standalone.task7.integrator;
RESULT(:,5) = abs(s' - [-0.22686074,-0.64138592,0.24254998]) <= TOLERANCEa;

%% Print verification to terminal
if all(RESULT)
    fprintf("TASK 7 VERIFIED\n");
else
    fprintf("TASK 7 FAILED\n");
end