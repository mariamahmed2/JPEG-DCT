% Function to recombine blocks
function image = recombine_blocks(blocks,X)

% Get size of blocks
blockSize = size(blocks, 1);
[rows, columns] = size(X);
% Initialize block index
blockIdx = 1;

% Loop through rows
    for i = 1:blockSize:rows
    % Loop through columns
        for j = 1:blockSize:columns
        % Get current block
        block = blocks(:,:,blockIdx);

        % Insert block into image
        image(i:i+blockSize-1, j:j+blockSize-1) = block;

        % Increment block index
        blockIdx = blockIdx + 1;
        end
    end
    image = uint8(image);
end