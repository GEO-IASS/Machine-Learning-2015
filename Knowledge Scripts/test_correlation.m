% Script created for the ML-2015 project
% Created by Omer Ishaq. Copy right @ omer.ishaq@gmail.com
% Input: Two signals.
%
% Output: Their Correlation.
%
% Action: The goal of the script was to test that under what kind of transformations does the correlation coefficient remain
% same.
%
%

X = [1 2 3 4 5 6 7 6 5 4 3 2 1];

Y = X*2; % To test if the template for a signal has different number of Photons as compared to the image.
[R] = corrcoef(X,Y);

Y = X + 10; % To test if a simple autofluorescene makes a difference.
[R] = corrcoef(X,Y);

Y = X*5 + 10; % More realitic with a more aplitude signal and autofluorescence as well.
[R] = corrcoef(X,Y);