using { b79capm.db as b79db } from '..//db/schema';

service OrderMgmtService {

  entity Products as projection on b79db.Products;
  @odata.draft.enabled
  entity Orders as projection on b79db.Orders;
  entity OrderItems as projection on b79db.OrderItems;


   
}