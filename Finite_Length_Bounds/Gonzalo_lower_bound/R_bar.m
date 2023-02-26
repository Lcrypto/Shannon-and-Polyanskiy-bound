function [bar_R_n] = R_bar(n,gamma,theta,snr)
%--------------------------------------------------------------------------
%This function calculates R_bar, which is related to M_bar, Equation (60)
%in Gonzalo's TIT paper:
%
% G. Vazquez-Vilar, "Error Probability Bounds for Gaussian Channels Under 
% Maximal and Average Power Constraints," in IEEE Transactions on Information 
% Theory, vol. 67, no. 6, pp. 3965-3985, June 2021, 
% doi: 10.1109/TIT.2021.3063311.
%
% Computation follows Equation (55)-(58) and (60).
% Input:    n       --      blocklength
%           gamma   --      gamma, averaged symbol energy of channel input
%           theta   --      theta 
%           snr     --      SNR value in dB
% Output:   bar_R_n --      bar_R_n
%--------------------------------------------------------------------------
sigma2=10^(-0.1*snr); %sigma2
sigma=sqrt(sigma2);
theta2=theta^2;
delta=theta2-sigma2; %delta
delta2=delta^2;

xi_1 = @(t) (stable_marcumq(sqrt(n*gamma)*sigma/delta,t/sigma,n/2))-(stable_marcumq(0,sqrt(maxplus(t.^2/sigma2-n*gamma*theta2/delta2)),n/2));
xi_2 = @(t) theta^n/sigma^n*exp(0.5*(n*gamma/delta-delta*t.^2/sigma2/theta2)).*((stable_marcumq(0,sqrt(maxplus(t.^2/theta2-n*gamma*sigma2/delta2)),n/2))-(stable_marcumq(sqrt(n*gamma)*theta/delta,t/theta,n/2)));
xi_3 = @(t) n*gamma/2/delta*((t.*delta)/(sigma2*sqrt(n*gamma))).^(n/2).*exp(-0.5*(n*gamma*sigma2/delta2+t.^2/sigma2)).*besseli(n/2,sqrt(n*gamma)*t/delta);
xii = @(t) xi_1(t)+xi_2(t)+xi_3(t);

t_left = 0;
t_right = 50;
t= t_left:0.1:t_right;
y=xii(t);
[~,max_pos] = max(y);
[~,min_pos] = min(y);
t_left = t(max_pos);
t_right = t(min_pos);

%the following for loop determines t0
t0=0;
while true
    if abs(t_left-t_right)<10^-5
        t0=(t_right+t_left)/2;
        break
    else
        t_prime = (t_right+t_left)/2;
        if xii(t_prime)>0
            t_left=t_prime;
        elseif xii(t_prime)<0
            t_right=t_prime;
        else
            t0=t_prime;
            break;
        end
    end
end
bar_R_n=-1/n*log2(ncx2cdf(t0^2/theta2,n,n*gamma*theta2/delta2));

end