Author: Jason Kootsher
Release: 1.0
Date: 4/25/2019

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Welcome to the ASEN 5010 Low Mars Orbiter simulator!
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

This simulation code is intended to simulate a low Mars orbit satellite.
The goal of this craft is to charge its batteries via solar arrays when in
between Mars and the sun, communicate with an orbiter on the Mars elliptic plane,
and collect data from the surface of Mars!

In order to run this simulator, simply run the script 'simulation.m' and watch the orbiter!

The default run time is 6500 loop iterations (seconds for the purpose of the sim), but this
can be varied by simply adding an argument to line 7 for simulator.run().

Example: simulator.run(10000) will run for 10000 loop iterations.

The exception to the above is if the class tools.get.constant has its sampling frequency changed (h).
Some values do not behave as intended in version 1.0 for varying h, so it is recommended to be left
at the default value of 1 Hz.

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Testing
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

There are two testing modes, verification mode and unittest mode. To run a full verification
of the object oriented simulator, simply run the script test/verification.m; this script
runs the appropriate task sequencing for the Capstone of all scripts located in the +scripts
library.

To run the unittests, simply enter the +unittest library and select either runall.m, or your
unittest of choice. These tests will run the standalone functions that are removed from the
object oriented simulator and are a great way to error check. There are only unittests for the
first 7 tasks however, due to the fact the remaining tasks simply build on this functionality.
If any of tasks 1-7 don't work, you have no chance of getting 8-11!

To view any plots, be sure to reference the Matlab variable or object correctly! There is a
simple plotting tool in tools/analysis/ called xplot.m that takes a data series as input and
outputs a generic, labeled plot.

Example: xplot(simulation.LMO.s.ts.data') in the command window will plot the MRP time series
data for the LMO satellite.

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Documentation
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

The documentation included in this software suite consists of an Open Office formatted report of
the simulator, as well as a PDF. The tex/ directory consists of supporting equations used in these
reports.

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Please report any feedback to j2kooch@vt.edu
