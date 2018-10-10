%%%%%%%%%%%%%  Function operator_xor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To create a functions for the XOR binary-image 
%
% Input Variables:
%      fa       input 2D image1
%      fb       input 2D image2
%      M, N    rows (M) and columns (N) for the desired image
%      
% Returned Results:
%      new image after implement XOR opeartor
%
% Processing Flow:  
%      1.  Cycle through MxN array and compare with 2 different images 
%               using XOR operator to generate a new image.
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


function [operators] = operator_xor(fa,fb)
% Get image dimensions
    [M,N] = size(fa);
%using for loop to compare images and apply XOR operator
        for x = 1 : M
            for y = 1 : N
                if fa(x,y) == 0 && fb(x,y) == 0
                    f_xor(x,y) = 0;
                elseif fa(x,y) == 1 && fb(x,y) == 1
                    f_xor(x,y) = 0;
                else
                    f_xor(x,y) = 255;
                end
            end
        end

    
    
       operators = uint8(f_xor);