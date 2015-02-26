% Script created for the ML-2015 project
% Created by Omer Ishaq. Copy right @ omer.ishaq@gmail.com
% Input:
%
% Output:
%
% Action: Script for correlation with different gaussians
%
%

% Specify the sizes of the standard deviation
size_X = [0.5:0.1:3];
size_Y = [0.5:0.1:3];

for i = 1:length(size_X)
    for j = 1:length(size_Y)
   
        kernel_size_X = ceil(size_X(i) * 6);
        kernel_size_Y = ceil(size_Y(j) * 6);
        
        if mod(kernel_size_X, 2) == 0;  kernel_size_X = kernel_size_X + 1;  end;
        if mod(kernel_size_Y, 2) == 0;  kernel_size_Y = kernel_size_Y + 1;  end;
        
        h = fspecial( 'gaussian', [1 kernel_size_X], size_X(i) );
        v = fspecial( 'gaussian', [kernel_size_Y 1], size_Y(j) );
        f = v * h;
        
        k = 1;
        for a = 0:10:170
            
            rotated_kernel = imrotate(f, a, 'bicubic', 'loose');
            kernels_Array(i,j,k).kernel = rotated_kernel;
            k = k + 1; 
            
            % imagesc(rotated_kernel);
            % axis image;
            
        end
        
        
    end
end

disp('Kernels generated');

