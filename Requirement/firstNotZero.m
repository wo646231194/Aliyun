function [ vin ] = firstNotZero( y )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
[m,n] = size(y);
if(m<n) 
    m = n;
    y = y';
end
vin = 1;
for i=1:m
    if(y(i,1)~=0) 
        vin = i;
        break;
    end
end

end

