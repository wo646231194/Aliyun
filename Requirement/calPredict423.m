function [ result ] = calPredict423(config, all ,type)
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

for i=1:CF.num_item
    item_id = CF.item_unique(i,1);
    all_item = selectItemIdA(all,item_id);
    cin = config.item_id == item_id;
    delta = zeros(CF.datemap.Count,1);
    y = zeros(CF.datemap.Count,1);
    for j=1:size(all_item.date,1)
        in = CF.date_unique == all_item.date(j);
        if(sum(in)>0)
            y(CF.datemapR(CF.date_unique(in)),1) = all_item.qty_alipay_njhs(j);
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
    mu=mean(delta);
    sigma=std(delta);
    index = abs(delta-mu)>0.25*sigma;
    if(sum(index)>0)
        yin = find(index == 0);
        y(index) = mean(y(yin>0));
    end
    Mdl = arima('Constant',0,'D',1,'Seasonality',12,...
        'MALags',1,'SMALags',12);
    try
        EstMdl = estimate(Mdl,y);
        res = infer(EstMdl,y);
        Ysim = simulate(EstMdl,14,'NumPaths',20,'Y0',y,'E0',res);
        mn = mean(Ysim,2);
        pre = sum(mn);
    catch
        pre = y(31);
    end
    result(i,:) = [item_id,type,pre];
end
