using OrderMgmtService as service from '../../srv/ordermgmt-srv';
annotate service.Orders with @(
    UI.SelectionFields : [
        ID,
        customerName,
        storName,
        netPrice,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : storName,
        },
        {
            $Type : 'UI.DataField',
            Value : customerName,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : netPrice,
        },
    ],
    UI.HeaderInfo : {
        TypeName : 'Order',
        TypeNamePlural : 'Orders',
        Title : {
            $Type : 'UI.DataField',
            Value : ID,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : netPrice,
        },
        TypeImageUrl : 'sap-icon://sales-order-item',
    },
    UI.DataPoint #modifiedBy : {
        $Type : 'UI.DataPointType',
        Value : modifiedBy,
        Title : 'modifiedBy',
    },
    UI.DataPoint #storName : {
        $Type : 'UI.DataPointType',
        Value : storName,
        Title : 'storName',
    },
    UI.DataPoint #customerName : {
        $Type : 'UI.DataPointType',
        Value : customerName,
        Title : 'customerName',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'modifiedBy',
            Target : '@UI.DataPoint#modifiedBy',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'storName',
            Target : '@UI.DataPoint#storName',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'customerName',
            Target : '@UI.DataPoint#customerName',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Details',
            ID : 'OrderDetails',
            Target : '@UI.FieldGroup#OrderDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Item Details',
            ID : 'ItemDetails',
            Target : 'items/@UI.LineItem#ItemDetails',
        },
        
    ],
    UI.FieldGroup #OrderDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : customerName,
            },
            {
                $Type : 'UI.DataField',
                Value : customerMobile,
                Label : 'customerMobile',
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : storName,
            },
            {
                $Type : 'UI.DataField',
                Value : netPrice,
            },
        ],
    },
);

annotate service.Orders with {
    ID @Common.Label : 'Order ID';
    customerName @Common.Label : 'Customer Name';
    storName @(
        Common.Label : 'Store Name',
        Common.FieldControl : #ReadOnly,
    );
    netPrice @(
        Common.Label : 'Net Price',
        Common.FieldControl : #ReadOnly,
    );
};

annotate service.OrderItems with{

    ID @Common.Label : 'ID';
    order @Common.Label : 'Order ID';
    product @(
        Common.Label : 'Product ID',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Products',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'price',
                    LocalDataProperty : unitPrice,
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'discount',
                    LocalDataProperty : discount,
                },
            ],
            Label : 'Select Product',
        },
        Common.ValueListWithFixedValues : false,
    );
    unitPrice @Common.Label : 'Unit Price';
    quantity @Common.Label : 'Quantity';
    discount @Common.Label : 'Discount';
    totalPrice @Common.Label : 'Total Price';
    
};


   
annotate service.OrderItems with @(
    UI.LineItem #ItemDetails : [
        {
            $Type : 'UI.DataField',
            Value : order_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : product_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : unitPrice,
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
        },
        {
            $Type : 'UI.DataField',
            Value : totalPrice,
        },
    ]
);

