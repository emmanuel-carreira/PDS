% Projeto PDS - Questão 2.2
% Aluno: Emmanuel Carreira Alves
% Objetivo: Contar automaticamente as regiões de diferentes texturas

%Limpar variáveis de ambiente e janela de comando
clear;
clc;

%Importar imagem
[img, map] = imread('alumgrns.bmp');

%Suavizar a imagem, convolvendo-a com um filtro de blur
img_double = im2double(img);
kernel = [0 1/8 0; 1/8 1/2 1/8; 0 1/8 0];
img_blur = conv2(img_double,kernel);

%Utilizar o método de canny com threshold 0.15 para segmentar a imagem
img_edges = edge(img_blur, 'canny', 0.15);

%Determinar as componentes conexas da imagem segmentada
cc = bwconncomp(img_edges, 8);

%Determinar a quantidade de texturas (nº de componentes conexas)
textures = cc.NumObjects;

%Exibir imagens original, suavizada e segmentada
figure(1);
subplot(1,3,1);
imshow(img);
title('Original');
subplot(1,3,2);
imshow(img_blur);
title('Suavizada');
subplot(1,3,3);
imshow(img_edges);
title('Somente bordas');