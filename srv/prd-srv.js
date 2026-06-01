const cds = require('@sap/cds');
const { INSERT, UPDATE } = require('@sap/cds/lib/ql/cds-ql');
const { results } = require('@sap/cds/lib/utils/cds-utils');

module.exports = class ProductMgmtService extends cds.ApplicationService {
    init() {

        const{Products} = cds.entities('ProductMgmtService')

         this.on("ApplyDiscount",async req => {

            const prdId = req.params[0].ID;
            const discount = req.data.discount;
            await UPDATE(Products)
            .set({discount: discount})
            .where({ID: prdId});
            req.info("Discount " + discount + "% applied successfully");
        });

        this.on("AddStock",async req => {

            const prdId = req.params[0].ID;
            const newStock = req.data.stock;
            await UPDATE(Products)
            .set({stock: { '+=': newStock }})
            .where({ID: prdId});
            req.info("Stock"+newStock+" updated successfully");
        });

        //I want to override generic handler with my custom handler
        this.before('CREATE',Products, async req => {
           console.log('Before Handler');
           if(req.data.discount === null){
            req.data.discount = 0;
           }
           

        });

        // this.after('READ',Products, results => {
        //     console.log('After Handler');
        //     console.log(results);
        //     for(var i=0; i<results.length; i++){
        //         var discount = results[i].discount;
        //         var price = results[i].price;
        //         var priceAfterDiscount = (100 - discount)/100 * price;
        //         results[i].discount = priceAfterDiscount;
        //     }
        // });

        return super.init()
    }
}    