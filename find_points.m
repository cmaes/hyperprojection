function X = find_points(R, theta, Y)
% X = find_points(R, theta, Y)
% 
% Computes an estimate of a set of 3d points X based on the positions
% of these points Y in the images from a set of cameras positions a
% distance R and angle theta away from the subject.
%
% Inputs: 
%      R: m x 1 vector specifing the distance to each camera
%  theta: m x 1 vector specifing the angle for each camera 
%      Y: 2*m x N vector specifing the position of each of 
%         the N points in the camera image
%
% Outputs:
%      X: 3 x N vector specifing the 3d position of each of 
%         the N points

m = size(R,1);
N = size(Y,2);

checkdims(R, [m 1], 'R must be a column vector');
checkdims(theta, [m 1], 'Dimensions of R and theta must match');
checkdims(Y,  [2*m, N], 'Dimensions of Y and R not consistent');


[A, Beta, C0] = camera2hyperplane(R, theta);

X = pointsfromhyperplanes(A', Beta, C0, Y, m);







