function result = d_func(N,j,x)
%---------------------------------------------
%   This function realizes the d(N,j,x) function in the following paper:
%       I. Sason and G. Wiechman, "Log-Domain Calculation of the 
%       1959 Sphere-Packing Bound with Application to M-ary PSK 
%       Block Coded Modulation," 2006 IEEE 24th Convention of 
%       Electrical Electronics Engineers in Israel, 2006, pp. 344
%       -348, doi: 10.1109/EEEI.2006.321097.
%   See Eq(8).
%----------------------------------------------

term_1 = x.^2/2;
term_2 = gammaln(N/2);
term_3 = gammaln(j/2+1);
term_4 = gammaln(N-j);
term_5 = (N-1-j)*log(sqrt(2)*x);
term_6 = log(2)/2;
term_7 = log(1+(-1)^j*gammainc(x.^2/2,(j+1)/2));

result = term_1+term_2-term_3-term_4+term_5-term_6+term_7;



end