% Function to split an image matrix into 8x8 blocks
function blocks = split_into_blocks(image)
% Get image dimensions
[rows, columns] = size(image);

% Check if image dimensions are divisible by 8
if rem(rows, 8) ~= 0 || rem(columns, 8) ~= 0
    % If not, pad image with zeros
    if rem(rows, 8) ~= 0
        rowZeros = 8 - rem(rows, 8);
        image(rows + rowZeros, columns) = 0;
    end
    if rem(columns, 8) ~= 0
        colZeros = 8 - rem(columns, 8);
        image(rows, columns + colZeros) = 0;
    end
end

% Calculate number of blocks
numBlocks = ceil((rows*columns)/64);

% Initialize blocks variable
blocks = zeros(8,8,numBlocks);

% Initialize block index
blockIdx = 1;

% Loop through rows
for i = 1:8:rows
    % Loop through columns
    for j = 1:8:columns
        % Get current block
        block = image(i:i+7, j:j+7);

        % Store block in blocks variable
        blocks(:,:,blockIdx) = block;

        % Increment block index
        blockIdx = blockIdx + 1;
    end
end
end