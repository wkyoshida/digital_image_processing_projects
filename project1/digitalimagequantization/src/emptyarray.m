%%%%%%%%%%%%%  Function emptyarray %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Set up an MxN image full of NaN's (Not a Number)
%
% Input Variables:
%      M, N    rows (M) and columns (N) for the desired image
%      x       x coordinate of a pixel
%      y       y coordinate of a pixel
%      
% Returned Results:
%      emptyimage  new image full of all NaN's
%
% Processing Flow:  
%      1.  Cycle through MxN array and fill with NaN's
%
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.  
%
%  The following functions are called:
%      NONE
%
%  Author:      Group 5
%  Date:        09/07/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [emptyimage] = emptyarray(M,N)
for x = 1 : M        
    for y = 1 : N    
        emptyimage(x,y) = NaN;
    end
end