function u = cct(~)
% Derivation of control torque
I = tools.get.ic.inertia;
L = tools.get.constant.value.L;

u = I\L;
end

