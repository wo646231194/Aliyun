function [ outy ] = maxFilter( yv )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
outy = yv;
[tmpmax,tin] = max(yv);
if(tmpmax>1)
    outy(tin) = 0;
else
    outy(tin) = mean(yv(1:size(yv)~=tmpmax));
end

end

