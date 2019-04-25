%% Run all scripts for verification
% This is the ASEN 5010 Capstone Project function breakout
% The function breakout is organized according to the project description

%% Environment Configuration
folder = fileparts(which(mfilename));
folder = strcat(folder,'\..\env');
addpath(genpath(folder));
configure;

%% Part 1: Orbit States
support.reset;
scripts.orbit.state;

%% Part 2: Orbit Orientation
support.reset;
scripts.orbit.hill;

%% Part 3: Sun Pointing
support.reset;
scripts.pointing.sun;

%% Part 4: Nadir Pointing
support.reset;
scripts.pointing.nadir;

%% Part 5: Communications Pointing
support.reset;
scripts.pointing.gmo;

%% Part 6: Attitude Error Control
support.reset;
scripts.attitude.error;

%% Part 7: Attitude Integrator (RK4)
support.reset;
scripts.attitude.integrator;

%% Part 8: Sun Pointing Control
support.reset;
scripts.control.sun;

%% Part 9: Nadir Pointing Control
support.reset;
scripts.control.nadir;

%% Part 10: GMO Pointing Control
support.reset;
scripts.control.gmo;

%% Part 11: Final Simulation

% Run the simulation script scripts.sim manually
% The output is logged as task11out.txt in outputs/

%% Perform reset to put system in default state
support.reset;
evalin('base','clear all');