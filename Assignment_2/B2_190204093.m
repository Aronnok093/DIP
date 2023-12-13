% a. Read the image 'cameraman.png'
originalImage = imread('Cameraman.jpg');

% b. Compute the number of pixels for each gray level intensity
[rows, cols] = size(originalImage);
histogram = zeros(256, 1);

for i = 1:rows
    for j = 1:cols
        intensity = originalImage(i, j)+1;  % Adjust for 1-based indexing
        histogram(intensity) = histogram(intensity)+1;
    end
end

% c. Compute Probability Distribution Function (PDF)
totalPixels = rows * cols;
pdf = histogram / totalPixels;

% d. Compute Cumulative Distribution Function (CDF)
cdf = zeros(256, 1);
cumulativeSum = 0;

for i = 1:256
    cumulativeSum = cumulativeSum + pdf(i);
    cdf(i) = cumulativeSum;
end

% e. Multiply each CDF by L-1
L = 256; % Number of intensity levels
cdfEqualized = round(cdf * (L - 1));

% f. Round the value obtained in step e
equalizedImage = zeros(rows, cols);

for i = 1:rows
    for j = 1:cols
        intensity = originalImage(i, j) + 1;  % Adjust for 1-based indexing
        equalizedImage(i, j) = round(cdfEqualized(intensity));
    end
end

% g. Display original image and equalized image using subplot
figure;
subplot(2, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(2, 2, 2);
imshow(equalizedImage, []);
title('Equalized Image');

% h. Display original histogram and equalized histogram using subplot
subplot(2, 2, 3);
bar(histogram);
title('Original Histogram');

equalizedHistogram = hist(equalizedImage(:), 0:L-1);
subplot(2, 2, 4);
bar(equalizedHistogram);
title('Equalized Histogram');
