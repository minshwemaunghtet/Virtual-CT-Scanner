function sg = cRadon(img, theta)

step = 1;

angles = 1:step:theta;
sg = zeros(size(img, 1), length(theta));

for i = 1:length(angles)
    sg(:, i) = sum(imrotate(img, -angles(i), 'bilinear', 'crop'));
end

end

