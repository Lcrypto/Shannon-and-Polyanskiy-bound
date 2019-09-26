% shannon.m
%author:Cedric Marchand Lab-STICC
%
%Shannon limit for Gaussian channel
% Capacity of unconstrained Gaussian channel
% Shannon-Hartly equation: C=B log2(1+S/N)
% C/B=r spectral efficienty in bit/second/hz


clear;

%%
% compute SNR bound for a given modulation and code rate

CR=1/2; % code rate
mod=2; %modulation, bits per synbol

r=CR*mod;
SNR=2^r-1;
Ebno=SNR/r;
SNR_dB=10*log(SNR);
Ebno_db=10*log(Ebno);

%%
% spectral efficincy vs SNR

SNR_dB=-5:0.5:30;
SNR = 10.^(SNR_dB./10);
r=log2(1+SNR);


figure(1);
plot(SNR_dB,r);
grid on;
xlabel('Signal to Noise Ratio, SNR(dB)');
ylabel('Spectral efficiency, R/W bit/sec/Hz');
title('Spectral efficiency vs SNR');



%%
% spectral efficiency vs EbNo
figure(2);

r = 0:.001:10;
Eb_No = (2.^r -1)./r;
Eb_No_dB = 10*log10(Eb_No);
plot(Eb_No_dB,r);
axis([-2 20 0.1 10]); 
grid on;
xlabel('Bit to noise ratio, Eb/No(dB)');
ylabel('Spectral efficiency, R/W bit/sec/Hz');
title('Spectral efficiency vs Bit to Noise ratio');