const cds = require('@sap/cds');
const { INSERT } = require('@sap/cds/lib/ql/cds-ql');
const { results } = require('@sap/cds/lib/utils/cds-utils');

module.exports = class ProductMgmtService extends cds.ApplicationService {
    init() {

        const{Products} = cds.entities('ProductMgmtService')

        //I want to override generic handler with my custom handler
        this.before('CREATE',Products, async req => {
           console.log('Before Handler');
           if(req.data.discount === null){
            req.data.discount = 0;
           }
           

        });

        this.after('READ',Products, results => {
            console.log('After Handler');
            console.log(results);
            for(var i=0; i<results.length; i++){
                var discount = results[i].discount;
                var price = results[i].price;
                var priceAfterDiscount = (100 - discount)/100 * price;
                results[i].discount = priceAfterDiscount;
            }
        });

        return super.init()
    }
}    