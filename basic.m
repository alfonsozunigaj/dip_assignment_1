template = rgb2gray(imread('templates/waldo.png'));
image = rgb2gray(imread('image2.png'));

template_height = size(template, 1);
template_width = size(template, 2);

c = normxcorr2(template, image);
[ypeak, xpeak] = find(c>=0.999);
figure, surf(c), shading flat, hold on, 
for j = drange(1:size(ypeak, 1))
    scatter3(xpeak(j),ypeak(j),c(ypeak(j),xpeak(j)), 30, 'r', 'filled')
end
figure
imshow(image);
hold on;
for i = drange(1:size(ypeak, 1))
    yoffSet = ypeak(i) - template_height;
    xoffSet = xpeak(i) - template_width;
    rectangle('Position', [xoffSet+1, yoffSet+1, template_width, template_height], 'EdgeColor', 'r', 'LineWidth', 2);
end