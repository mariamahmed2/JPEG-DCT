% Function to quantize block split DCT image
function quantized_blocks = quantize_blocks(scaleFactor, DCTQ, DCT_blocks)
% Define quantization matrix
T = scaleFactor.*DCTQ;

% Calculate number of blocks
numBlocks = size(DCT_blocks, 3);

% Initialize quantized_blocks variable
quantized_blocks = zeros(size(DCT_blocks));

% Loop through blocks
for i = 1:numBlocks
    % Quantize DCT coefficients
    quantized_blocks(:,:,i) = round(DCT_blocks(:,:,i)./T);
end
end
