% Script created for the ML-2015 project
% Created by Omer Ishaq. Copy right @ omer.ishaq@gmail.com
% Input:    img_Data is the image file from which spots are extracted
%           position_Data is the file from which the positioning information is taken, the position is in x,y format at
%           locations 2,3 respectively in each row
% Output:   Grid generated data
%
% Action:
%
%
function [ img_Output ] = create_grid_image_one_type(img_data, position_Data)

    grid_cols = 8;
    grid_spacing = 3;
    spotsize = 9;

    csv_data_peak = position_Data; 
    num_peaks = length(position_Data);

    % plot the spots
    num_rows = ceil(num_peaks/grid_cols);
    Image = [];
    counter = 1;
    
    for i = 1:num_rows;

        Row = zeros(spotsize, spotsize*grid_cols + grid_spacing*(grid_cols-1));
        for j = 1:grid_cols

            patch = img_data(round(csv_data_peak(counter,3))-4:round(csv_data_peak(counter,3))+4, round(csv_data_peak(counter,2))-4:round(csv_data_peak(counter,2))+4);
            Row(:,((j-1)*spotsize)+((j-1)*grid_spacing)+1:  ((j-1)*spotsize)+((j-1)*grid_spacing)+spotsize) = patch;
            counter = counter + 1;

            if counter >= num_peaks; break; end;

        end
        Image = [Image; Row];
        Image = [Image; zeros(grid_spacing, spotsize*grid_cols + grid_spacing*(grid_cols-1))];

    end

    img_Output = Image;
end

