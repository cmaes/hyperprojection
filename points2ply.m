function points2ply(X, filename)
% points2ply(X, filename)
% Writes 3D data points to .ply file
% 
% Inputs:
%        X: 3 x N matrix containing N 3D points
% filename: name of ply file 
%
% For more information on the .ply format see
% http://en.wikipedia.org/wiki/PLY_(file_format) 

if size(X,1) ~= 3 
    error('size(X,1) should be 3\n');
end 

N = size(X,2);

fid = fopen(filename, 'w');

% Write header
fprintf(fid, 'ply\n');
fprintf(fid, 'format ascii 1.0\n');
fprintf(fid, 'comment made by Chris Maes\n'); 
fprintf(fid, 'element vertex %d\n', N)
fprintf(fid, 'property float x\n');
fprintf(fid, 'property float y\n');
fprintf(fid, 'property float z\n'); 
fprintf(fid, 'end_header\n');

for j=1:N
    fprintf(fid, '%f %f %f\n', X(1,j), X(2,j), X(3,j));
end

fclose(fid);
