% Function to do rescaling
function rescaled_blocks = rescale_blocks(scaleFactor, DCTQ, quantized_blocks)
% Define quantization matrix
T = scaleFactor.*DCTQ;

% Calculate number of blocks
numBlocks = size(quantized_blocks, 3);

% Initialize rescaled_blocks variable
rescaled_blocks = zeros(size(quantized_blocks));

% Loop through blocks
for i = 1:numBlocks
    % Dequantize quantized DCT coefficients
    rescaled_blocks(:,:,i) = quantized_blocks(:,:,i).*T;
end
end