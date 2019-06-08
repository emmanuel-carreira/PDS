%OBS: função ideal_lp copiada porque não a possuo no trial do Matlab

function [hd]=ideal_lp(wc,M) 
%Ideal Lowpass  filter  computation 
%------------------------------------------ 
%[hd]=ideal_lp(wc,M) 
%hd=ideal impulse response between 0 and M-1  
%wc=cutoff frequency in radians 
%M=length of tne ideal filter 
% 
% 
alpha=(M-1)/2; 
n=[0:(M-1)]; 
m=n-alpha+eps; 
hd=sin(wc*m)./(pi*m); 