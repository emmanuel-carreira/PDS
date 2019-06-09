% Projeto PDS - Quest�o 4.2
% Aluno: Emmanuel Carreira Alves
% Objetivo: Tentar extrair ru�do de um sinal sonoro

%Limpar vari�veis de ambiente e janela de comando
clear;
clc;

%Ler o arquivo de entrada
[x,Fs] = audioread('teste_de_som.wav');

%Exibir a taxa de amostragem
disp(Fs);

%Criar sinal ruidoso
noise_frequency = 466.16;
w = 2*pi*noise_frequency;
x_noise = 30*x + sin(w);

%Exibir sinal original
figure('Name', 'Compara��o');
subplot(1,2,1);
t = linspace(0, length(x)/Fs, length(x));
plot(t, x);
title('Sinal original');

%Exibir sinal ruidoso
subplot(1,2,2);
t = linspace(0, length(x_noise)/Fs, length(x_noise));
plot(t, x_noise);
title('Sinal ruidoso');

