test = load('test.mat');test = test.test;
testall = test(test(:,2) == 0,:);
moneyall  = calMoney( config,testall,result,CF.item_unique );
sum(abs(loss(:,cpd)));