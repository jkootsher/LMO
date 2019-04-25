%% ASEN 5010 Task 3 Capstone Standalone Function

%% Execute and verify
TOLERANCEf = [0.001,0.001,0.001];
TOLERANCEw = [0.0000001;0.0000001;0.0000001];

RN = standalone.task3.frame(0);
w = standalone.task3.w(0);

RESULT(1,:) = abs(RN(1,:) - [-1,0,0]) <= TOLERANCEf;
RESULT(2,:) = abs(RN(2,:) - [0,0,1]) <= TOLERANCEf;
RESULT(3,:) = abs(RN(3,:) - [0,1,0]) <= TOLERANCEf;
RESULT(4,:) = abs(w - [0;0;0]) <= TOLERANCEw;

%% Print verification to terminal
if all(RESULT)
    fprintf("TASK 3 VERIFIED\n");
else
    fprintf("TASK 3 FAILED\n");
end