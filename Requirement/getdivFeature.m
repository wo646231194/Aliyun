function [ f1 ] = getdivFeature( yv,n)
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明

for i=1:n
    yv = maxZeroFilter(yv);
end
    
end

