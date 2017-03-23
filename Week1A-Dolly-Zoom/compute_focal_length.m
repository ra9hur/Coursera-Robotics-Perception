function [ f ] = compute_focal_length( d_ref, f_ref, pos )
%% Compute camera focal length with given camera position.  
% 
% In this function, multiple camera positions will be given. The camera is
% placed on z axis and thus only z axis for the camera position is given.
% We'll need to compute corresponding focal length to achieve Dolly Zoom
% effect for each camera position.
%
% Input:
% - d_ref: 1 by 1 double, reference depth; distance of the object whose size remains constant
% - f_ref: 1 by 1 double, reference focal length; previous camera focal length
% - pos: 1 by n, each element represents camera center position on the z axis.
% Output:
% - f: 1 by n, camera focal length, each element corresponds to an element
% in pos, i.e., f(i) is the focal length for Dolly Zoom effect when the camera is placed at pos(i)

% YOUR CODE HERE
% compute focal length finds focal length such that the height of the object A remains constant 
% while the camera moves along with Z axis. 
% The reference depth, reference focal length and height of object A and the camera movement are given.

% This is correct as well
% f = 100 * (4-pos);

% pos_ref = pos(1);
f = f_ref * (d_ref - pos) / d_ref;
end