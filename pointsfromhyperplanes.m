function X = pointsfromhyperplanes(AT,Beta,X0,Y,m)
% X = pointsfromhyperplanes(AT,Beta,X0,Y,m)
%
% Computes an estimate of a set of N points in n dimensions from the
% projection of these points onto m hyperplanes.
%
% Inputs:
%        AT: m x n matrix defines the hyperplane
%      Beta: m x 1 matrix defines the hyperplane 
%            All hyperplanes are in the form { x | a'*x == beta } 
%            a' for the ith hyperplane is defined by AT(i,:) 
%            beta for the ith hyperplane is defined by beta(i) 
%        X0: n x m matrix that defines the origin of the
%            hyperplanes.  a'*x0 = beta, x0 for the ith hyperplane
%            is given by X0(:,i) 
%         Y: m*(n-1) x N matrix that defines the projection of the 
%            points x onto the hyperplanes. Y(1:n,:) contains
%            the projection of each of the N points onto the 
%            first hyperplane. Y(m*(n-1):m*n,:) contains the
%            projections onto the mth hyperplane. 
% 
% Outputs: 
%        X: n x N matrix, the jth column is the jth point 

[m,n] = size(AT);
N = size(Y,2);

checkdims(Beta, [m,1], 'Dimensions of AT and Beta not consistent');
checkdims(X0, [n,m], 'Dimensions of AT and X0 not consistent');
checkdims(Y, [m*(n-1), N], 'Dimensions of AT, m, Y not consistent');

% Solve for the points one at a time. We could solve for them all
% at once, in a single shot, but this requires less thought. 
X = zeros(n,N);

for j=1:N
     % form and solve the least squares problem to determine the jth
     % point

     % logical m x 1 array that states whether the projection of 
     % the jth point on the ith hyperplane is available
     
     point_in_hp = ~any(isnan(reshape(Y(:,j), n-1, m)));

     mp = sum(point_in_hp);

     % Construct the matrices 
     A = zeros(n*mp,n); 
     Pdiag = zeros(n*mp,n*mp);
     Zdiag = zeros(n*mp,(n-1)*mp);
     Yj = zeros((n-1)*mp,1);
     X0i = zeros(n*mp,1);

     hyperplane_index = find(point_in_hp);

     for ii=1:mp
         i = hyperplane_index(ii); 
         [Pi,Zi] = hyperplane_projection(AT(i,:)');

         pindex = n*(ii-1)+1:n*ii;
         A(pindex, :) = Pi;
         Pdiag(pindex, pindex) = Pi; 

         zindex = (n-1)*(ii-1)+1:(n-1)*ii;
         Zdiag(pindex, zindex) = Zi;

         Yj(zindex) = Y((n-1)*(i-1)+1:(n-1)*i,j);
         X0i(pindex) = X0(:,i);
     end

     rhs = Pdiag*X0i + Zdiag*Yj;
     X(:,j) = A\rhs;

     fprintf('Residual point %d %e\n', j, norm(A*X(:,j)-rhs));
end






