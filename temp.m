clear; close all; warning('off', 'all'); clc;

onion = rgb2gray(imread('onion.png'));
peppers = rgb2gray(imread('peppers.png'));

c = xcorr2(peppers, onion);
figure, surf(c), shading flat

n_c = normxcorr2(peppers, onion);
figure, surf(n_c), shading flat