function [snr] = get_permit_snr(n,rate)
%--------------------------------------------------------------------------
% This function calcuates the smallest SNR that permit the simplification
% of Equation (61) in Gonzalo's TIT paper:
%
% G. Vazquez-Vilar, "Error Probability Bounds for Gaussian Channels Under 
% Maximal and Average Power Constraints," in IEEE Transactions on Information 
% Theory, vol. 67, no. 6, pp. 3965-3985, June 2021, 
% doi: 10.1109/TIT.2021.3063311.
%
%Input : n      --      blocklength
%        rate   --      code rate
%output: snr    --      smallest SNR in dB
%
%                                               Linfang
%--------------------------------------------------------------------------


snr_right=20;
snr_left=0;
%snr_left=-10;
gamma = 1;
sigma2_left=10^(-0.1*snr_left); %sigma2
theta_left = sqrt(sigma2_left+gamma);
sigma2_right=10^(-0.1*snr_right); %sigma2
theta_right = sqrt(sigma2_right+gamma);

if(rate>R_bar(n,gamma,theta_left,snr_left) && rate>R_bar(n,gamma,theta_right,snr_right))
    snr = 0;
    fprintf("SNR boundary is set too small");
    return
end

if(rate<R_bar(n,gamma,theta_left,snr_left) && rate<R_bar(n,gamma,theta_right,snr_right))
    snr = 0;
    fprintf("SNR boundary is set too large");
    return
end


while true
    snr_middle = (snr_left+snr_right)/2;
    sigma2_middle=10^(-0.1*snr_middle); %sigma2
    theta_middle = sqrt(sigma2_middle+gamma);
    rate_middle = R_bar(n,gamma,theta_middle,snr_middle);
    if (rate_middle>rate)
        snr_right = snr_middle;
    elseif (rate_middle<rate)
        snr_left = snr_middle;
    else
        snr=snr_middle;
        break;
    end
    if(abs(snr_left-snr_right)<1e-3)
        snr = snr_middle;
        break;
    end

end


end