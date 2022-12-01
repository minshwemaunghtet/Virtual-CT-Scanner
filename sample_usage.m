clear all
clc

img = zeros(256);
img(100:156, 100:156) = 255;
RGB = imread("rectanglePhantom_iterativeprojection.png");
ig = rgb2gray(RGB);
tiledlayout(1, 4)
nexttile
title('Original image')

nexttile
title('Converted to radon space')

nexttile
title('Filtered backprojection')

nexttile
ig = imresize(ig,[256, 256]);
imshow(ig)
improfile
title('Rectangle Phantom Iterative Projection Signal Intensity')