%% ASEN 5010 Mars Orbiter Capstone Project
% Author: Jason Kootsher

%% Instantiate a simulator with the desired runtime in seconds
addpath('env'); configure;
simulator = exe.simulator;
simulator = simulator.run;