% Projeto PDS - Questão 4.1
% Aluno: Emmanuel Carreira Alves
% Objetivo: Tentar retirar o som de fundo

%Limpar variáveis de ambiente e janela de comando
clear;
clc;

%Ler o arquivo de entrada
[x,Fs] = audioread('car1.wav');

%Determinar parâmetros do filtro
f_nyquist = Fs/2;            
pass_band = 1000/f_nyquist;  
stop_band = 1010/f_nyquist;  
passband_ripple =   1;       
stopband_ripple = 150;       

%Filtro de chebyshev tipo II

%Determinar ordem do filtro
[order,stop_band] = cheb2ord(pass_band,stop_band,passband_ripple,stopband_ripple); 

%Determinar design do filtro passa-baixa
[zeros,poles,gain] = cheby2(order,stopband_ripple,stop_band,'low');

%Converter parâmetros do filtro para matriz da forma de segunda ordem
[matrix,gain] = zp2sos(zeros,poles,gain); 

%Filtrar utilizando forma zero-fase 
x_filter = filtfilt(matrix, gain, x);

%Exibir waveform do audio original
figure('Name', 'Comparação');
subplot(1,2,1);
t = linspace(0, length(x)/Fs, length(x));
plot(t, x);
title('Sinal original');

%Exibir waveform do audio filtrado
subplot(1,2,2);
t = linspace(0, length(x_filter)/Fs, length(x_filter));
plot(t, x_filter);
title('Sinal filtrado');