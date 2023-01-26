
C8=C(8);
C8T=transpose(C8);

% Prompt user to select image file
[file, path] = uigetfile('*');
fname = fullfile(path, file); % Combine path and file name

% Read image and convert to grayscale
X = imread(fname);
X1 = rgb2gray(X);
X=double(X1);

% Split image into blocks
blocks = split_into_blocks(X);

% Get scaling factor from user
scaleFactor = input('Enter scaling factor r: ');

% Define quantization matrix
DCTQ = [16 11 10 16 24 40 51 61;
        12 12 14 19 26 58 60 55;
        14 13 16 24 40 57 69 56;
        14 17 22 29 51 87 80 62;
        18 22 37 56 68 109 103 77;
        24 35 55 64 81 194 113 92;
        49 64 78 87 103 121 120 101;
        72 92 95 98 121 100 103 99];

% Calculate DCT of blocks
DCT_blocks = zeros(size(blocks));
for i = 1:size(blocks, 3)
DCT_blocks(:,:,i) = C8*double(blocks(:,:,i)-128)*C8T;
end
figure(1)
imshow(recombine_blocks(DCT_blocks,X)),title('image after DCT')

% Quantize blocks
quantized_blocks = quantize_blocks(scaleFactor, DCTQ, DCT_blocks);
figure(2)
imshow(recombine_blocks(quantized_blocks,X)),title('quantized image')

% Do rescaling
rescaled_blocks = rescale_blocks(scaleFactor, DCTQ, quantized_blocks);

% Calculate DCT of blocks
IDCT_blocks = zeros(size(blocks));
for i = 1:size(blocks, 3)
    IDCT_blocks(:,:,i) = (C8T*double(rescaled_blocks(:,:,i))*C8)+128;
end

% Recombine blocks
reconstructed = recombine_blocks(IDCT_blocks,X);

% Display original and reconstructed images
figure(3)
subplot(1,2,1)
imshow(X1)
title('Original image')
subplot(1,2,2)
imshow(reconstructed)
title('Reconstructed image')