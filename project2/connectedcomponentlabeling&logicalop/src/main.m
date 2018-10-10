%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Apply sequences of simple image-processing operations on images
%
% Input Variables:
%      f1      input 2D image
%      
% Returned Results:
%      fthresh      Binary image of an input image
%      flabel       Image with labeled components
%      fRGB         Image with color-labeled components
%      num          Number of total connected-omponents 
%
% Processing Flow:
%      1.  Load input image
%      2.  Produce binary image of input image
%      3.  Color label the connected-components of binary image
%      4.  Perform the logical operators on a set of match images
%      5.  Perform the min operator on two grayscale images
%
%  Restrictions/Notes:
%
%  The following functions are called:
%      binaryimage()       produce a binary image
%      bwlabel()           creates a labeled image
%      label2rgb()         codes labels into color-labels
%      top2()              from a labeled image, retain the largest 2
%                          connected components
%      operator_and()      performs AND operation on two binary images
%      operator_not()      performs NOT operation on a binary images
%      operator_or()       performs OR operation on two binary images
%      operator_xor()      performs XOR operation on two binary images
%      operator_min()      performs MIN operation on two grayscale images
%
%  Author:      Group 5
%  Date:        09/21/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Clear out all memory 
clear;
clc;

%  Read in image "lake.tif" into array "f1"

f1=imread('lake.tif');

%%%%%%%%%%%%%%%%%%%% Part (a) of 1 - binary image %%%%%%%%%%%%%%%%%%%%%%%%%

% Produce and save binary image from input image and chosen threshold 
%      1.  Cycle through MxN array and fill with background 0 values
%               for pixels below threshold and 1 otherwise

fthresh = binaryimage(f1,150); 
imtool(fthresh);
imwrite(fthresh,'output_images/lake_fthresh.png');

%%%%%%%%%%% Part (b) of 1 - connected-component labeling %%%%%%%%%%%%%%%%%%

% Label and display colored connected-components in binary image "fthresh"
%      1.  Use provided bwlabel() and label2rgb functions

[flabel, num] = bwlabel(fthresh, 8);
fRGB = label2rgb(flabel);
imshow(fRGB);

fprintf('Number of connected-components: %d\n', num);
imwrite(fRGB, 'output_images/lake_bright_components_colored_low_threshold.png');

%%%%%%%%%%% Part (c) of 1 - deleting all but two components %%%%%%%%%%%%%%%
top_2_regions = top2(flabel, num);
imwrite(top_2_regions, 'output_images/top2.png');


%%%%%%%%%%% Part 2 - logical operators %%%%%%%%%%%%%%%#####################
%  Read in image "match1.gif" into array "fa"
fa = imread('match1.gif');

%  Read in image "match2.gif" into array "fb"
fb = imread('match2.gif');

% Read in mandrill and cameraman images;
f_mandril = imread('mandril_gray.tif');
f_camera = imread('cameraman.tif');

fa = fa(:,:,1); 
fb = fb(:,:,1);
f_mandril = f_mandril(:, :, 1);
f_camera = f_camera(:, :, 1);

%%%%%%%%%%%%%%%%%%%% function of binary image %%%%%%%%%%%%%%%%%%%%%%%%%
% since both the images we used are already binary images,
% so we don't have to use this function.
%fa = binaryimage(fa,128);
%fb = binaryimage(fb,128);
%%%%%%%%%%%%%%%%%%%% END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%% function of operators %%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_and = operator_and(fa,fb);
f_or = operator_or(fa,fb);
f_xor = operator_xor(fa,fb);
f_not = operator_not(fa);
f_min = operator_min(f_mandril, f_camera);
%%%%%%%%%%%%%%%%%%%% END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% show new output images.
imshow([f_and,f_or,f_xor,f_not]);
% write output images to files
imwrite(f_and, 'output_images/f_and.png');
imwrite(f_or, 'output_images/f_or.png');
imwrite(f_xor, 'output_images/f_xor.png');
imwrite(f_not, 'output_images/f_not.png');
imwrite(f_min, 'output_images/f_min.png');

%%%%%%%%%%%%% End of the main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%