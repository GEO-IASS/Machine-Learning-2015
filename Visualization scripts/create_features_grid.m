% Script created for the ML-2015 project
% Created by Omer Ishaq. Copy right @ omer.ishaq@gmail.com
% Input:
%
% Output:
%
% Action:
%
%

function [ figure_handle ] = create_features_grid( data_Matrix, data_Labels )

    grid_cols = 8;
    grid_spacing = 3;

    csv_data_peak = data_Matrix; 
    num_peaks = length(data_Matrix);

    % plot the spots
    num_rows = ceil(num_peaks/grid_cols);
    counter = 1;
    
    %
    % Generate figure for sigma
    %
    
    figure_handle = figure('Name','Standard Deviation');
    hold on
    
    for i = 1:num_rows;
        for j = 1:grid_cols

            h(counter) = subplot(num_rows, grid_cols, counter);
            bar(1, (data_Matrix(counter,1)));
            counter = counter + 1;
            
            if counter >= num_peaks; break; end;
            
        end
    end
    linkaxes(h,'y')
    ylim(h(1),[0 max(data_Matrix(:,1))])
    
    [m] = arrayfun(@(x) set(x, 'XTickLabel',''), h, 'uniformoutput',false);
    [m] = arrayfun(@(x) set(x, 'YTickLabel',''), h, 'uniformoutput',false);
    
    hold off
    
    %
    % Generate figure for intensity
    %
    
    figure_handle = figure('Name','Photons');
    hold on
    
    for i = 1:num_rows;
        for j = 1:grid_cols

            h(counter) = subplot(num_rows, grid_cols, counter);
            bar(1, (data_Matrix(counter,2)));
            counter = counter + 1;
            
            if counter >= num_peaks; break; end;
            
        end
    end
    linkaxes(h,'y')
    ylim(h(1),[0 max(data_Matrix(:,2))])
    
    [m] = arrayfun(@(x) set(x, 'XTickLabel',''), h, 'uniformoutput',false);
    [m] = arrayfun(@(x) set(x, 'YTickLabel',''), h, 'uniformoutput',false);
    
    hold off
    
    %
    % Generate figure for uncertainty
    %
    
    figure_handle = figure('Name','Uncertainty');
    hold on
    
    for i = 1:num_rows;
        for j = 1:grid_cols

            h(counter) = subplot(num_rows, grid_cols, counter);
            bar(1, (data_Matrix(counter,3)));
            counter = counter + 1;
            
            if counter >= num_peaks; break; end;
            
        end
    end
    linkaxes(h,'y')
    ylim(h(1),[0 max(data_Matrix(:,3))])
    
    [m] = arrayfun(@(x) set(x, 'XTickLabel',''), h, 'uniformoutput',false);
    [m] = arrayfun(@(x) set(x, 'YTickLabel',''), h, 'uniformoutput',false);
    
    hold off
    



end

