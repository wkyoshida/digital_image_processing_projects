%%%%%%%%%%%%%  Function invdistcalc %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Calculate the target pixel's value with inverse distance
%              interpolation given the 8-neighborhood values
% 
%      Inverse distance formula:
%              summation((pixel value)/(distance)) / 
%                   summation((1)/(distance))
%
% Input Variables:
%      f                MxN pre-interpolation image with missing pixel values
%      x                x coordinate of target pixel
%      y                y coordinate of target pixel
%      M, N             rows (M) and columns (N) in f
%      a                x coordinate of a neighborhood pixel
%      b                y coordinate of a neighborhood pixel
%      dist             distance between target and neighborhood pixel
%      sumnumerator     summation of all (pixel value)/(distance) values 
%                           for the inverse distance formula numerator
%      sumdenominator   summation of all (1)/(distance) values 
%                           for the inverse distance formula denominator
%      
% Returned Results:
%      interpolval  calculated target pixel value
%
% Processing Flow:  
%      1.  Cycle through all 8-neighborhood pixels,
%               ignoring beyond-border and other missing pixel values
%      2.  For every valid pixel,
%               calculate distance, numerator, and denominator values 
%               for formula
%      3.  Calculate final inverse-distance interpolation value
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

function [interpolval] = invdistcalc(f,x,y,M,N)

sumnumerator = 0;
sumdenominator = 0;

for a = (x - 1) : (x + 1)
    for b = (y - 1) : (y + 1)
        if ((a == x) && (b == y)) || (a <= 0) || (b <= 0) || (a > M) || (b > N) || (isnan(f(a,b)))
            continue;
        end   
        dist = sqrt((a-x)^2 + (b-y)^2);
        sumnumerator = sumnumerator + (f(a,b) / dist);
        sumdenominator = sumdenominator + (1 / dist);
    end
end

interpolval = sumnumerator / sumdenominator;