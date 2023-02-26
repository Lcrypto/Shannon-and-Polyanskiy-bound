function result = max_star_seq(N,x)
%----------------------------------------------------
% Realize max*{d{N,i,x}}_{i=0}^{N-1} function, see expression in
%       I. Sason and G. Wiechman, "Log-Domain Calculation of the 
%       1959 Sphere-Packing Bound with Application to M-ary PSK 
%       Block Coded Modulation," 2006 IEEE 24th Convention of 
%       Electrical Electronics Engineers in Israel, 2006, pp. 344
%       -348, doi: 10.1109/EEEI.2006.321097.
%---------------------------------------------------

f_0  = d_func(N,0,x);
f_1  = d_func(N,1,x);

result = max_star(f_0,f_1);

for ii = 2 : N-1
    f = d_func(N,ii,x);
    result = max_star(f,result);
end


end