namespace b79capm.db;
using { cuid, managed } from '@sap/cds/common';

entity Products: cuid{
    name:String(30);
    description:String(100);
    price:Decimal(9,2);
    discount:Integer;
    stock:Integer;
    image: LargeBinary @Core.MediaType: 'image/jpeg';
} 


entity Orders: cuid, managed {
   customerName: String;
   customerMobile: String;
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
    