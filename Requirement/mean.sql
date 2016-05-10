DROP TABLE IF EXISTS result;
CREATE TABLE IF NOT EXISTS result as(
  SELECT item_id,'all' as store,sum(qty_alipay_njhs) as num FROM item_feature
  WHERE date<=20151227 and date>=20151214
  GROUP BY item_id
);
