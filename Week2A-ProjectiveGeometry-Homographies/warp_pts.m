function [ warped_pts ] = warp_pts( video_pts, logo_pts, sample_pts)
% warp_pts computes the homography that warps the points inside
% video_pts to those inside logo_pts. It then uses this
% homography to warp the points in sample_pts to points in the logo
% image
% Inputs:
%     video_pts: a 4x2 matrix of (x,y) coordinates of corners in the
%         video frame
%     logo_pts: a 4x2 matrix of (x,y) coordinates of corners in
%         the logo image
%     sample_pts: a nx2 matrix of (x,y) coordinates of points in the video
%         video that need to be warped to corresponding points in the
%         logo image
% Outputs:
%     warped_pts: a nx2 matrix of (x,y) coordinates of points obtained
%         after warping the sample_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% Complete est_homography first!
[ H ] = est_homography(video_pts, logo_pts);

% YOUR CODE HERE

warped_pts = [];
m = size(sample_pts,1);
sample_pts = [sample_pts ones(m,1)];

q = H * transpose(sample_pts);
q = transpose(q);
p = q(:,3);
warped_pts = abs(q(:,1:2)./p);

end

% http://math.stackexchange.com/questions/494238/how-to-compute-homography-matrix-h-from-corresponding-points-2d-2d-planar-homog
% http://www.peterkovesi.com/matlabfns/
% http://www.peterkovesi.com/matlabfns/Projective/homography2d.m
% https://in.mathworks.com/matlabcentral/answers/26141-homography-matrix