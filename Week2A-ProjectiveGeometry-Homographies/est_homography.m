function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE
H = [];

% Compute a1 and a2 for 4 points
x = video_pts(:,1);
y = video_pts(:,2);
X = logo_pts(:,1);
Y = logo_pts(:,2);

rows0 = zeros(4, 3);
rowsXY = -[x y ones(4,1)];
a1 = [rowsXY rows0 x.*X y.*X X];
a2 = [rows0 rowsXY x.*Y y.*Y Y];

%M1 = [a1; a2];
%M2 = [X; Y];
%H = inv(transpose(M1) * M1 ) * ( transpose(M1) * M2)

A = [a1; a2];
[U,S,V] = svd(A);
H = (reshape(V(:, end), 3, 3)).';

end
