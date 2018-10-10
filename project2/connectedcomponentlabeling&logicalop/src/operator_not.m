%%%%%%%%%%%%%  Function operator_not %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To create a functions for the NOT unary-image 
%
% Input Variables:
%      fa       input 2D image1
%      M, N    rows (M) and columns (N) for the desired image
%      
% Returned Results:
%      new image after implement not opeartor
%
% Processing Flow:  
%      1.  Cycle through MxN array and change image gray scale value by 
%               using NOT operator to generate a new image.
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


function [operators] = operator_not(fa)
% Get image dimensions
    [M,N] = size(fa);
%using for loop to apply NOT operator in the image
        for x = 1 : M
            for y = 1 : N
                if fa(x,y) == 0 
                    f_not(x,y) = 255;
                else
                    f_not(x,y) = 0;
                end
            end
        end
       operators = uint8(f_not);