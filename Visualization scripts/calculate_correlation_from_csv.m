% Script created for the ML-2015 project
% Created by Omer Ishaq. Copy right @ omer.ishaq@gmail.com
% Input: The different features for an image from the Thunder_Storm
%
% Output: Correlation Coefficients
%
% Action: Measures the Correlation between the different values/features of the signals
%
%

csv_File_Name = 'image1.csv';
png_File_Name = 'image1.png';

% read csv file
csv_Data = csvread(csv_File_Name,1,0);

chi2_Data = csv_Data(:,6);
sigma_Data = csv_Data(:,3);
intensity_Data = csv_Data(:,4);
bkgstd_Data = csv_Data(:,5);
uncertainty_Data = csv_Data(:,7);

data = [sigma_Data intensity_Data bkgstd_Data chi2_Data uncertainty_Data];

[R,P,RLO,RUP] = corrcoef(data);

strings = {'Std', 'Photons', 'BG_Std', 'Chi2', 'Thomson U'};

figure;
hold on;
HeatMap(R, 'RowLabels', strings, 'ColumnLabels', strings);
axis equal;
hold off;