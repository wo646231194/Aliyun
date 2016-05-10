function [ features ] = cicleZeroFeature( config, item_all )
% [ features ] = getFeatures( item_all )
%   ÌáÈ¡ÌØÕ÷

for i=1:config.num_item
    item_id = config.item_unique(i,1);
    all_item = selectItemIdA(item_all,item_id);
    ttt = 0;
end

end

