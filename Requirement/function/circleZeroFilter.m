function [ yv ] = circleZeroFilter( yv,n )
%UNTITLED8 此处显示有关此函数的摘要
%   此处显示详细说明

for i=1:n+1
    yv = maxZeroFilter(yv);
end

end

