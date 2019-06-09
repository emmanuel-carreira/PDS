% Projeto PDS - Questão 4.2
% Aluno: Emmanuel Carreira Alves
% Objetivo: Tentar extrair ruído de um sinal sonoro

%Limpar variáveis de ambiente e janela de comando
clear;
clc;

%Ler o arquivo de entrada
[x,Fs] = audioread('teste_de_som.wav');

%Exibir a taxa de amostragem
disp(Fs);

