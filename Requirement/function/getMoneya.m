function [ a ] = getMoneya( config,item_id )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
cin = config.item_id == item_id;
a = config.a(cin);
end

