function [proj_points, t, R] = ar_cube(H,render_points,K)
%% ar_cube
% Estimate your position and orientation with respect to a set of 4 points on the ground
% Inputs:
%    H - the computed homography from the corners in the image
%    render_points - size (N x 3) matrix of world points to project
%    K - size (3 x 3) calibration matrix for the camera
% Outputs: 
%    proj_points - size (N x 2) matrix of the projected points in pixel
%      coordinates
%    t - size (3 x 1) vector of the translation of the transformation
%    R - size (3 x 3) matrix of the rotation of the transformation
% Written by Stephen Phillips for the Coursera Robotics:Perception course

% YOUR CODE HERE: Extract the pose from the homography
% init_R = inv(K) * H(:, 1:3);

% H1 = inv(K)*H;
H1 = K\H;

[U, D, V] = svd([H1(:,1) H1(:,2) cross(H1(:,1),H1(:,2))]);

I = [1 0 0; 0 1 0; 0 0 det(U*transpose(V))];
R = U * I * transpose(V);
t = H1(:,3)/max(D(:));

% YOUR CODE HERE: Project the points using the pose
% m = size(render_points,1);
% render_points = [render_points ones(m,1)];
% proj_points = K * [R t] * transpose(render_points);
proj_points = K * (R * transpose(render_points) + t);
proj_points = transpose(proj_points);
proj_points = proj_points ./ proj_points(:,3);
proj_points = proj_points(:,1:2);


end
