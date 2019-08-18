clear; close all; warning('off', 'all'); clc;

image = rgb2gray(imread('image2.png'));
template = rgb2gray(imread('templates/waldo.png'));

fft_image = fft2(image);
S = fftshift(log(1+abs(fft_image)));
fft_template = fft2(template, size(image, 1), size(image,2));
T = fftshift(log(1+abs(fft_template)));

figure, surf(S), shading flat
figure, surf(T), shading flat