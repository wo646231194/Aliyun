function [ outy, in] = sigmaFileter(delta,s )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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


