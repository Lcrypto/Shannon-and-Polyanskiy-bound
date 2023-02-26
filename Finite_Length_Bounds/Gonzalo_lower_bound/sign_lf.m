function [y] = sign_lf(s)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
y=s;
y(s<0)=-1;
y(s>=0)=1;
end