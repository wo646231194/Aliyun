function [ b ] = getMoneyb( config,item_id )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
cin = config.item_id == item_id;
b = config.b(cin);
end
