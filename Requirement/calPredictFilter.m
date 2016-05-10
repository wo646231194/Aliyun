function [ result ] = calPredictFilter(config, all ,type)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

filterDate = [20151212];
cpd = 31;sigma=3;

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
        if(sum(filterDate == all_item.date(j)))
            continue;
        end
        if(all_item.qty_alipay_njhs(j) == alipay_max && alipay_max >1)
            continue;
        end
        if(sum(in)>0)
            y(CF.datemapR(CF.date_unique(in)),1) = all_item.qty_alipay_njhs(j);
        end
    end
    X(i,:) = y(1:end-(31-cpd)*14);
%     yestpp = y(CF.datemapR(20141130):CF.datemapR(20141213));
%     yestp = y(CF.datemapR(20141214):CF.datemapR(20141227));
%     yestv = y(CF.datemapR(20141228):CF.datemapR(20150110));

%     ty = [y;-y];figure(1);subplot(2,1,1);plot(ty);
%     [sst,~] = sigmaFileter(ty,sigma);subplot(2,1,2);plot(sst)

    area = zeros(size(CF.num_date:-14:1,2)-1,1);
    tmpstart = start;
    for t=1:cpd
        if(t == cpd)
            yv = maxMeanFilter(y(tmpstart:tmpstart+13));
        else
            yv = maxZeroFilter(y(tmpstart:tmpstart+13));
        end
        area(t,1) = sum(yv);
        tmpstart=tmpstart+14;
    end
    Y(i,:) = area(1:cpd);
    loss(i,:) = calcDelta(config,area(1:cpd),item_id);
   
%     yp = sigmaDeltaFileter(CF,config,item_id,yp,sigma,14);
%     yv = sigmaDeltaFileter(CF,config,item_id,yv,sigma,14);
%         pre = mean(area(notzero&notmax&notmin));
    pre = mean(area(cpd:cpd));
    if(config.a(cin)>config.b(cin)&&(area(cpd)-area(cpd-1))<0)
        pre = area(cpd-1);
%     elseif(config.a(cin)<config.b(cin)&&area(cpd)-area(cpd-1)>0)
%         pre = area(cpd-1);
    end
%     [ mat,yarea ] = getMatrix(area(1:cpd-1,1),5);
%     reg = regress(yarea,mat);
%     pre = area(cpd-4:cpd-1,1)'*reg;
%     fprintf('%d %d %d\n',sum(yestpp),sum(yestp),sum(yestv));
    result(i,:) = [item_id,type,pre];
end

k=1;prm.nTrial=10; prm.display=1; prm.outFrac=0.08;
[IDX,C,sumd] = kmeans2( Y, k, prm );
% visualizeData(X,2,IDX);
nid = CF.item_unique(IDX ==-1);
pid = CF.item_unique(IDX ==1);
x_nid = X(IDX ==-1,:);
x_pid = X(IDX ==1,:);
y_nid = Y(IDX ==-1,:);
y_pid = Y(IDX ==1,:);

% if(type ==0 || type ==1 ||type ==4||type ==5)
%     [value,ib] = sort(abs(loss(:,cpd)),'descend');
%     [~,vin] = sigmaFileter(value,sigma);
%     ib = ib(vin==0);
%     for i=1:size(ib,1)
%         item_id = CF.item_unique(ib(i,1));
%         vec = Y(ib(i,1),1:cpd-1);
%         vec = vec(firstNotZero(vec):end);
%         item_avg = mean(vec(vec>0));
%         d = Y(ib(i,1),cpd) - item_avg;
%         ma = getMoneya(config,item_id);
%         mb = getMoneyb(config,item_id);
%         ls = value(i,1);
%         if(d>0)
%             if(ma<mb)
%                 pre = Y(ib(i,1),cpd)-ls/mb/3;
%                 result(ib(i,1),:) = [item_id,type,pre];
%             end
%         else
%             if(ma>mb)
%                 pre = Y(ib(i,1),cpd)+ls/ma/3;
%                 result(ib(i,1),:) = [item_id,type,pre];
%             end
%         end
%     end
% end
