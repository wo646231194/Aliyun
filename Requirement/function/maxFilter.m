function [ outy ] = maxFilter( yv )
%UNTITLED6 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
outy = yv;
[tmpmax,tin] = max(yv);
if(tmpmax>1)
    outy(tin) = 0;
else
    outy(tin) = mean(yv(1:size(yv)~=tmpmax));
end

end

