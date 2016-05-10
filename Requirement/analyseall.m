clear;clc;addpath function;
all = load('all.mat');all = all.data;
store = load('store.mat');store = store.data;
CF = load('config.mat');CF = CF.config;
configall = getConfig(CF);
config = configall.all;

colnames = fieldnames(all);
for i=2:size(colnames,1)
    value = getfield(all,colnames{i,1});
    ttt = 0;
end