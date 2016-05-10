function [ outy ] = maxMeanFilter( yv )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
outy = yv;
[~,tin] = max(yv);
if(var(yv)>1)
    outy(tin) = mean(yv(1:size(yv,1)~=tin));
end

end

