clear;clc;addpath function;
all = load('all.mat');all = all.data;
store = load('store.mat');store = store.data;
config = load('config.mat');config = config.data;
save = 1;start = 11;

item_unique = unique(all.item_id);
date_unique = unique(all.date);
datemap = containers.Map(1:size(date_unique,1),date_unique);
datemapR = containers.Map(date_unique,1:size(date_unique,1));
num_item = size(item_unique,1);
num_date = size(date_unique,1);
filterDate = [20141111,20141212,20150618,20151111,20151212];
result = zeros(num_item,3);

for i=1:num_item
    item_id = item_unique(i,1);
    all_item = selectItemIdA(all,item_id);
    alipay_unique = unique(all_item.qty_alipay_njhs);
%     all_item = sortByDateA(all_item,0);
    y = zeros(datemap.Count,1);
    for j=1:size(all_item.date,1)
        if(all_item.qty_alipay_njhs(j) == alipay_unique(size(alipay_unique,1),1))%ÂË³ý·åÖµ
            continue;
        end
        if(sum(filterDate == all_item.date(j)))%ÂË³ýÈÕÆÚ
            continue;
        end
        in = date_unique == all_item.date(j);
        if(sum(in)>0)
            y(datemapR(date_unique(in)),1) = all_item.qty_alipay_njhs(j);
        end
    end
%     %»æÍ¼
%     stairs(1:datemap.Count,y);
%     set(gca,'XTickLabel',{'20141010','20141129','20150118','20150309','20150428','20150617','20150806','20150925','20151114','20160103'});
%     savefile = sprintf('all/%d.jpg',item_id);
%     if(~exist(savefile,'file')||save)
%         saveas(gcf,savefile);
%     end
    area = zeros(size(num_date:-14:1,2)-2,1);
    tmpstart = start;
    for t=1:size(area,1)
        area(t,1) = sum(y(tmpstart:tmpstart+13));
        tmpstart=tmpstart+14;
    end
    notmax = area ~=max(area);
    notmin = area ~=min(area);
    notzero = area>0 ;
    pre = mean(area(notzero&notmax&notmin));
%     stem(1:31,area(notzero&notmax&notmin));
    ttt = 0;
%     savefile = sprintf('all/%d_week.jpg',item_id);
%     if(~exist(savefile,'file')||save)
%         saveas(gcf,savefile);
%     end
end
