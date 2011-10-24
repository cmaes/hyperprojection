function [A, Beta, X0] = camera2hyperplane(R, theta)
% [A, Beta, X0] = camera2hyperplane(R, theta)
% 
% Given an R, theta define the equation 
% of a plane in three-space 
%    alpha*x + gamma*y + delta*z = beta
%  a = [ alpha; gamma;  delta]
%
%  x0 is the origin of the plane
%
% Inputs: 
%      R: m x 1 the distance to the camera
%  theta: m x 1 the angle to the camera 
%
% Outputs: 
%      A: 3 x m  A(:,i) contains the coefficents for ith hyperplane
%   Beta: m x 1  Beta(i) contains coefficent for ith hyperplane
%     X0: 3 x m  X0(:,i) contains the origin of the ith hyperplane

A    = [ cos(theta) sin(theta) zeros(size(theta))]';
Beta = R;
X0   = [R.*cos(theta) R.*sin(theta) zeros(size(theta))]';



