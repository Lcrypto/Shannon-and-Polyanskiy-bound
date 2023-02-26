function [y] = indicator_less_0(s)
%UNTITLED19 Summary of this function goes here
%   Detailed explanation goes here
y=s;
y(s<0)=1;
y(s>=0)=0;
end