function [ yv ] = circleZeroFilter( yv,n )
%UNTITLED8 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

for i=1:n+1
    yv = maxZeroFilter(yv);
end

end

