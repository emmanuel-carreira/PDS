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

