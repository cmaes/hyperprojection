function [P, Z] = hyperplane_projection(a)
% [P, Z] = hyperplane_projection(a)
% 
%  Compute the projection matrix onto 
%  the subspace
% 
%  { x in R^n |  a'*x == 0 } 
%



Z = null(a');
% P = Z(Z'*Z)Z' really but null returns a matrix Z whose columns
% are orthonormal so Z'*Z = I
P =  Z*Z';   

