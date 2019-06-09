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



% Reverberador com "a" negativo

%Criar filtro reverberador
b = 1;
a = zeros(1,delay);
a(1) = 1;

%Filtar com a = -0.25
a(delay) = -0.25;
x_025 = filter(b, a, x_echo);

%Filtar com a = -0.5
a(delay) = -0.5;
x_05 = filter(b, a, x_echo);

%Filtar com a = -0.9
a(delay) = -0.9;
x_09 = filter(b, a, x_echo);

%Exibir waveform do sinal original
figure('Name', 'Comparação com reverberadores com a negativo');
subplot(2,3,1);
t = linspace(0, length(x)/Fs, length(x));
plot(t, x);
title('Sinal original');

%Exibir waveform do sinal com eco
subplot(2,3,2);
t = linspace(0, length(x_echo)/Fs, length(x_echo));
plot(t, x_echo);
title('Sinal com eco');

%Exibir waveform do sinal filtrado pelo reverberador a = -0.25
subplot(2,3,3);
t = linspace(0, length(x_025)/Fs, length(x_025));
plot(t, x_025);
title('Reverberador -0.25');

%Exibir waveform do sinal filtrado pelo reverberador a = -0.5
subplot(2,3,4);
t = linspace(0, length(x_05)/Fs, length(x_05));
plot(t, x_05);
title('Reverberador -0.5');

%Exibir waveform do sinal filtrado pelo reverberador a = -0.9
subplot(2,3,5);
t = linspace(0, length(x_09)/Fs, length(x_09));
plot(t, x_09);
title('Reverberador -0.9');



% Reverberador com "a" positivo

%Filtar com a = 0.25
a(delay) = 0.25;
x_025 = filter(b, a, x_echo);

%Filtar com a = 0.5
a(delay) = 0.5;
x_05 = filter(b, a, x_echo);

%Filtar com a = 0.9
a(delay) = 0.9;
x_09 = filter(b, a, x_echo);

%Exibir waveform do sinal original
figure('Name', 'Comparação com reverberadores com a positivo');
subplot(2,3,1);
t = linspace(0, length(x)/Fs, length(x));
plot(t, x);
title('Sinal original');

%Exibir waveform do sinal com eco
subplot(2,3,2);
t = linspace(0, length(x_echo)/Fs, length(x_echo));
plot(t, x_echo);
title('Sinal com eco');

%Exibir waveform do sinal filtrado pelo reverberador a = 0.25
subplot(2,3,3);
t = linspace(0, length(x_025)/Fs, length(x_025));
plot(t, x_025);
title('Reverberador 0.25');

%Exibir waveform do sinal filtrado pelo reverberador a = 0.5
subplot(2,3,4);
t = linspace(0, length(x_05)/Fs, length(x_05));
plot(t, x_05);
title('Reverberador 0.5');

%Exibir waveform do sinal filtrado pelo reverberador a = 0.9
subplot(2,3,5);
t = linspace(0, length(x_09)/Fs, length(x_09));
plot(t, x_09);
title('Reverberador 0.9');