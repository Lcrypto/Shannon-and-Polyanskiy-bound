function y = Q(n,x)
%  Y = Q(n,x)

if n == 1
    y=ones(size(x));
elseif n == 2
    y=sqrt(2/pi)*x;
elseif n == 3
    y=(1+x.^2)/2;
elseif n==4
    y=sqrt(2/pi)*(3*x+x.^3)/3;
else
    y= (2*n-5+x.^2)/(n-1).*Q(n-2,x)-(n-4)/(n-1).*Q(n-4,x);
end