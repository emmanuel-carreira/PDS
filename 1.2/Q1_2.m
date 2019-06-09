% Projeto PDS - Questão 1.2
% Aluno: Emmanuel Carreira Alves
% Objetivo: Gerar um sinal com eco e filtrá-lo

%Limpar variáveis de ambiente e janela de comando
clear;
clc;

%Ler o arquivo de entrada
[x,Fs] = audioread('sp04.wav');

%Determinar o atraso
delay = 500;
echo_gain = 0.5;

%Criar sinal com eco
len = length(x)+delay;
x_echo = zeros(1,len)';

for i = 1:delay
    x_echo(i) = x(i);
end    

for i = delay+1:length(x)
   x_echo(i) = x(i) + echo_gain*x(i-delay); 
end    

for i = length(x)+1:length(x_echo)
   x_echo(i) = echo_gain*x(i-delay); 
end



% sound(x_echo,Fs);