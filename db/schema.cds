 namespace my.bookshop;

using { cuid,Country} from '@sap/cds/common';

entity Books: cuid
{
    key ID : UUID  @odata.Type:'Edm.String';
    title : String;
    stock : Integer;
    author : Association to Authors;
    level : Integer;
    //Country: Country;
   

}

entity Authors
{
key ID : Integer;
name : String;
books : Association to many Books on books.author =$self;
}

entity Orders
{
    key order_ID: UUID @odata.Type:'Edm.String' @title:'{i18n>ID}';
    quantity: Integer;
    books_name: String;
    book: Association to Books;
   

} 