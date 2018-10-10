%%%%%%%%%%%%%  Function binaryimage %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Produce a binary image from input image and desired threshold
%
% Input Variables:
%      f       input 2D image
%      thresh  desired threshold intensity value
%      M, N    rows (M) and columns (N) for the desired image
%      u       3rd-dimension input image value (ignore)
%      x       x coordinate of a pixel
%      y       y coordinate of a pixel
%      
% Returned Results:
%      fbinary  created binary image
%
% Processing Flow:  
%      1.  Cycle through MxN array and fill with background 0 values
%               for pixels below threshold and 1 otherwise
%
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.  
%
%  The following functions are called:
%      NONE
%
%  Author:      Group 5
%  Date:        09/21/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [fbinary] = binaryimage(f,thresh)

% Get image dimensions, 
%   u is the 3rd-dimension, ignore

[M, N, u] = size(f);

% Create and write a new image "fbinary" that assigns foreground pixels
%    a value of 1 and background pixels a value of 0

for x = 1 : M        
    for y = 1 : N
        if f(x,y) >= thresh
            fbinary(x,y) = 1;
        else
            fbinary(x,y) = 0;
        end
    end
end