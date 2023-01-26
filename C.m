function Cn = C(n)
    % Initialize 8x8 DCT matrix
    Cn = zeros(n,n);
    for k = 1:n
        for r = 1:n
            if k == 1
                Cn(k,r) = sqrt(1/n)*cos((pi/n)*(k-1)*((r-1)+0.5));
            else
                Cn(k,r) = sqrt(2/n)*cos((pi/n)*(k-1)*((r-1)+0.5));
            end
        end
    end
end

