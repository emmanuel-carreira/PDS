% Projeto PDS - Questão 1.1
% Aluno: Emmanuel Carreira Alves
% Objetivo: Criar filtro FIR passa alta utilizando janela de kaiser

%Limpar variáveis de ambiente e janela de comando
clear;
clc; 

%Parâmetros dados do filtro
ws = 0.6*pi;
wp = 0.75*pi;
As = 50;

%Calcular parâmetros da janela de kaiser
deltaw = wp-ws;
M = (As-8)/(2.285*deltaw);
n = [0:M-1];
beta = 0.5842*(As-21)^(0.4) + 0.07886*(As-21);

%Criar janela de kaiser
w_kai = (kaiser(M, beta))';

%Determinar frequências de corte
wc1 = pi;
wc2 = (ws+wp)/2;

%Encontrar resposta ao impulso
hd = ideal_lp(wc1,M) - ideal_lp(wc2,M);
h = hd.*w_kai;

%Obter resposta em frequência do filtro
[db, mag, pha, w] = freqz_m(h, [1]);

figure('Name', 'Filtro por janela de kaiser');
subplot(2,2,1);
plot(mag);
title('Magnitude em dB');
