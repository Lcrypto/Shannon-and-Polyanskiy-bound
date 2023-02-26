function y = F(n,x)
%  Y = F(n,x)

% y = P(n,x)+Q(n,x).*exp(x.^2/2).* sqrt(2*pi) .* normcdf(x);
data_val = zeros(n,length(x));
P_val =zeros(size(data_val));
Q_val = zeros(size(data_val));

for ii = 1:n
    if ii<5
        P_val(ii,:)=P(ii,x);
        Q_val(ii,:)=Q(ii,x);
    else
        P_val(ii,:)=(2*ii-5+x.^2)/(ii-1).*P_val(ii-2,:)-(ii-4)/(ii-1).*P_val(ii-4,:);
        Q_val(ii,:)=(2*ii-5+x.^2)/(ii-1).*Q_val(ii-2,:)-(ii-4)/(ii-1).*Q_val(ii-4,:);
    end
    data_val(ii,:) = P_val(ii,:)+Q_val(ii,:).*exp(x.^2/2).* sqrt(2*pi).* normcdf(x);
end
y=data_val(end,:);

end