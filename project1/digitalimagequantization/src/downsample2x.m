%%%%%%%%%%%%%  Function downsample2x %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Downsample a grayscale image by a factor of 2 
%           in an image 
%
% Input Variables:
%      f       MxN input 2D grayscale image to be downsampled
%      
% Returned Results:
%     downsampled     new downsampled image
%
% Processing Flow:
%      1.  Setup the downsampled image to be half the width and height of
%           original image
%      2.  For each pixel in the downsampled image:
%               - traverse the corresponding 2x2 region in the original
%               image
%               - Calculate the average of that region and set value in
%               downsampled image
%
%  Restrictions/Notes:
%      This function takes an 8-bit image with even dimensions as input. 
%
%  The following functions are called:
%      none
%
%  Author:      Andy Luo
%  Date:        09/03/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [downsampled] = downsample2x(f)
    [M, N] = size(f);
    M_half = M / 2;
    N_half = N / 2;
    for x = 1 : N_half
        for y = 1 : M_half
            f_down(y, x) = sum(sum(f(-1 + 2*y : 2*y, -1 + 2*x : 2*x))) / 4;
        end
    end
    downsampled = uint8(f_down);
