const cds = require('@sap/cds');
const { SELECT } = require('@sap/cds/lib/ql/cds-ql');


module.exports = class OrderMgmtService extends cds.ApplicationService {
    init() {

        const{Orders,OrderItems,Products} = cds.entities('OrderMgmtService');

        this.after("PATCH",OrderItems.drafts,async(data,req) => {
            const {ID} = data;
            const draftItem = await SELECT.one.from(OrderItems.drafts).where({ID: ID});

            if(draftItem){
                var totalPrice = (draftItem.quantity || 0 ) * (draftItem.unitPrice||0);
                if(draftItem.discount>0){
                    totalPrice = totalPrice - (totalPrice * draftItem.discount/100);
                }
                //update the total price in draft table
                await UPDATE(OrderItems.drafts)
                .set({totalPrice: totalPrice})
                .where({ID: ID});

                // now get all items of order and calcultae net price
                const allDraftItems = await SELECT.from(OrderItems.drafts).where({order_ID: draftItem.order_ID});
                var netPrice = 0;
                for(var i=0; i<allDraftItems.length; i++){
                    netPrice = netPrice + Number(allDraftItems[i].totalPrice);
                }
                //update net price in order draft
                await UPDATE(Orders.drafts)
                .set({netPrice: netPrice})
                .where({ID: draftItem.order_ID});
            }

        });
        this.after("DELETE",OrderItems.drafts,async(data,req) => {
           
              const order_ID = req.data.order_ID;
              const allDraftItems = await SELECT.from(OrderItems.drafts).where({order_ID: order_ID});
                var netPrice = 0;
                for(var i=0; i<allDraftItems.length; i++){
                    netPrice = netPrice + Number(allDraftItems[i].totalPrice);
                }
                //update net price in order draft
                await UPDATE(Orders.drafts)
                .set({netPrice: netPrice})
                .where({ID: order_ID});
        });

        this.before("CREATE",Orders,async(req) => {
            const items = req.data.items || [];
            if(items.length === 0){
                return req.error("Order cannot be created without items");
            }else{
                for(const item of items){
                    const productID = item.product_ID
                    const product = await SELECT.one.from(Products).where({ID:productID});
                    const currentStock = product.stock;
                    const orderQnty = item.quantity;
                    if(currentStock<orderQnty){
                        return req.error("Insuffient Stock for product " + productID);
                    }else{
                        await UPDATE(Products).set({stock:currentStock - orderQnty}).where({ID:productID})
                    }
                   
 
                }
            }
         });


        return super.init()

      
    }
}    