function [ out_data,out_data1 ] = splitDateA( data ,date)
%根据时间获取数据
%   begin_time开始时间
%   end_time结束时间

index1 = data.date<date;
index2 = data.date>=date;

out_data.date = data.date(index1);%1
out_data.item_id = data.item_id(index1);%2
out_data.cate_id = data.cate_id(index1);%3
out_data.cate_level_id = data.cate_level_id(index1);%4
out_data.brand_id = data.brand_id(index1);%5
out_data.supplier_id = data.supplier_id(index1);%6
out_data.pv_ipv = data.pv_ipv(index1);%7
out_data.pv_uv = data.pv_uv(index1);%8
out_data.cart_ipv = data.cart_ipv(index1);%9
out_data.cart_uv = data.cart_uv(index1);%10
out_data.collect_uv = data.collect_uv(index1);%11
out_data.num_gmv = data.num_gmv(index1);%12
out_data.amt_gmv = data.amt_gmv(index1);%13
out_data.qty_gmv = data.qty_gmv(index1);%14
out_data.unum_gmv = data.unum_gmv(index1);%15
out_data.amt_alipay = data.amt_alipay(index1);%16
out_data.num_alipay = data.num_alipay(index1);%17
out_data.qty_alipay = data.qty_alipay(index1);%18
out_data.unum_alipay = data.unum_alipay(index1);%19
out_data.ztc_pv_ipv = data.ztc_pv_ipv(index1);%20
out_data.tbk_pv_ipv = data.tbk_pv_ipv(index1);%21
out_data.ss_pv_ipv = data.ss_pv_ipv(index1);%22
out_data.jhs_pv_ipv = data.jhs_pv_ipv(index1);%23
out_data.ztc_pv_uv = data.ztc_pv_uv(index1);%24
out_data.tbk_pv_uv = data.tbk_pv_uv(index1);%25
out_data.ss_pv_uv = data.ss_pv_uv(index1);%26
out_data.jhs_pv_uv = data.jhs_pv_uv(index1);%27
out_data.num_alipay_njhs = data.num_alipay_njhs(index1);%28
out_data.amt_alipay_njhs = data.amt_alipay_njhs(index1);%29
out_data.qty_alipay_njhs = data.qty_alipay_njhs(index1);%30
out_data.unum_alipay_njhs = data.unum_alipay_njhs(index1);%31

out_data1.date = data.date(index2);%1
out_data1.item_id = data.item_id(index2);%2
out_data1.cate_id = data.cate_id(index2);%3
out_data1.cate_level_id = data.cate_level_id(index2);%4
out_data1.brand_id = data.brand_id(index2);%5
out_data1.supplier_id = data.supplier_id(index2);%6
out_data1.pv_ipv = data.pv_ipv(index2);%7
out_data1.pv_uv = data.pv_uv(index2);%8
out_data1.cart_ipv = data.cart_ipv(index2);%9
out_data1.cart_uv = data.cart_uv(index2);%20
out_data1.collect_uv = data.collect_uv(index2);%22
out_data1.num_gmv = data.num_gmv(index2);%22
out_data1.amt_gmv = data.amt_gmv(index2);%23
out_data1.qty_gmv = data.qty_gmv(index2);%24
out_data1.unum_gmv = data.unum_gmv(index2);%25
out_data1.amt_alipay = data.amt_alipay(index2);%26
out_data1.num_alipay = data.num_alipay(index2);%27
out_data1.qty_alipay = data.qty_alipay(index2);%28
out_data1.unum_alipay = data.unum_alipay(index2);%29
out_data1.ztc_pv_ipv = data.ztc_pv_ipv(index2);%20
out_data1.tbk_pv_ipv = data.tbk_pv_ipv(index2);%22
out_data1.ss_pv_ipv = data.ss_pv_ipv(index2);%22
out_data1.jhs_pv_ipv = data.jhs_pv_ipv(index2);%23
out_data1.ztc_pv_uv = data.ztc_pv_uv(index2);%24
out_data1.tbk_pv_uv = data.tbk_pv_uv(index2);%25
out_data1.ss_pv_uv = data.ss_pv_uv(index2);%26
out_data1.jhs_pv_uv = data.jhs_pv_uv(index2);%27
out_data1.num_alipay_njhs = data.num_alipay_njhs(index2);%28
out_data1.amt_alipay_njhs = data.amt_alipay_njhs(index2);%29
out_data1.qty_alipay_njhs = data.qty_alipay_njhs(index2);%30
out_data1.unum_alipay_njhs = data.unum_alipay_njhs(index2);%31

end

