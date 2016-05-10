clear;clc;addpath function;
all = load('all.mat');all = all.data;
store = load('store.mat');store = store.data;
CF = load('config.mat');CF = CF.config;
configall = getConfig(CF);
config = configall.all;
cpd = 31;

save = 1;start = 11;k=2;X = zeros(CF.num_item,cpd);

% filterDate = [20141111,20141212,20150618,20151111,20151212];
% result = zeros(CF.num_item,3);

for i=1:CF.num_item
    item_id = CF.item_unique(i,1);
    all_item = selectItemIdA(all,item_id);
    cin = config.item_id == item_id;% item_id index in CF
%     all_item = sortByDateA(all_item,0);
    delta = zeros(CF.datemap.Count,1);
    y = zeros(CF.datemap.Count,1);
    for j=1:size(all_item.date,1)
%         if(all_item.qty_alipay_njhs(j) == alipay_unique(size(alipay_unique,1),1))%ÂË³ý·åÖµ
%             continue;
%         end
%         if(sum(filterDate == all_item.date(j)))%ÂË³ýÈÕÆÚ
%             continue;
%         end
        in = CF.date_unique == all_item.date(j);
        if(sum(in)>0)
            y(CF.datemapR(CF.date_unique(in)),1) = all_item.qty_alipay_njhs(j);
%             
%             if(CF.datemapR(CF.date_unique(in))>1)
%                 beforemoney = delta(CF.datemapR(CF.date_unique(in))-1,1);
%                 money = 0;
%                 if(all_item.qty_alipay_njhs(j) - beforemoney>0)
%                     money = config.a(cin);
%                 elseif(all_item.qty_alipay_njhs(j) - beforemoney<0)
%                     money = config.b(cin);
%                 end
%             else
%                 beforemoney = 0;
%             end
%             
%             delta(CF.datemapR(CF.date_unique(in)),1) = (all_item.qty_alipay_njhs(j)-beforemoney)*money;
        end
    end
    
    for j=2:CF.num_date
        delta(j) = y(j)-y(j-1);
        if(delta(j)>0) 
            delta(j) = delta(j)*config.a(cin);
        elseif(delta(j)<0) 
            delta(j) = delta(j)*config.b(cin);
        end
    end
    
%     figure(1);subplot(2,1,1);
%     plot(1:CF.datemap.Count,y);
%     set(gca,'XTickLabel',{'20141010','20141129','20150118','20150309','20150428','20150617','20150806','20150925','20151114','20160103'});
    
%     mu=mean(delta);
%     sigma=std(delta);
%     index = abs(delta-mu)>3*sigma;
%     if(sum(index)>0)
%         yin = find(index == 1);
%         y(index) = (y(yin-1)+y(yin+1))/2;
%     end
    
%     subplot(2,1,2);
%     plot(1:CF.datemap.Count,y);
%     set(gca,'XTickLabel',{'20141010','20141129','20150118','20150309','20150428','20150617','20150806','20150925','20151114','20160103'});
%     savefile = sprintf('all/%d.png',item_id);
%     if(~exist(savefile,'file')||save)
%         saveas(gcf,savefile);
%     end
    area = zeros(size(CF.num_date:-14:1,2)-1,1);
    tmpstart = start;
    for t=1:size(area,1)
        area(t,1) = sum(y(tmpstart:tmpstart+13));
        tmpstart=tmpstart+14;
    end
    X(i,:) = area(1:30);
%     notmax = area ~=max(area);
%     notmin = area ~=min(area);
%     notzero = area>0 ;
%     pre = mean(area(notzero));
%     sum(y(431:444))
%     stem(1:30,area,'.');
% T = length(y);
% Mdl = arima('Constant',0,'D',1,'Seasonality',12,...
%     'MALags',1,'SMALags',12);
% EstMdl = estimate(Mdl,y);
% res = infer(EstMdl,y);
% Ysim = simulate(EstMdl,14,'NumPaths',25,'Y0',y,'E0',res);
% mn = mean(Ysim,2);
% figure(2);
% plot(y,'k')
% hold on
% plot(T+1:T+14,Ysim,'Color',[.85,.85,.85]);
% h = plot(T+1:T+14,mn,'k--','LineWidth',2);
% xlim([0,T+14]);
% sum(mn)

    ttt = 0;
%     savefile = sprintf('all/%d_week.jpg',item_id);
%     if(~exist(savefile,'file')||save)
%         saveas(gcf,savefile);
%     end
end

prm.nTrial=10; prm.display=1; prm.outFrac=0.5;
[IDX,C,sumd] = kmeans2( X, k, prm );
