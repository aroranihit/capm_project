using { b79capm.db as b79db } from '..//db/schema';

service OrderMgmtService {

  entity Products as projection on b79db.Products;
  @odata.draft.enabled
    @Common.SideEffects: {SourceEntities:['items'],TargetProperties: ['netPrice']}
   entity Orders as projection on b79db.Orders;

  @Common.SideEffects: {SourceProperties:['unitPrice', 'quantity'],TargetProperties: ['totalPrice']}
  entity OrderItems as projection on b79db.OrderItems;


   
}