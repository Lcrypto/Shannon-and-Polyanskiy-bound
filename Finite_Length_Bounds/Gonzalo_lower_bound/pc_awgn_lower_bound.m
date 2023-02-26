function [FER] = pc_awgn_lower_bound(n,rate,snr)
%--------------------------------------------------------------------------
%               [FER] = lower_bound(n,rate,gamma,snr)
%
% This function calculates the lower bound of power constrained channel.
% This is the simplified function, Eq. (61), in Gonzalo's IEEE TIT paper.
%
% G. Vazquez-Vilar, "Error Probability Bounds for Gaussian Channels Under 
% Maximal and Average Power Constraints," in IEEE Transactions on Information 
% Theory, vol. 67, no. 6, pp. 3965-3985, June 2021, 
% doi: 10.1109/TIT.2021.3063311.
%
%
% Input:    n       --      block length
%           rate    --      spectral efficiency (bits/channel)
%           snr     --      SNR value in dB.(can be vector )
%
% Output:   FER     --      the lower bound of the tranmission sytem
%                           defined by (n,R) at snr dB.
%                                       coloum 1: snr;
%                                       column 2: eb/n0;
%                                       column 3: es/n0;
%                                       column 4: fer
%
% Note that rate must be less than bar{R} such that this equation can be
% used properly. bar{R} is realted to equation (60) in the paper.
%
%
%                                                           Linfang Wang
%--------------------------------------------------------------------------
gamma=1;
permit_snr = get_permit_snr(n,rate);
snr(snr<permit_snr) = []; % remove snr values that are not suitable for approximation
beta = 2^(-n*rate);
FER =zeros(length(snr),4);
FER(:,1)=snr.';
FER(:,2)=FER(:,1)-10*log10(2*rate); %EB/N0
FER(:,3)=FER(:,2)+10*log10(rate); %ES/N0
s=0.2:0.01:3;

for ii = 1:length(snr)
    snr_val = snr(ii);
    sigma2=10^(-0.1*snr_val); %sigma2
    sigma=sqrt(sigma2);
    theta2 = tilde_theat_s(gamma,sigma,rate);
    theta=sqrt(theta2);
    FER(ii,4)=max(tilde_f(s,theta,sigma,gamma,beta,n));
end
end