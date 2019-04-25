%% ASEN 5010 Task 5 Capstone Standalone Function

%% Execute and verify
TOLERANCEf = [0.001,0.001,0.001];
TOLERANCEw = [0.0000001,0.0000001,0.0000001];

RN = standalone.task5.frame(330);
w = standalone.task5.w(330);

RESULT(1,:) = abs(RN(1,:) - [0.265476,0.960928,0.078357]) <= TOLERANCEf;
RESULT(2,:) = abs(RN(2,:) - [-0.963892,0.266294,0.000000]) <= TOLERANCEf;
RESULT(3,:) = abs(RN(3,:) - [-0.020866,-0.075528,0.996925]) <= TOLERANCEf;
RESULT(4,:) = abs(w - [0.00001976,-0.00000546,0.00019129]) <= TOLERANCEw;

%% Print verification to terminal
if all(RESULT)
    fprintf("TASK 5 VERIFIED\n");
else
    fprintf("TASK 5 FAILED\n");
end