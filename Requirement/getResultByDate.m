function result = getResultByDate( all,start,ends ,type)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
config = load('config.mat');config = config.config;
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
    startin = config.datemapR(start);
    endsin = config.datemapR(ends);
    pre = y(startin:endsin);
    result(i,:) = [item_id,type,sum(pre)];
end

