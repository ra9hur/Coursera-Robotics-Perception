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
%a1 = [-video_pts(:,1,:) -video_pts(:,2,:) -ones(4,1) zeros(4,1) zeros(4,1) zeros(4,1) mean(video_pts(:,1,:)*transpose(video_pts(:,1,:)),2) mean(video_pts(:,2,:)*transpose(video_pts(:,1,:)),2) video_pts(:,1,:)];
%a2 = [zeros(4,1) zeros(4,1) zeros(4,1) -logo_pts(:,1) -logo_pts(:,2) -ones(4,1) mean(logo_pts(:,1)*transpose(logo_pts(:,2)),2) mean(logo_pts(:,2)*transpose(logo_pts(:,2)),2) logo_pts(:,2)];
a1 = [-video_pts(:,1) -video_pts(:,2) -ones(4,1) zeros(4,1) zeros(4,1) zeros(4,1) video_pts(:,1).*logo_pts(:,1) video_pts(:,2).*logo_pts(:,1) logo_pts(:,1)];
%size(a1)
a2 = [zeros(4,1) zeros(4,1) zeros(4,1) -video_pts(:,1) -video_pts(:,2) -ones(4,1) video_pts(:,1).*logo_pts(:,2) video_pts(:,2).*logo_pts(:,2) logo_pts(:,2)];
%size(a2)
m = size(video_pts(:,1),1);
A = [];
A = [a1; a2];
%A1 = [];
%A2 = [];
%for i=1:m
%  a1 = [-video_pts(i,1) -video_pts(i,2) -1 0 0 0 video_pts(i,1)*transpose(video_pts(i,1)) video_pts(i,2)*transpose(video_pts(i,1)) transpose(video_pts(i,1))];
%  size(a1)
%  A1 = [A1; a1];
%  a2 = [0 0 0 -logo_pts(i,1) -logo_pts(i,2) -1 logo_pts(i,1)*transpose(logo_pts(i,2)) logo_pts(i,2)*transpose(logo_pts(i,2)) transpose(logo_pts(i,2))];
%  size(a2)
%  A2 = [A2; a2];
%a1 = [-video_pts(i,1) -video_pts(i,2) -1 0 0 0 video_pts(i,1)*logo_pts(i,1) video_pts(i,2)*logo_pts(i,1) logo_pts(i,1)];

%a2 = [0 0 0 -video_pts(i,1) -video_pts(i,2) -1 video_pts(i,1)*logo_pts(i,2) video_pts(i,2)*logo_pts(i,2) logo_pts(i,2)];

%  A = [A;a1;a2];
%end

%m = size(a1,1);
%A = [];
%for i=1:m
%  A = [A; a1(i,:); a2(i,:)];
%end

%A = [A1;A2];
[U,S,V] = svd(A);
%V = inv(transpose(a1) * a1 ) * ( transpose(a1) * a2);

H = reshape(V(:, end), 3, 3);
% H = H / sum(H(:))

%H = maketform('projective',video_pts, logo_pts);
%H = H.tdata.T;

% H = estimateGeometricTransform(video_pts, logo_pts, 'projective');

end


%% ---------------------------------------------
%warning: matrix singular to machine precision
%warning: called from
%    est_homography at line 25 column 3
%    warp_pts at line 20 column 4
%    project_logo at line 42 column 21
%error: sub2ind: subscript indices must be either positive integers less than 2^31 or logicals
%error: called from
%    inverse_warping at line 14 column 13
%    project_logo at line 47 column 22

% Error using sub2ind (line 55)
% Out of range subscript.

% Error in inverse_warping (line 14)
% ind_initial = sub2ind([size(img_initial,1) size(img_initial,2)],...

% Error in project_logo (line 47)
% projected_imgs{i} = inverse_warping(video_imgs{i},...
%% ---------------------------------------------