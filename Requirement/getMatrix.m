function [ mat,y ] = getMatrix( area, ns )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[am,an] = size(area);
if(am<an)
    am = an;
    area = area';
end
mat = zeros(am-ns+1,ns-1);
y = zeros(am-ns+1,1);
k = firstNotZero(area);

for i=k:(am-ns+1)
    mat(i,:) = area(i:(i+ns-2));
    y(i,1) = area(i+ns-1);
end

