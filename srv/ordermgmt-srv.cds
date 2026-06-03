using { b79capm.db as b79db } from '..//db/schema';

service OrderMgmtService {
  @requires:['Owner','Employee']
  entity Products as projection on b79db.Products;
  @odata.draft.enabled
    @Common.SideEffects: {SourceEntities:['items'],TargetProperties: ['netPrice']}
    
    @(restrict:[
      {
         grant:['*'],
         to : 'Owner'
      },
      {
         grant:['WRITE'],
         to : 'Employee'
      },
      {
         grant:['READ'],
         to : 'Employee',where :(storName = $user.storName)
      }
    ])
   entity Orders as projection on b79db.Orders;

  @Common.SideEffects: {SourceProperties:['unitPrice', 'quantity'],TargetProperties: ['totalPrice']}
   @requires:['Owner','Employee']
  entity OrderItems as projection on b79db.OrderItems;


   
}