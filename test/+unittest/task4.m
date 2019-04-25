%% ASEN 5010 Task 4 Capstone Standalone Function

%% Execute and verify
TOLERANCEf = [0.001,0.001,0.001];
TOLERANCEw = [0.000001;0.000001;0.000001];

RN = standalone.task4.frame(330);
w = standalone.task4.w(330);

RESULT(1,:) = abs(RN(1,:) - [0.072582,-0.870578,-0.486648]) <= TOLERANCEf;
RESULT(2,:) = abs(RN(2,:) - [-0.982592,-0.146079,0.114775]) <= TOLERANCEf;
RESULT(3,:) = abs(RN(3,:) - [-0.171010,0.469846,-0.866025]) <= TOLERANCEf;
RESULT(4,:) = abs(w - [0.0001513;-0.0004157;0.0007663]) <= TOLERANCEw;

%% Print verification to terminal
if all(RESULT)
    fprintf("TASK 4 VERIFIED\n");
else
    fprintf("TASK 4 FAILED\n");
end