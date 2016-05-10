clear;clc;addpath function;

savefile = 'result_427';

all = load('all.mat');all = all.data;
store = load('store.mat');store = store.data;
config = load('config.mat');config = config.config;
config.item_unique = unique(config.item_id);
config.date_unique = unique(all.date);
config.datemap = containers.Map(1:size(config.date_unique,1),config.date_unique);
config.datemapR = containers.Map(config.date_unique,1:size(config.date_unique,1));
config.num_item = size(config.item_unique,1);
config.num_date = size(config.date_unique,1);
config.store_unique = unique(store.store_code);
save('config.mat','config');

result = calPredict426(config, all ,0);

for i=1:size(config.store_unique,1)
    tmp_store = selectStore(store,config.store_unique(i));
    tmp_result = calPredict426(config, tmp_store ,config.store_unique(i));
    result = [result;tmp_result];
end
save(sprintf('%s.mat',savefile),'result');
notzero = result(:,3)>0;
result= result(notzero,:);
dlmwrite(sprintf('%s.csv',savefile),result,'precision', '%6d');

%%
if(~exist('test.mat','file'))
    test = getResultByDate(all,20151214,20151227,0);
    for i=1:size(config.store_unique,1)
        tmp_store = selectStore(store,config.store_unique(i));
        tmp_result = getResultByDate( tmp_store ,20151214,20151227,config.store_unique(i));
        test = [test;tmp_result];
    end
    save('test.mat','test');
end
[money,moneyall] = evaluation(config,'test.mat',savefile);