%%%%%%%%%%%%%  Function nn_interpolation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Perform a nearest neighbor interpolation to upscale an input image
%
% Input Variables:
%      f       MxN input 2D grayscale image to be upscaled
%      s       The number of times a x2 upscale should occur
%      
% Returned Results:
%     upsampled     new upsampled image
%
% Processing Flow:
%      1.  Setup the upsampled image to be 2^s width and height of
%           original image
%      2.  For s times:
%               - for each pixel in the upscaled image:
%                   - determine the corresponding "neighbor" pixel in the
%                   original image, and set the value.
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

function [upscaled] = nn_interpolation(f, s)
    for i = 1 : s
        [M, N] = size(f);
        M_new = 2 * M;
        N_new = 2 * N;
        for y = 1 : M_new
            for x = 1 : N_new
                f_new(y, x) = f(uint32(y / 2), uint32(x / 2));
            end
        end
        f = f_new;
    end
    upscaled = uint8(f);