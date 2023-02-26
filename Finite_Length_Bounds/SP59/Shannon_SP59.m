function [FER] = Shannon_SP59(n,k,snr)
%------------------------------------------------
% [FER] = Shannon_SP59(n,k,snr)
% This function calculates the Shannon 1959 Sphere Packing bound.
% Calculation follows the following paper: 
%
% A. Valembois and M. P. C. Fossorier, "Sphere-packing bounds 
% revisited for moderate block lengths," in IEEE Transactions 
% on Information Theory, vol. 50, no. 12, pp. 2998-3014, Dec. 
% 2004, doi: 10.1109/TIT.2004.838090.
%
% Input:    n               --      blocklength(channel uses) [real channel]
%           k               --      input bit length
%           snr             --      SNR in dB (can be an array, 
%                                   10log10(E_s/sigma^2))
% Output:   FER             --      FER:
%                                       coloum 1: snr;
%                                       column 2: eb/n0;
%                                       column 3: es/n0;
%                                       column 4: fer
%
% Example:  For a trasmission system with 128 input sysmbols and 
%           64 output symbols, for the snr=0:0.1:3, the SP bound
%           can be calculated by:
%
% 
%                       Shannon_SP59(64,128,0:0.1:3)
%
%                                     Linfang Wang
%--------------------------------------------------

R= k/n;
theta_star = find_theta_star(n,R);
FER =zeros(length(snr),4);
FER(:,1)=snr.';
FER(:,2)=FER(:,1)-10*log10(2*R); %EB/N0
FER(:,3)=FER(:,2)+10*log10(R); %ES/N0

for ii = 1:length(snr)
    snr_decible = snr(ii) ;   
    A = sqrt(10^(0.1*snr_decible));
    FER(ii,4) = SPB_log(n,theta_star,A);
end




end