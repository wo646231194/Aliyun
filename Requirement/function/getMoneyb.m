function [ b ] = getMoneyb( config,item_id )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
cin = config.item_id == item_id;
b = config.b(cin);
end
