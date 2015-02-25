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
chi2_Data = csv_Data(:,6);
sigma_Data = csv_Data(:,3);

% Additional data being loaded for the extra visualization
intensity_Data = csv_Data(:,4);
bkgstd_Data = csv_Data(:,5);
uncertainty_Data = csv_Data(:,7);

% calculate area by chi and sigma
% area_Data = (sigma_Data*3).^2 * pi;

% calculate the normalized chi square
chi2_Normalized_Data = chi2_Data;

% concatenate the normalized chi square | x | y
concatenated_Data = [chi2_Normalized_Data x_Data y_Data sigma_Data intensity_Data uncertainty_Data];

% sort data
sorted_Data = sortrows(concatenated_Data, 1);

% remove the sorted information for extra visualization
viz_data = sorted_Data(:, 4:6);
viz_strings = {'std','n','u'};
[figure_handle] = create_features_grid(viz_data, viz_strings);

% generate results file
[ img_Output ] = create_grid_image_one_type(png_Data, sorted_Data);
img_Output = uint16(img_Output);

imwrite(img_Output, 'chi_square.png')

clear all
close all
