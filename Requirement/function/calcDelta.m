function [ delta ] = calcDelta(config,y,item_id )
%UNTITLED5 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[m,n] = size(y);
if(m<n) 
    m = n;
end
delta = zeros(m,1);

for j=2:m
        delta(j) = y(j)-y(j-1);
        if(delta(j)>0) 
            delta(j) = delta(j)*getMoneya(config,item_id);
        elseif(delta(j)<0) 
            delta(j) = delta(j)*getMoneyb(config,item_id);
        end
end

end

