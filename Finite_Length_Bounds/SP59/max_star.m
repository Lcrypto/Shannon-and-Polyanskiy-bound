function [result] = max_star(x_1,x_2)
%----------------------------------------------------
% Return max_star function, see expression in
%       I. Sason and G. Wiechman, "Log-Domain Calculation of the 
%       1959 Sphere-Packing Bound with Application to M-ary PSK 
%       Block Coded Modulation," 2006 IEEE 24th Convention of 
%       Electrical Electronics Engineers in Israel, 2006, pp. 344
%       -348, doi: 10.1109/EEEI.2006.321097.
%---------------------------------------------------

result = max(x_1,x_2)+log(1+exp(-1*abs(x_1-x_2)));


end