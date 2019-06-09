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

%Criar sinal ruidoso
noise_frequency = 466.16;
w = 2*pi*noise_frequency;
x_noise = 30*x + sin(w);

%Exibir sinal original
figure('Name', 'Comparação sinais');
subplot(1,2,1);
t = linspace(0, length(x)/Fs, length(x));
plot(t, x);
title('Sinal original');

%Exibir sinal ruidoso
subplot(1,2,2);
t = linspace(0, length(x_noise)/Fs, length(x_noise));
plot(t, x_noise);
title('Sinal ruidoso');

%Filtrar com FIR passa-baixa

fir_lowpass = fir_lowpass();
x_fir_lowpass = filter(fir_lowpass.numerator, 1, x_noise);

%Filtrar com FIR passa-alta

fir_highpass = fir_highpass();
x_fir_highpass = filter(fir_highpass.numerator, 1, x_noise);

%Filtrar com IIR passa-baixa

iir_lowpass = iir_lowpass();
x_iir_lowpass = filter(iir_lowpass, x_noise);

%Filtrar com IIR passa-alta

iir_highpass = iir_highpass();
x_iir_highpass = filter(iir_highpass, x_noise);

%Exibir sinal filtrado pelo FIR passa-baixa
figure('Name', 'Comparação filtros');
subplot(2,2,1);
t = linspace(0, length(x_fir_lowpass)/Fs, length(x_fir_lowpass));
plot(t, x_fir_lowpass);
title('FIR passa-baixa');

%Exibir sinal filtrado pelo FIR passa-alta
subplot(2,2,2);
t = linspace(0, length(x_fir_highpass)/Fs, length(x_fir_highpass));
plot(t, x_fir_highpass);
title('FIR passa-alta');

%Exibir sinal filtrado pelo IIR passa-baixa
subplot(2,2,3);
t = linspace(0, length(x_iir_lowpass)/Fs, length(x_iir_lowpass));
plot(t, x_iir_lowpass);
title('IIR passa-baixa');

%Exibir sinal filtrado pelo IIR passa-alta
subplot(2,2,4);
t = linspace(0, length(x_iir_highpass)/Fs, length(x_iir_highpass));
plot(t, x_iir_highpass);
title('IIR passa-alta');