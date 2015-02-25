% Script created for the ML-2015 project
% Created by Omer Ishaq. Copy right @ omer.ishaq@gmail.com
% Input:
%
% Output:
%
% Action: Load an image, creates a Gaussian and does cross-correlation.
%
%

png_File_Name = 'image1.png';
png_Data = imread(png_File_Name);

filter = fspecial('gaussian', [7 7], 1);
c = normxcorr2(filter,png_Data);