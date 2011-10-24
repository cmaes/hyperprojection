N = 20;  % The number of 3d points
m = 4;   % The number of cameras 

% Create a random set of points 
X = 3*randn(3, N);

% Set up the cameras 
R = 10*ones(m,1); 
theta = linspace(0,2*pi,m)';

% Compute the hyperplanes defined by the camera 
% positions
[A, Beta, X0] = camera2hyperplane(R, theta);

% Compute the projection of the 
% 3d points onto the camera planes 
Y = zeros(2*m, N);
sigma = 0.01;
for i=1:m
    [P,Z] = hyperplane_projection(A(:,i));
    % Add noise to the points
    Y(2*(i-1)+1:2*i,:) = Z\(X + sigma*randn(3,N) - repmat(X0(:,i),1,N));
end


Xest = find_points(R, theta, Y); 

scatter3(Xest(1,:), Xest(2,:), Xest(3,:),1,'b');
hold on;
scatter3(X(1,:), X(2,:), X(3,:),1,'r');




