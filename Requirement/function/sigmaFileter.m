function [ outy, in] = sigmaFileter(delta,s )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
outy = delta;
% mu=mean(delta);
sigma=std(delta);
index = abs(delta)>s*sigma;
if(sum(index)>0)
    yin = index == 0;
    outy(index) = mean(delta(yin(1:size(delta,1)/2)));
end
in = index ==0;
end


