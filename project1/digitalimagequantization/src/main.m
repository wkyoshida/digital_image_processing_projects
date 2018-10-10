%%%%%%%%%%%%% downsample.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      To downsample files to various spatial resolutions
%
% Processing Flow:
%      1.  Load and display input image
%      2.  Use repeated 2x2 averaging filters to downsample the image
%      3.  Upsample the image using nearest neighbor interpolation back to
%          original spatial resolution
%      4. Repeats above for the 3 different output resolutions
%          
%
%  Restrictions/Notes:
%      This function requires spatial dimensions of the image to be even.  
%
%  The following functions are called:
%      downsample2x.m           To downsample the image spatial resolution
%      nn_interpolation.m       To represent the downsampled image in 
%                               upscaled image
%      grayscale_downsample.m   To downsample the image grayscale levels
%
%  Author:      Group 5
%  Date:        09/03/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;  % Clear out all memory
f = imread('walkbridge.tif');
f = f(:,:,1);   % extract only the grayscale values from tiff

% Creating 256x256 downsample
scale = 2; % must be power of two
downsample_times = int32(log2(scale));
f_new = f;
for s = 1 : downsample_times
    f_new = downsample2x(f_new);
end
upscaled = nn_interpolation(f_new, downsample_times);
imwrite(upscaled, 'output_images/walkbridge_dsampled_2.png');

% Creating 128x128 downsample
scale = 4; % must be power of two
downsample_times = int32(log2(scale));
f_new = f;
for s = 1 : downsample_times
    f_new = downsample2x(f_new);
end
upscaled = nn_interpolation(f_new, downsample_times);
imwrite(upscaled, 'output_images/walkbridge_dsampled_4.png');

% Creating 32x32 downsample
scale = 16; % must be power of two
downsample_times = int32(log2(scale));
f_new = f;
for s = 1 : downsample_times
    f_new = downsample2x(f_new);
end
imwrite(f_new, 'output_images/walkbridge_dsampled_16_32x32.tif');
upscaled = nn_interpolation(f_new, downsample_times);
imwrite(upscaled, 'output_images/walkbridge_dsampled_16.png');

% Upscale 32x32 image to 512x512 image using inverse distance
% interpolation.
f_new = imread('output_images/walkbridge_dsampled_16_32x32.tif');
f_new = f_new(:,:,1);
f_new = inversedistance(f_new, 512, 512);
imwrite(f_new, 'output_images/walkbridge_upsampled_32x32to512x512.png')

% Creating 1 to 7 bit grayscale downscales
for b = 1 : 7
    f_new = f;
    f_new = grayscale_downsample(f_new, b);
    filename = strcat('output_images/walbridge_gsdsampled_', int2str(b), 'bits.png');
    imwrite(f_new, filename);
end

% Downscale to 256x256 spatial resolution and 6 bits of grayscale
% resolution
f_new = f;
f_new = downsample2x(f_new);
f_new = nn_interpolation(f_new, 1);
f_new = grayscale_downsample(f_new, 6);
imwrite(f_new, 'output_images/walbridge_dsampled_2_6bits.png');


