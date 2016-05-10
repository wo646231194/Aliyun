function [ outy ] = sigmaDeltaFileter( CF,config,item_id,y,s ,num_date)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
outy = y;
cin = config.item_id == item_id;
delta = zeros(num_date,1);
for j=2:num_date
    delta(j) = y(j)-y(j-1);
    if(delta(j)>0) 
        delta(j) = delta(j)*config.a(cin);
    elseif(delta(j)<0) 
        delta(j) = delta(j)*config.b(cin);
    end
end
mu=mean(delta);
sigma=std(delta);
index = abs(delta-mu)>s*sigma;
if(sum(index)>0)
    yin = index == 0;
    outy(index) = mean(y(yin));
end
end


