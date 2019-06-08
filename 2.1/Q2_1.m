% Projeto PDS - Questão 2.1
% Aluno: Emmanuel Carreira Alves
% Objetivo: Remover/diminuir efeito de ringings da imagem lena_rings.bmp

%Limpar variáveis de ambiente e janela de comando
clear;
clc; 

%Importar imagens original e com ringing
[img_rings, map] = imread('lena_rings.bmp');
[img_original, map2] = imread('lena.bmp');

%Passar filtro gaussiano na imagem com ringing
img_gauss = imgaussfilt(img_rings);

%Converter matriz uint8 pra double
img_double = im2double(img_rings);

%Kernel do filtro passa baixa 1/9
conv_kernel = (1/9)*ones(3,3);

%Kenel do filtro passa baixa com foco no pixel do meio
lowpass_filter = [0 1/8 0; 1/8 1/2 1/8; 0 1/8 0];

%Passar filtro passa baixa 1/9 na imagem com ringing
img_conv_kernel = conv2(img_double, conv_kernel);

%Passar filtro passa baixa do pixel do meio na imagem com ringing
img_lowpass = conv2(img_double, lowpass_filter);

%Exibir imagens original, com ringing e as com filtro

figure('Name', 'Comparação');
subplot(2,3,1);
imshow(img_original);
title('Imagem original');

subplot(2,3,2);
imshow(img_rings);
title('Com ringing');

subplot(2,3,3);
imshow(img_gauss);
title('Filtro Gaussiano');

subplot(2,3,4);
imshow(img_conv_kernel);
title('Passa baixa uniforme 1/9');

subplot(2,3,5);
imshow(img_lowpass);
title('Passa baixa pixel do meio');