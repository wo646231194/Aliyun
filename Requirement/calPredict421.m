function [ result ] = calPredict(config, all ,type)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

result = zeros(config.num_item,3);
result(:,1) = config.item_unique;
CF = config;
configall = getConfig(config);
switch type
    case 0
        config = configall.all;
    case 1
        config = configall.store1;
    case 2
        config = configall.store2;
    case 3
        config = configall.store3;
    case 4
        config = configall.store4;
    case 5
        config = configall.store5;
end
start = 11;

for i=1:config.num_item
    item_id = config.item_unique(i,1);
    all_item = selectItemIdA(all,item_id);
    y = zeros(config.datemap.Count,1);
    for j=1:size(all_item.date,1)
        if(sum(filterDate == all_item.date(j)))%滤除日期
            continue;
        end
        in = config.date_unique == all_item.date(j);
        if(sum(in)>0)
            y(config.datemapR(config.date_unique(in)),1) = all_item.qty_alipay_njhs(j);
        end
    end
%     stairs(1:datemap.Count,y);
%     set(gca,'XTickLabel',{'20141010','20141129','20150118','20150309','20150428','20150617','20150806','20150925','20151114','20160103'});
%     savefile = sprintf('all/%d.jpg',item_id);
%     if(~exist(savefile,'file')||save)
%         saveas(gcf,savefile);
%     end
    area = zeros(size(config.num_date:-14:1,2)-1,1);
    tmpstart = start;
    for t=1:size(area,1)
        area(t,1) = sum(y(tmpstart:tmpstart+13));
        tmpstart=tmpstart+14;
    end
    notmax = area ~=max(area);
    notmin = area ~=min(area);
    notzero = area>0 ;
    if(sum(notzero&notmax&notmin)>0)
%         pre = mean(area(notzero&notmax&notmin));
        pre = mean(area(30:31));
    else
        pre = 0;
    end
    result(i,:) = [item_id,type,pre];
end

