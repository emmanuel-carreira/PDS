function Hd = fir_lowpass
%FIR_LOWPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.6 and Signal Processing Toolbox 8.2.
% Generated on: 09-Jun-2019 16:19:54

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 8000;  % Sampling Frequency

Fpass = 2500;   % Passband Frequency
Fstop = 3000;   % Stopband Frequency
Dpass = 0.1;    % Passband Ripple
Dstop = 0.001;  % Stopband Attenuation
dens  = 20;     % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]