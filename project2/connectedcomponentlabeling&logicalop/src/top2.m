%%%%%%%%%%%%%  Function top2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Produces an image that only retains the largest 2 connected
%      components in a labeled image.
%
% Input Variables:
%      labeled          input 2D image
%      num_components   total count of connected components in labeled
%      
% Returned Results:
%      output_image  image with all but largest two connected components
%                    set to zero
%
% Processing Flow:  
%      1.  Cycle through each pixel in labeled, track the count of pixels
%      corresponding to each connected component.
%      2.  Determine the two largest components
%      3.  Cycle through each pixel in labeled, and set output image pixel
%      value to labeled pixel value only if the value is one of the labels
%      for the two largest components.
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

function [output_image] = top2(labeled, num_components)
    [M, N] = size(labeled);
    output_image = zeros(M, N);
    
    % Count number of pixels per component
    count = zeros(num_components, 1);
    
    for x = 1 : M
        for y = 1 : N
            if(labeled(x,y) ~= 0)
                count(labeled(x,y)) = count(labeled(x,y)) + 1;
            end
        end
    end
    
    % Determine two largest regions
    [~, max1_ind] = max(count);
    count(max1_ind) = 0;
    [~, max2_ind] = max(count);
    
    % Delete the regions that don't correspond to the two largest regions
    for x = 1 : M
        for y = 1 : N
            if(labeled(x,y) == max1_ind || labeled(x,y) == max2_ind)
                output_image(x, y) = labeled(x, y);
            end
        end
    end
    output_image = uint8(output_image);
end

