
using from './catalog-service';
using from '@sap/cds/common';

annotate CatalogService.MyOrders with @( 
    //Common.SemanticKey: [],

UI:{
    
    SelectionFields  : [order_ID],
    LineItem  :  [
        {Value : order_ID},
        {Value : quantity},
        {Value : books_name}
    ]
},
 );

 
