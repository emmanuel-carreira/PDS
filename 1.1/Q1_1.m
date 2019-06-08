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
n = (0:M-1);
beta = 0.5842*(As-21)^(0.4) + 0.07886*(As-21);

%Criar janela de kaiser
w_kaiser = (kaiser(M, beta))';

%Determinar frequências de corte
wc1 = pi;
wc2 = (ws+wp)/2;

%Encontrar resposta ao impulso
hd = ideal_lp(wc1,M) - ideal_lp(wc2,M);
h = hd.*w_kaiser;

%Obter resposta em frequência do filtro
[db, mag, pha, w] = freqz_m(h, [1]);

%Exibir magnitude do filtro
figure('Name', 'Filtro por janela de kaiser');
subplot(2,2,1);
stem(hd);
ylabel('hd[n]');
xlabel('n');
title('Resposta ideal ao impulso');

subplot(2,2,2);
stem(w_kaiser);
ylabel('w[n]');
xlabel('n');
title('Janela de Kaiser');

subplot(2,2,3);
stem(h);
ylabel('h[n]');
xlabel('n');
title('Resposta ao impulso atual');

subplot(2,2,4);
plot(db);
ylabel('dB');
%xlabel('');
%set(gca,'XTick',0:200:600)
%set(gca,'XTickLabel',0:2:6)
title('Magnitude em dB');