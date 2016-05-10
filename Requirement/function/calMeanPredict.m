function [ result ] = calMeanPredict(config, all ,type)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

result = zeros(config.num_item,3);
result(:,1) = config.item_unique;

for i=1:config.num_item
    item_id = config.item_unique(i,1);
    all_item = selectItemIdA(all,item_id);
    y = zeros(config.datemap.Count,1);
    for j=1:size(all_item.date,1)
        in = config.date_unique == all_item.date(j);
        if(sum(in)>0)
            y(config.datemapR(config.date_unique(in)),1) = all_item.qty_alipay_njhs(j);
        end
    end
    pre = y(431:444);
%     pre = y(417:430);
    result(i,:) = [item_id,type,sum(pre)];
end


