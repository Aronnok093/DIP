% Read a sample image (you can replace 'sample_image.jpg' with your image)
originalImage = imread('input.jpg');

% Convert the image to grayscale if it's an RGB image
if size(originalImage, 3) == 3
    originalImage = rgb2gray(originalImage);
end

% Convert the image to double
originalImage = double(originalImage);

% Prompt the user for the sigma value
sigma = input('Enter the sigma value: ');

% Design a 5x5 Gaussian kernel
sizeKernel = 5;
kernel = zeros(sizeKernel);

% Create the Gaussian kernel
for i = 1:sizeKernel
    for j = 1:sizeKernel
        % Gaussian function
        kernel(i, j) = exp(-((i - 3)^2 + (j - 3)^2) / (2 * sigma^2)) / (2 * pi * sigma^2);
    end
end

% Normalize the kernel
kernel = kernel / sum(kernel(:));

% Apply convolution without using built-in functions
filteredImage = convolution(originalImage, kernel);

% Display both images in the same subplot
figure;
subplot(1, 2, 1);
imshow(uint8(originalImage));
title('Original Image');

subplot(1, 2, 2);
imshow(uint8(filteredImage));
title('Filtered Image');

function outputImage = convolution(inputImage, kernel)
    [rows, cols] = size(inputImage);
    [kernelRows, kernelCols] = size(kernel);
    
    % Calculate padding
    padRows = floor(kernelRows / 2);
    padCols = floor(kernelCols / 2);
    
    % Pad the input image
    paddedImage = padarray(inputImage, [padRows, padCols], 0, 'both');
    
    % Initialize the output image
    outputImage = zeros(rows, cols);
    
    % Perform convolution
    for i = 1:rows
        for j = 1:cols
            region = paddedImage(i:i+kernelRows-1, j:j+kernelCols-1);
            outputImage(i, j) = sum(region(:) .* kernel(:));
        end
    end
end
