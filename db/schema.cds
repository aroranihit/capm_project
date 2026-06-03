namespace b79capm.db;
using { cuid, managed } from '@sap/cds/common';

entity Products: cuid{
    name:String(30) @mandatory;
    description:String(100) @mandatory;
    price:Decimal(9,2) @mandatory;
    discount:Integer @mandatory @assert.format : '^(100|[1-9]?[0-9])$'; // discount should be between 0 and 100
    stock:Integer @mandatory;
    image: LargeBinary @Core.MediaType: 'image/jpeg';
} 


entity Orders: cuid, managed {
   customerName: String;
   customerMobile: String (10);
   storName: String;
   netPrice: Decimal(9,2);
   items: Composition of many OrderItems on items.order= $self;
}

entity OrderItems: cuid{
    order:Association to Orders;
    product: Association to Products;
    quantity: Integer;
    discount: Integer;
    unitPrice: Decimal(9,2);
    totalPrice: Decimal(9,2);
}
    