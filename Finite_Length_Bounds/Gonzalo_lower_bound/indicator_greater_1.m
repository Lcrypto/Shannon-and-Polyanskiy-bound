function [y] = indicator_greater_1(s)
%UNTITLED19 Summary of this function goes here
%   Detailed explanation goes here
y=s;
y(s>1)=1;
y(s<=1)=0;
end