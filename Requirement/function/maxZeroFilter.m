function [ outy ] = maxZeroFilter( yv )
%UNTITLED6 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
outy = yv;
[~,tin] = max(yv);
if(var(yv)>1)
    outy(tin) = 0;
end

end

