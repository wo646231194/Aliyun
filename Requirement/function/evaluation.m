function [ money,moneyall ] = evaluation( config,tfilename,filename )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

result = load(filename);result = result.result;
test = load(tfilename);test = test.test;
item_unique = unique(config.item_id);
config = getConfig(config);

testall = test(test(:,2) == 0,:);
resultall = result(result(:,2) == 0,:);
tests1 = test(test(:,2) == 1,:);
results1 = result(result(:,2) == 1,:);
tests2 = test(test(:,2) == 2,:);
results2 = result(result(:,2) == 2,:);
tests3 = test(test(:,2) == 3,:);
results3 = result(result(:,2) == 3,:);
tests4 = test(test(:,2) == 4,:);
results4 = result(result(:,2) == 4,:);
tests5 = test(test(:,2) == 5,:);
results5 = result(result(:,2) == 5,:);

moneyall  = calMoney( config.all,testall,resultall,item_unique );
money(1,1) = calMoney( config.store1,tests1,results1,item_unique );
money(2,1) = calMoney( config.store2,tests2,results2,item_unique );
money(3,1) = calMoney( config.store3,tests3,results3,item_unique );
money(4,1) = calMoney( config.store4,tests4,results4,item_unique );
money(5,1) = calMoney( config.store5,tests5,results5,item_unique );

fprintf ('all  ->   %6.2f\n',moneyall+sum(money));
fprintf ('q  ->   %6.2f\n',moneyall);
for i=1:5
    fprintf ('store %d  ->  %6.2f',i,money(i,1));
    fprintf ('\n');
end
end
