function [ outy ] = maxMeanFilter( yv )
%UNTITLED6 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
outy = yv;
[~,tin] = max(yv);
if(var(yv)>1)
    outy(tin) = mean(yv(1:size(yv,1)~=tin));
end

end

