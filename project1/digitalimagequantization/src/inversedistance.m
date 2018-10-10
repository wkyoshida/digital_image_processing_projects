%%%%%%%%%%%%%  Function inversedistance %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute an inverse-distance interpolation with a desired spatial
%              resolution of an image
%
% Input Variables:
%      f       MxN input 2D gray-scale image to be interpolated
%      A, B    rows (A) and columns (B), desired interpolated resolution
%      M, N    rows (M) and columns (N) in f
%      iter    number of times to conduct an inverse distance iteration,
%                   dependent on size of f and invdist, i.e. how many
%                   times to expand the image
%      i       current iteration of inverse distance
%      x       x coordinate of a pixel
%      y       y coordinate of a pixel
%      
% Returned Results:
%     invdist  new image containing the interpolated result
%
% Processing Flow:
%      1.  Find size of f and how many iterations will be needed
%      2.  For each iteration,
%             a. create and fill a 4x larger empty image with known values,
%             b. iterate through all pixels to find missing values, i.e.
%                   those needing an interpolated value calculation
%                   and call invdistcalc() for these
%
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.  
%
%  The following functions are called:
%      emptyarray   creates an empty matrix
%      invdistcalc  calculate target pixel value with inverse distance
%                       given 8-neighborhood values
%
%  Author:      Group 5
%  Date:        09/07/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [invdist] = inversedistance(f,A,B)

[M, N] = size(f);

iter = log2(A / M);

% Convert f to a 16-bit number, so we can do  sums > 255 correctly

f = uint16(f);

% Compute the interpolated output image

for i = 1 : iter
    
    %  Fill the output image with NaN's first
    
    invdist = emptyarray(M * 2, N * 2);
    for x = 1 : M
        for y = 1 : N
           invdist(x * 2, y * 2) = f(x,y);
        end
    end
    
    for x = 1 : (M * 2)
        for y = 1 : (N * 2)
           if isnan(invdist(x,y))
               invdist(x,y) = invdistcalc(invdist,x,y,M * 2,N * 2);
           end
        end
    end
    invdist = uint8(invdist);
    imwrite(invdist,['output_images/walkbridge_interpol_invdist_', int2str(M * 2), 'x', int2str(N * 2), '.png']);
    f = invdist;
    M = M * 2;
    N = N * 2;
end

% Convert back to an 8-bit image

invdist = uint8(invdist);

%%%%%%%%%%%%% End of the inversedistance.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%