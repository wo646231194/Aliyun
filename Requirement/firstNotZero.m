function [ vin ] = firstNotZero( y )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

