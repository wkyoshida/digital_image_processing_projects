%%%%%%%%%%%%%  Function grayscale_downsample %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Downsample the input image to use a specified number of bits to
%      represent the grayscale levels.
%
% Input Variables:
%      f       MxN input 2D grayscale image to be downscaled
%      b       The number of grayscale level bits to use
%      
% Returned Results:
%     downsampled     new downsampled image image
%
% Processing Flow:
%      1.  Given the number of bits, calculate grayscale quantization value
%      2.  For each pixel in image, linearly map value to between 0 and
%          b-1, then multiply by the grayscale quantization value
%
%  Restrictions/Notes:
%      This function takes an 8-bit grayscale image as input. The number of
%      bits must be between 1 and 7 inclusive.
%
%  The following functions are called:
%      none
%
%  Author:      Naisong Chen
%  Date:        09/03/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [downscaled] = grayscale_downsample(f, b)
    [M, N] = size(f);
    gs_delta = 2 ^ (8 - b);
    for x = 1 : N
        for y = 1 : M
            f_new(y, x) = gs_delta * (f(y, x) / gs_delta);
        end
    end
    downscaled = uint8(f_new);
