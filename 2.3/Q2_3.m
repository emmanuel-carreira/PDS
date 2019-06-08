% Projeto PDS - Quest�o 2.3
% Aluno: Emmanuel Carreira Alves
% Objetivo: Aumetar o contraste entre cores verde e as restantes

%Limpar vari�veis de ambiente e janela de comando
clear;
clc;

%Importar imagem
[img, map] = imread('dalton.bmp');

%Determinar o maior valor de pixel verde
max_green = max(img,[],3); 

%Determinar quais pixels da imagem n�o possuem o valor m�ximo
filter = uint8( img(:,:,2) ~= max_green );

%Convoluir imagem com o filtro
filtered_img = img.*filter;

%Exibir imagem original e a imagem filtrada
figure('Name', 'Compara��o');
subplot(1,2,1);
imshow(img);
title('Original');
subplot(1,2,2);
imshow(filtered_img);
title('Imagem contrastada');