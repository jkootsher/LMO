%% ASEN 5010 Task 2 Capstone Standalone Function

%% Execute and verify
TOLERANCE = [0.000001,0.000001,0.000001];

HN = standalone.task2.frame(300);

RESULT(1,:) = abs(HN(1,:) - [-0.046477,0.874148,0.483431]) <= TOLERANCE;
RESULT(2,:) = abs(HN(2,:) - [-0.984172,-0.122922,0.127651]) <= TOLERANCE;
RESULT(3,:) = abs(HN(3,:) - [0.171010,-0.469846,0.866025]) <= TOLERANCE;

%% Print verification to terminal
if all(RESULT)
    fprintf("TASK 2 VERIFIED\n");
else
    fprintf("TASK 2 FAILED\n");
end