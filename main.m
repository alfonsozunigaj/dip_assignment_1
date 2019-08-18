clear; close all; warning('off', 'all'); clc;

templates = containers.Map;

templates('waldo') = {rgb2gray(imread('templates/waldo.png')), 'r'};
templates('wenda') = {rgb2gray(imread('templates/wenda.png')), 'b'};
templates('wizard') = {rgb2gray(imread('templates/wizard.png')), 'g'};
templates('odlaw') = {rgb2gray(imread('templates/odlaw.png')), 'y'};

image = rgb2gray(imread('image2.png'));

% figure, surf(c), shading flat
% max_corr = max(c(:));

figure
imshow(image);
hold on;
for character = keys(templates)
    template = templates(character{1});
    c = normxcorr2(template{1},image);
    [ypeak, xpeak] = find(c>=0.999);
    for i = drange(1:size(ypeak, 1))
        yoffSet = ypeak(i) - size(template{1}, 1);
        xoffSet = xpeak(i) - size(template{1}, 2);
        rectangle('Position', [xoffSet+1, yoffSet+1, size(template{1}, 2), size(template{1}, 1)], 'EdgeColor', template{2}, 'LineWidth', 2);
    end
end