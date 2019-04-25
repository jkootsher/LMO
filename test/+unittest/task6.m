%% ASEN 5010 Task 6 Capstone Standalone Function

%% Execute and verify
TOLERANCEs = [0.001,0.001,0.001];
TOLERANCEw = [0.0001,0.0001,0.0001];

% Sun pointing
R = standalone.task3.frame(0);
w = standalone.task3.w(0);

[sb,wb] = standalone.task6.error(R,w);

RESULT(:,1) = abs(sb - [-0.775421,-0.473868,0.043079]) <= TOLERANCEs;
RESULT(:,2) = abs(wb' - [0.017453,0.030543,-0.038397]) <= TOLERANCEw;

% Nadir pointing
R = standalone.task4.frame(0);
w = standalone.task4.w(0);

[sb,wb] = standalone.task6.error(R,w);

RESULT(:,3) = abs(sb - [0.262265,0.554705,0.039424]) <= TOLERANCEs;
RESULT(:,4) = abs(wb' - [0.016849,0.030929,-0.038916]) <= TOLERANCEw;

% GMO pointing
R = standalone.task5.frame(0);
w = standalone.task5.w(0);

[sb,wb] = standalone.task6.error(R,w');

RESULT(:,5) = abs(sb - [0.016972,-0.382803,0.207613]) <= TOLERANCEs;
RESULT(:,6) = abs(wb' - [0.017297,0.030657,-0.038437]) <= TOLERANCEw;

%% Print verification to terminal
if all(RESULT)
    fprintf("TASK 6 VERIFIED\n");
else
    fprintf("TASK 6 FAILED\n");
end