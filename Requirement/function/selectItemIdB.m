function [ out_data ] = selectItemIdB( data , item_id)
%根据时间获取数据
%   begin_time开始时间
%   end_time结束时间
index = data.item_id==item_id;
out_data.date = data.date(index);%1
out_data.item_id = data.item_id(index);%2
out_data.store_code = data.store_code(index);%3
out_data.cate_id = data.cate_id(index);%4
out_data.cate_level_id = data.cate_level_id(index);%5
out_data.brand_id = data.brand_id(index);%6
out_data.supplier_id = data.supplier_id(index);%7
out_data.pv_ipv = data.pv_ipv(index);%8
out_data.pv_uv = data.pv_uv(index);%9
out_data.cart_ipv = data.cart_ipv(index);%10
out_data.cart_uv = data.cart_uv(index);%11
out_data.collect_uv = data.collect_uv(index);%12
out_data.num_gmv = data.num_gmv(index);%13
out_data.amt_gmv = data.amt_gmv(index);%14
out_data.qty_gmv = data.qty_gmv(index);%15
out_data.unum_gmv = data.unum_gmv(index);%16
out_data.amt_alipay = data.amt_alipay(index);%17
out_data.num_alipay = data.num_alipay(index);%18
out_data.qty_alipay = data.qty_alipay(index);%19
out_data.unum_alipay = data.unum_alipay(index);%20
out_data.ztc_pv_ipv = data.ztc_pv_ipv(index);%21
out_data.tbk_pv_ipv = data.tbk_pv_ipv(index);%22
out_data.ss_pv_ipv = data.ss_pv_ipv(index);%23
out_data.jhs_pv_ipv = data.jhs_pv_ipv(index);%24
out_data.ztc_pv_uv = data.ztc_pv_uv(index);%25
out_data.tbk_pv_uv = data.tbk_pv_uv(index);%26
out_data.ss_pv_uv = data.ss_pv_uv(index);%27
out_data.jhs_pv_uv = data.jhs_pv_uv(index);%28
out_data.num_alipay_njhs = data.num_alipay_njhs(index);%29
out_data.amt_alipay_njhs = data.amt_alipay_njhs(index);%30
out_data.qty_alipay_njhs = data.qty_alipay_njhs(index);%31
out_data.unum_alipay_njhs = data.unum_alipay_njhs(index);%32

end

