using ProductMgmtService as service from '../../srv/prd-srv';
annotate service.Products with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            
        },
        {
            $Type : 'UI.DataField',
            Value :  description,
            
        },
        {
            $Type : 'UI.DataField',
            Value : price,
           
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
            
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Criticality : statusCriticality,
            
        },
    ],
    UI.SelectionFields : [
        ID,
        name,
        price,
        stock,
    ],
    UI.HeaderInfo : {
        TypeName : 'Product',
        TypeNamePlural : 'Products',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : description,
        },
        
        ImageUrl : image,
    },
    UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'ID',
    },
    UI.DataPoint #stock : {
        $Type : 'UI.DataPointType',
        Value : stock,
        Title : 'Stock',
    },
    UI.DataPoint #price : {
        $Type : 'UI.DataPointType',
        Value : price,
        Title : 'Price',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ID',
            Target : '@UI.DataPoint#ID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'stock',
            Target : '@UI.DataPoint#stock',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'price',
            Target : '@UI.DataPoint#price',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'status',
            Target : '@UI.DataPoint#status',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product Details',
            ID : 'ProductDetails',
            Target : '@UI.FieldGroup#ProductDetails',
        },
    ],
    UI.FieldGroup #ProductDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : discount,
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Value : image,
                Label : 'image',
            },
        ],
    },
    UI.DataPoint #status : {
        $Type : 'UI.DataPointType',
        Value : status,
        Title : 'Status',
        Criticality : statusCriticality,
    },
);

annotate service.Products with {
    ID     @Common.Label : 'Product ID';
    name    @Common.Label : 'Name';
    description    @Common.Label : 'Description';
    price   @Common.Label : 'Price';
    discount  @Common.Label : 'Discount';
    stock     @Common.Label : 'Stock';
    status     @Common.Label : 'Status'

};




