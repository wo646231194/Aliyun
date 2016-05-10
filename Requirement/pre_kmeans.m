clear;clc;addpath function;
all = load('all.mat');all = all.data;
store = load('store.mat');store = store.data;
CF = load('config.mat');CF = CF.config;
configall = getConfig(CF);
config = configall.all;

save = 1;start = 11;type=0;
cpd = 31;sigma=3;
Y = zeros(CF.num_item,cpd);
X = zeros(CF.num_item,CF.num_date-(31-cpd)*14);
loss = zeros(CF.num_item,cpd);

% filterDate = [20141111,20141212,20150618,20151111,20151212];
result = zeros(CF.num_item,3);

for i=1:CF.num_item
    item_id = CF.item_unique(i,1);
    all_item = selectItemIdA(all,item_id);
    cin = config.item_id == item_id;
    alipay_max = max(unique(all_item.qty_alipay_njhs));
    delta = zeros(CF.datemap.Count,1);
    y = zeros(CF.datemap.Count,1);
    for j=1:size(all_item.date,1)
        if(all_item.qty_alipay_njhs(j) == alipay_max && alipay_max >1)%ÂË³ý·åÖµ
            continue;
        end
        in = CF.date_unique == all_item.date(j);
        if(sum(in)>0)
            y(CF.datemapR(CF.date_unique(in)),1) = all_item.qty_alipay_njhs(j);
        end
    end
    tmpstart = start;
    for t=1:cpd
        yv = y(tmpstart:tmpstart+13);
        if(cpd-t<=1)
            y(tmpstart:tmpstart+13) = circleZeroFilter(yv,cpd-t);
        else
            y(tmpstart:tmpstart+13) = maxFilter(y(tmpstart:tmpstart+13));
        end
        tmpstart=tmpstart+14;
    end
    
    X(i,:) = y(1:end-(31-cpd)*14);
    area = zeros(size(CF.num_date:-14:1,2)-1,1);
    tmpstart = start;
    for t=1:size(area,1)
         yv = y(tmpstart:tmpstart+13);
%         [tmpmax,tin] = max(yv);
%         if(tmpmax>1)
%             yv(tin) = 0;
%         end
        area(t,1) = sum(yv);
        tmpstart=tmpstart+14;
    end
    Y(i,:) = area(1:cpd);
    loss(i,:) = calcDelta(config,area(1:cpd),item_id);
end

k=1;prm.nTrial=10; prm.display=1; prm.outFrac=0.08;
[IDX,C,sumd] = kmeans2( Y, k, prm );
% visualizeData(X,2,IDX);
nid = CF.item_unique(IDX ==-1);
pid = CF.item_unique(IDX ==1);
pay_nid = X(IDX ==-1,:);
pay_pid = X(IDX ==1,:);
area_nid = Y(IDX ==-1,:);
area_pid = Y(IDX ==1,:);

one_area_nid = area_nid(2,:);
one_nid = nid(2,:);
getMoneya(config,one_nid)
getMoneyb(config,one_nid)

[value,ib] = sort(abs(loss(:,cpd)),'descend');
[~,vin] = sigmaFileter(value,sigma);
ib = ib(vin==0);
for i=1:size(ib,1)
    item_id = CF.item_unique(ib(i,1));
    d = Y(ib(i,1),cpd) - Y(ib(i,1),cpd-1);
    ma = getMoneya(config,item_id);
    mb = getMoneyb(config,item_id);
    ls = value(i,1);
    if(d>0)
        if(ma<mb)
            pre = Y(ib(i,1),cpd)-ls/ma/3;
        end
    else
        if(ma>mb)
            pre = Y(ib(i,1),cpd)+ls/mb/3;
        end
    end
    item_in = CF.item_unique == value(i,1);
    pre = mean(Y(item_in,cpd-2:cpd-1));
    result(item_in,:) = [value(i,1),type,pre];
end