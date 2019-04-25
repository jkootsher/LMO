function xplot(data)
% XPlot is an autogen plot tool for specified data
h = tools.get.constant.value.h;
dn = tools.get.constant.value.dn;

figure; dx = linspace(0,dn*h,numel(data(:,1)));
x = [dx;dx;dx]; plot(x',data);

title("State vs Time (seconds)");
xlabel("Time (seconds)"); ylabel("State (units)");
legend('i','j','k');
end

