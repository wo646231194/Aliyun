clear;clc

clear;clc;addpath function;

savefile = 'resultavg';

all = load('all.mat');all = all.data;
store = load('store.mat');store = store.data;
config = load('config.mat');config = config.config;

[train,tmp] = splitDateA(all,20151130);
[train_eval,test] = splitDateA(tmp,20151214);

train_y = getResult(train_eval,0);
test_y = getResult(test,0);
features = getFeature(config,train);


