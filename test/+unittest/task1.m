%% ASEN 5010 Task 1 Capstone Standalone Function

%% Generate test data (LMO)
[R,O] = support.setup("LMO",450);

%% Execute and verify LMO state
[r,v] = standalone.task1.state(R,O);

TOLERANCEr = [1.0;1.0;1.0];
TOLERANCEv = [0.001;0.001;0.001];

RESULT(1,:) = abs(r - [-669.3;3227.5;1883.2]) <= TOLERANCEr;
RESULT(2,:) = abs(v - [-3.2560;-0.7978;0.2101]) <= TOLERANCEv;

%% Generate test data (GMO)
[R,O] = support.setup("GMO",1150);

%% Execute and verify GMO state
[r,v] = standalone.task1.state(R,O);

RESULT(3,:) = abs(r - [-5399;-19698;0]) <= TOLERANCEr;
RESULT(4,:) = abs(v - [1.3966;-0.3828;0]) <= TOLERANCEv;

%% Print verification to terminal
if all(RESULT)
    fprintf("TASK 1 VERIFIED\n");
else
    fprintf("TASK 1 FAILED\n");
end