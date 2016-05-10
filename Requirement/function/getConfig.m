function [ outconfig ] = getConfig( config )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
k = 963;

outconfig.all.item_id = config.item_id(1:k);
outconfig.all.store_code = config.store_code(1:k);
outconfig.all.a_b = config.a_b(1:k);
outconfig.all.a = config.a(1:k);
outconfig.all.b = config.b(1:k);

outconfig.store4.item_id = config.item_id(k+1:k*2);
outconfig.store4.store_code = config.store_code(k+1:k*2);
outconfig.store4.a_b = config.a_b(k+1:k*2);
outconfig.store4.a = config.a(k+1:k*2);
outconfig.store4.b = config.b(k+1:k*2);

outconfig.store3.item_id = config.item_id((k*2+1):k*3);
outconfig.store3.store_code = config.store_code((k*2+1):k*3);
outconfig.store3.a_b = config.a_b((k*2+1):k*3);
outconfig.store3.a = config.a((k*2+1):k*3);
outconfig.store3.b = config.b((k*2+1):k*3);

outconfig.store5.item_id = config.item_id((k*3+1):k*4);
outconfig.store5.store_code = config.store_code((k*3+1):k*4);
outconfig.store5.a_b = config.a_b((k*3+1):k*4);
outconfig.store5.a = config.a((k*3+1):k*4);
outconfig.store5.b = config.b((k*3+1):k*4);

outconfig.store1.item_id = config.item_id((k*4+1):k*5);
outconfig.store1.store_code = config.store_code((k*4+1):k*5);
outconfig.store1.a_b = config.a_b((k*4+1):k*5);
outconfig.store1.a = config.a((k*4+1):k*5);
outconfig.store1.b = config.b((k*4+1):k*5);

outconfig.store2.item_id = config.item_id((k*5+1):k*6);
outconfig.store2.store_code = config.store_code((k*5+1):k*6);
outconfig.store2.a_b = config.a_b((k*5+1):k*6);
outconfig.store2.a = config.a((k*5+1):k*6);
outconfig.store2.b = config.b((k*5+1):k*6);

end

