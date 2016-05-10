function [ result ] = calPredict(config, all ,type)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

filterDate = [20151212];
cpd = 30;sigma=3;

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
Y = zeros(CF.num_item,cpd);
X = zeros(CF.num_item,CF.num_date-(31-cpd)*14);
loss = zeros(CF.num_item,cpd);

for i=1:CF.num_item
    item_id = CF.item_unique(i,1);
    all_item = selectItemIdA(all,item_id);
    cin = config.item_id == item_id;
    alipay_max = max(unique(all_item.qty_alipay_njhs));
    y = zeros(CF.datemap.Count,1);
    for j=1:size(all_item.date,1)
        in = CF.date_unique == all_item.date(j);
        if(sum(filterDate == all_item.date(j)))%滤除日期
            continue;
        end
%         if(all_item.qty_alipay_njhs(j) == alipay_max && alipay_max >1)%滤除峰值
%             continue;
%         end
        if(sum(in)>0)
            y(CF.datemapR(CF.date_unique(in)),1) = all_item.qty_alipay_njhs(j);
        end
    end
    X(i,:) = y(1:end-(31-cpd)*14);
    
%     tmpstart = start;
%     for t=1:cpd
%         yv = y(tmpstart:tmpstart+13);
%         if(cpd-t<2)
%             y(tmpstart:tmpstart+13) = circleZeroFilter(yv,cpd-t);
%         else
%             y(tmpstart:tmpstart+13) = maxZeroFilter(y(tmpstart:tmpstart+13));
%         end
%         tmpstart=tmpstart+14;
%     end
%     tmpstart = start;
%     for t=1:cpd
%         y(tmpstart:tmpstart+13) = maxZeroFilter(y(tmpstart:tmpstart+13));
%         tmpstart=tmpstart+14;
%     end
%     outy = sigmaFileter(CF,config,item_id,y,3);
%     outy = sigmaFileter(CF,config,item_id,outy,3);
    area = zeros(size(CF.num_date:-14:1,2)-1,1);
    tmpstart = start;
    for t=1:size(area,1)
        yv = maxZeroFilter(y(tmpstart:tmpstart+13));
        area(t,1) = sum(yv);
        tmpstart=tmpstart+14;
    end
    Y(i,:) = area(1:cpd);
    loss(i,:) = calcDelta(config,area(1:cpd),item_id);
    yp = y(417:430);
%     yp = sigmaDeltaFileter(CF,config,item_id,yp,sigma,14);
%     yv = sigmaDeltaFileter(CF,config,item_id,yv,sigma,14);
    
    notzero = area>0;
    if(sum(notzero)>0)
%         pre = mean(area(notzero&notmax&notmin));
        pre = mean(area(cpd:cpd));
    else
        pre = 0;
    end
    if(config.a(cin)>config.b(cin)&&(area(cpd)-area(cpd-1))<0)
        pre = area(cpd-1);
%     elseif(config.a(cin)<config.b(cin)&&area(cpd)-area(cpd-1)>0)
%         pre = area(cpd-1);
    end
    result(i,:) = [item_id,type,pre];
end

if(type ==0 || type ==1 ||type ==4||type ==5)
    [value,ib] = sort(abs(loss(:,cpd)),'descend');
    [~,vin] = sigmaFileter(value,sigma);
    ib = ib(vin==0);
    for i=1:size(ib,1)
        item_id = CF.item_unique(ib(i,1));
        vec = Y(ib(i,1),1:cpd-1);
        vec = vec(firstNotZero(vec):end);
        item_avg = mean(vec(vec>0));
        d = Y(ib(i,1),cpd) - item_avg;
        ma = getMoneya(config,item_id);
        mb = getMoneyb(config,item_id);
        ls = value(i,1);
        if(d>0)
            if(ma<mb)
                pre = Y(ib(i,1),cpd)-ls/mb/3;
                result(ib(i,1),:) = [item_id,type,pre];
            end
        else
            if(ma>mb)
                pre = Y(ib(i,1),cpd)+ls/ma/3;
                result(ib(i,1),:) = [item_id,type,pre];
            end
        end
    end
end
