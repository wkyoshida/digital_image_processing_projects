%%%%%%%%%%%%%  Function operator_min %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To perform the MIN operation on two grayscale images
%
% Input Variables:
%      fa       input 2D image1
%      fb       input 2D image2
%      M, N    rows (M) and columns (N) for the desired image
%      
% Returned Results:
%      new image after implement MIN opeartor
%
% Processing Flow:  
%      1.  Cycle through MxN array and compare with 2 different images 
%               using MIN operator to generate a new image.
%
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.
%      Images must have the same dimensions.
%
%  The following functions are called:
%      NONE
%
%  Author:      Group 5
%  Date:        09/21/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [operators] = operator_min(fa,fb)
% Get image dimensions         
[M,N] = size(fa);
%using for loop to compare images and apply AND operator
        for x = 1 : M
            for y = 1 : N
                if fa(x, y) < fb(x, y)
                    f_min(x, y) = fa(x, y);
                else
                    f_min(x, y) = fb(x, y);
                end
            end
        end
       operators = uint8(f_min);


