load('test.mat');

theta = [0; pi/2; pi; -pi/2];
Y = -Y;

m = length(theta);
N = size(Y,2);

% Plot 2d points
for i=1:m
    figure(i) 
    plot(Y(2*(i-1)+1,:), Y(2*i,:), 'b.');
    axis equal 
    hold on
    title(sprintf('Camera %d theta=%e\n', i, theta(i)));
end


X = find_points(R,theta,Y);

% Plot 3D reconstructed points 
figure(m+1)
scatter3(X(1,:), X(2,:), X(3,:));
axis equal;
title('3D reconstruction');

[A, Beta, X0] = camera2hyperplane(R, theta);

for i=1:m
    [P, Z] = hyperplane_projection(A(:,i));
    U = X - repmat(X0(:,i),1,N);
    y = Z'*U;
    figure(i)
    for j=1:N
        plot([y(1,j) Y(2*(i-1)+1,j)], [y(2,j) Y(2*i,j)], ...
             'r');
        hold on;
    end
    plot(y(1,:), y(2,:),'k*')
end
