namespace my.bookshop;

using {cuid,Country,sap.common.Countries} from '@sap/cds/common';

entity Books : cuid{
    key ID      : UUID @odata.Type : 'Edm.String'  @title:'{i18n>ID}' @Core.Computed;
        title   : String  @title:'{i18n>Title}';
        stock   : Integer  @title:'{i18n>Stock}';
        author  : Association to Authors @title:'{i18n>AuthorID}';
        level   : Integer;
        image : LargeBinary @Core.MediaType: imageType;
        imageType : String  @Core.IsMediaType;
        country : Country;
       //bookStatus : String;
      // type:  String @Core.Computed enum {InLibraryOnDemand};
         
         //cbookStatus : BookStatus;
         
}
          // type BookStatus : String enum {InLibrary; Ondemand;}​



entity Authors {
    key ID    : Integer;
        name  : String  @title:'{i18n>Author Name}';
        books : Association to many Books
                    on books.author = $self;
}

entity Orders {
    key order_ID   : UUID @odata.Type : 'Edm.String'  @title : '{i18n>ID}';
        quantity   : Integer;
        books_name : String;
        book       : Association to Books;


}
