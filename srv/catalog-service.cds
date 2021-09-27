using my.bookshop as my from '../db/schema';

service CatalogService @(path:'/browse')
 {
    @Capabilities: {Insertable:true,Deletable:true,}
      @odata.draft.enabled : true
    
    entity Books as Projection on my.Books
    
    @Capabilities: {Insertable:true,Deletable:true,}
     @odata.draft.enabled : true
     entity Authors as projection on my.Authors

         @Capabilities: {Insertable:true,Deletable:true,}
         @odata.draft.enabled : true
     entity MyOrders as projection on my.Orders;

 }
     
     

