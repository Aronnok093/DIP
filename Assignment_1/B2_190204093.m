
originalImage = imread('input.jpg'); 


figure;
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');


[m, n, ~] = size(originalImage);
mirrorImage = zeros(m, n, 3, 'uint8');

for i = 1:m
    for j = 1:n
        mirrorImage(i, j, 1) = originalImage(i, n - j + 1, 1);
        mirrorImage(i, j, 2) = originalImage(i, n - j + 1, 2);
        mirrorImage(i, j, 3) = originalImage(i, n - j + 1, 3);
    end
end


subplot(1, 2, 2);
imshow(mirrorImage);
title('Mirror Image');


mergedImage = uint8(zeros(m, 2 * n, 3));


mergedImage(:, 1:n, :) = originalImage;


mergedImage(:, n+1:end, :) = mirrorImage;


figure;
imshow(mergedImage);
title('Merged Image');
