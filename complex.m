templates = containers.Map;

templates('waldo') = {rgb2gray(imread('templates/waldo.png')), 'r'};
templates('wenda') = {rgb2gray(imread('templates/wenda.png')), 'b'};
templates('wizard') = {rgb2gray(imread('templates/wizard.png')), 'g'};
templates('odlaw') = {rgb2gray(imread('templates/odlaw.png')), 'y'};

image = rgb2gray(imread('image2.png'));

for character = keys(templates)
    template = templates(character{1});
    template_height = size(template{1}, 1);
    template_width = size(template{1}, 2);
    c = normxcorr2(template{1},image);
    [ypeak, xpeak] = find(c>=0.999);
    figure, surf(c), shading flat, hold on, 
    for j = drange(1:size(ypeak, 1))
        scatter3(xpeak(j),ypeak(j),c(ypeak(j),xpeak(j)), 30, template{2}, 'filled')
    end
end