% a. Take an RGB input image and convert it into a grayscale image.
rgbImage = imread('Cameraman.jpg');  % Replace with your actual RGB image filename

% b. Extract the dimension of the grayscale image (say R).
[m, n] = size(grayImage);

% c. For every column of bit depth of R, starting from the LSB, take the column number of the bit positions (say k) of R.
bitDepth = 8;  % Assuming an 8-bit image
for k = bitDepth:-1:1
    % d. For every k, calculate X, where X is 2 to the power of that column number.
    X = 2^(bitDepth - k);

    % e. Calculate the bitwise AND operation for every pixel of the image using the bitand function.
    S = bitand(grayImage, X);

    % f. Show the output images (S) for every bit position.
    subplot(2,5,k);
    imshow(S, []);
    title(['Bit Position: ' num2str(k)]);
end
