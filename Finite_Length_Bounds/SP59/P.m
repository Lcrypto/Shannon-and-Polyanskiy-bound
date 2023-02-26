function y = P(n,x)
%  Y = P(n,x)




if n == 1
    y=0*ones(size(x));
elseif n == 2
    y=sqrt(2/pi)*ones(size(x));
elseif n == 3
    y=x/2;
elseif n==4
    y=sqrt(2/pi)*(2+x.^2)/3;
else
    y= (2*n-5+x.^2)/(n-1).*P(n-2,x)-(n-4)/(n-1).*P(n-4,x);
end