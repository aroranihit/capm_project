using { b79capm.db as b79db } from '..//db/schema';

service MyStoreAnalyticsService{


    // storewise sales entity to calculate total sales for each store
    entity StoreWiseSales as
        select from b79db.Orders{
            key storName,
               cast (sum(netPrice) as Decimal(9,2)) as totalSales
        }
        group by storName;

    // productwise sales entity to calculate total sales for each product
    entity ProductWiseSales as
        select from b79db.OrderItems{
            key product.ID as productID,
            product.name as productName,
            cast (sum(totalPrice) as Decimal(9,2)) as totalSales,
        }
        group by product.ID , product.name;    

    entity LowStockProducts as
        select from b79db.Products{
            key ID,
            name,
            stock
        }
        where stock < 15; // threshold for low stock can be adjusted as needed

    entity Top3Orders as
        select from b79db.Orders{
            key ID,
            
            netPrice,
            customerName,
            storName
        }
        order by netPrice desc
        limit 3; // to get top 3 orders based on net price        
}