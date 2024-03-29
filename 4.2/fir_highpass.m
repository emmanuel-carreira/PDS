function Hd = fir_highpass
%FIR_HIGHPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.6 and Signal Processing Toolbox 8.2.
% Generated on: 09-Jun-2019 18:26:35

% Equiripple Highpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 8000;  % Sampling Frequency

Fstop = 3000;            % Stopband Frequency
Fpass = 3020;            % Passband Frequency
Dstop = 0.0001;          % Stopband Attenuation
Dpass = 0.057501127785;  % Passband Ripple
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop, Fpass]/(Fs/2), [0 1], [Dstop, Dpass]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
