function [ outmoney ] = calMoney( config,test,result,item_unique )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明


mat = item_unique;
for i=1:size(test,1) %%实际值
indext = item_unique == test(i,1);
mat(indext,2) = test(i,3);
end
for i=1:size(result,1)  %%预测值
indexr = item_unique == result(i,1);
mat(indexr,3) = result(i,3);
end
outmoney = 0;
for i=1:size(mat,1)
    in = config.item_id == mat(i,1);
    if(mat(i,2)>mat(i,3)) %%实际值大于预测值
        outmoney  = outmoney + (mat(i,2)-mat(i,3))*config.a(in);
    end
    if(mat(i,3)>mat(i,2)) %%预测值大于实际值
        outmoney  = outmoney + (mat(i,3)-mat(i,2))*config.b(in);
    end
end
end

