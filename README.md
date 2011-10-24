Hyperprojection 
==============================

These Matlab files compute an estimate of a set of points based on the
projection of these points on a set of hyperplanes.  The motivation
for this code is to reconstruct a set of points in 3 dimensions from a
set of 2d images.

Contents
-----------
* `test_driver`  A demostration of the code 
* `camera2hyperplane` construct a hyperplane based on camera position
* `hyperplane_projection` compute the projection matrices for a hyperplane
* `find_points` estimate 3d points based on 2d camera positions
* `pointsfromhyperplanes` solve the general hyperplane reconstruction problem
* `checkdims` utility to verify dimensions of input matrices 
* `math-notes` notes on the mathematics behind this code
* `Makefile` rules to make pdf notes


This code is release under the do anything you want with it license