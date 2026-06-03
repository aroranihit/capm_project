using { b79capm.db as b79db } from '..//db/schema';

service ProductMgmtService {

    @odata.draft.enabled
    @requires:'Owner'
    entity Products as projection on b79db.Products{
      *,
      case
          when stock = 0 then 'Out of Stock'
          when stock < 10 then 'Low Stock'
          else 'Available'
        end as status : String,

        case
          when stock = 0 then '1'
          when stock < 10 then '2'
          else '3'
        end as statusCriticality :  String,

    }
    actions{

      @Common.SideEffects: {TargetProperties: ['stock', 'status', 'statusCriticality']}
      @requires:'Owner'
        action AddStock(stock: Integer @Common.Label: 'New Stock') returns String; //defination of action to add stock

       @Common.SideEffects: {TargetProperties: ['discount']}
      action ApplyDiscount(discount: Integer @Common.Label: 'Discount') returns String;
    }
   
}