clear;clc;
addpath data;addpath function;
if(~exist('all.mat','file'))
[data.date,data.item_id,data.cate_id,data.cate_level_id,data.brand_id,data.supplier_id,data.pv_ipv,data.pv_uv,data.cart_ipv,data.cart_uv,data.collect_uv,data.num_gmv,data.amt_gmv,data.qty_gmv,data.unum_gmv,data.amt_alipay,data.num_alipay,data.qty_alipay,data.unum_alipay,data.ztc_pv_ipv,data.tbk_pv_ipv,data.ss_pv_ipv,data.jhs_pv_ipv,data.ztc_pv_uv,data.tbk_pv_uv,data.ss_pv_uv,data.jhs_pv_uv,data.num_alipay_njhs,data.amt_alipay_njhs,data.qty_alipay_njhs,data.unum_alipay_njhs] = importItem('item_feature2.csv',1, 210549);
save('all.mat','data');
clear data;
end
if(~exist('store.mat','file'))
[data.date,data.item_id,data.store_code,data.cate_id,data.cate_level_id,data.brand_id,data.supplier_id,data.pv_ipv,data.pv_uv,data.cart_ipv,data.cart_uv,data.collect_uv,data.num_gmv,data.amt_gmv,data.qty_gmv,data.unum_gmv,data.amt_alipay,data.num_alipay,data.qty_alipay,data.unum_alipay,data.ztc_pv_ipv,data.tbk_pv_ipv,data.ss_pv_ipv,data.jhs_pv_ipv,data.ztc_pv_uv,data.tbk_pv_uv,data.ss_pv_uv,data.jhs_pv_uv,data.num_alipay_njhs,data.amt_alipay_njhs,data.qty_alipay_njhs,data.unum_alipay_njhs]= importStore('item_store_feature2.csv',1, 864772);
save('store.mat','data');
clear data;
end
if(~exist('config.mat','file'))
[data.item_id,data.store_code,data.a_b] = importConfig('config2.csv',1, 5778);
data.a = zeros(5778,1);data.b = zeros(5778,1);
for i=1:5778
    str = regexp(data.a_b{i,1}, '_', 'split');
    data.a(i,1) = str2double(str{1});
    data.b(i,1) = str2double(str{2});
end
save('config.mat','data');
clear data;
end
