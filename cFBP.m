function bp = cFBP(sg, theta)

step = 1;

angles = 1:step:theta;
bp = zeros(length(sg));

ramlak = abs(linspace(-1, 1, length(sg))');

fft_R = fftshift(fft(sg, [], 1), 1);
filtproj = ifftshift(fft_R .* ramlak, 1);
sg = real(ifft(filtproj, [], 1));

for i = 1:length(angles)
    % % Approach 1. using forcycle
    %     for j = 1:length(sg)
    %         tmp(:, j) = sg(:, i);
    %     end
    %     tmp = imrotate(tmp, angles(i), 'bilinear', 'crop');
    %     bp = bp + tmp;
    % % Approach 2. using repmat() or repelem()
    % tmp = repmat(sg(:, i), 1, length(sg));
    tmp = repelem(sg(:, i), 1, length(sg));
    tmp = imrotate(tmp, angles(i), 'bilinear', 'crop');
    bp = bp + tmp;
end

end
