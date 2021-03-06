% Script created for the ML-2015 project
% Created by Omer Ishaq. Copy right @ omer.ishaq@gmail.com
% Input: a csv file from the Thunderstorm project
%
% Output: An image showing the sorted blobs
%
% Action:
% Sort the blobs according to chi-2 error.

csv_File_Name = 'image1.csv';
png_File_Name = 'image1.png';

% read csv file
csv_Data = csvread(csv_File_Name,1,0);
png_Data = imread(png_File_Name);

% get the x, y, chi and sigma
x_Data = csv_Data(:,1);
y_Data = csv_Data(:,2);
uncertainty_Data = csv_Data(:,4);

% calculate area by chi and sigma
% area_Data = (sigma_Data*3).^2 * pi;

% calculate the normalized chi square
%intensity_Data = sigma_Data;

% concatenate the normalized chi square | x | y
concatenated_Data = [uncertainty_Data x_Data y_Data];

% sort data
sorted_Data = sortrows(concatenated_Data, 1);
% sorted_Data = flipud(sorted_Data);

% generate results file
[ img_Output ] = create_grid_image_one_type(png_Data, sorted_Data);
img_Output = uint16(img_Output);

imwrite(img_Output, 'intensity.png')

clear all
close all
