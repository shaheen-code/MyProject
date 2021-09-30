using from './catalog-service';
using from '@sap/cds/common';


annotate CatalogService.Books with @( 
    Common.SemanticKey: [title],

UI:{
     Identification: [{Value: title}],
      SelectionFields: [title,AuthorName,author_ID,country_code],
    LineItem:[
        {Value: ID},
        {Value: title},
        {Value: AuthorName},
        {Value: author_ID},
        {Value: stock, Label: 'Stock Level', Criticality: level},
    

        //  {$Type: 'UI.DataField',Value: ID, Label: '{i18n>ID}'},
        // {$Type: 'UI.DataField',Value: title, Label: '{i18n>Book Title}'},
        // {$Type: 'UI.DataField',Value: author.name, Label: '{i18n>Author Name}'},
        // {$Type: 'UI.DataField',Value: author_ID, Label: '{i18n>Author ID}'},
        // {$Type: 'UI.DataField',Value: stock,Label: '{i18n>Book Stock}'}

    ],
    HeaderInfo:{
        TypeName: '{i18n>Book}',
        TypeNamePlural: '{i18n>BookList}',
      //  Title: {Value: title},
        Description: {Value:AuthorName},
        Title:{Value: ID, Label:'Book ID'}
        
        
    },


         Facets: [
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>Book Info}', Target: '@UI.FieldGroup#General'},
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>Book Info}', Target: '@UI.FieldGroup#General'},
            { $Type:'UI.ReferenceFacet', Label:'{i18n>Books of Author}', Target : 'author/books/@UI.LineItem'}
        ],
        FieldGroup#General: {
            Data: [
                //{Value: ID, Label:'{i18n>Book ID}'},
                {Value: title},
                {Value: author_ID,Label:'{i18n>Author ID}'},
             {Value: stock,Label:'{i18n>Stock}'},
             //{Value: bookStatus, Label:'{i18n>Book Status}'}
                    


            ]
        },
        

        
},    

);
annotate CatalogService.Books.image with 
{
    @UI.IsImageUrl: true
    @common.Text :'{i18n> Image}'
    image

}



// annotate CatalogService.Books with {
//         bookStatus @(Common : {
//                 ValueListWithFixedValues: true,
                
//                 ValueList : {
//                     SearchSupported : true,
//                     CollectionPath  : 'Books',
//                     Parameters      : [{
//                         $Type             : 'Common.ValueListParameterInOut',
//                         LocalDataProperty : bookStatus,
//                         ValueListProperty : 'bookStatus'
//                     },
//                     {
//                     $Type             : 'Common.ValueListParameterDisplayOnly',
//                     ValueListProperty : 'bookStatus'
//                 },   
//                     ]
//                 },
//                // Text            : <NavigationProperty>.<TextProperty>,
//                // TextArrangement : #TextOnly 
//             });
// };



//  {
// 	author @ValueList.entity:'Authors';
//  };

    annotate CatalogService.Books with {
    author @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'Authors',
            Label           : 'Authors',
            //SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterOut',
                    LocalDataProperty : 'author_ID',
                    ValueListProperty : 'ID',
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },   
            ]
        }
    });
}




annotate CatalogService.Authors with {
    ID @title:'{i18n>ID}' @UI.HiddenFilter @Core.Computed;
    name @title:'{i18n>AuthorName}';
}
annotate CatalogService.Authors with @( 
UI:{
     SelectionFields: [name, ID],
    LineItem:[
        {Value: ID},
        {Value: name},
       
        
    ],
    HeaderInfo:{
        TypeName: '{i18n>Author}',
        TypeNamePlural: '{i18n>Authors}',
        Title: {Value: name},
       // Description: {Value: author.name}
    },
        
        Facets  : [
            
              {$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'},
              //{$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}',Target: '@UI.FieldGroup#Details'}, 
              {$Type: 'UI.ReferenceFacet', Label:'{i18n>Books}', Target: 'books/@UI.LineItem'},
            
        ],
       
           FieldGroup#General: {
            Data: [
                {Value: ID, Label:'{i18n>Author ID}'},
                {Value: name, Label:'{i18n>Authors Name}'}
            
            ]
        },
        // FieldGroup#Details: {
        //     Data: [
        //         {Value: books.ID,Label:'{i18n>Books Id}'},
        //         {Value: books.title,Label:'{i18n>Books Title}'},
        //         {Value: books.stock,Label:'{i18n>Books Stock}'},

        //     ]

        // },


},



  
);

annotate CatalogService.MyOrders with {
    order_ID @title:'{i18n>ID}';
    quantity @title:'{i18n>Quantity}';
    books_name @title:'{i18n>Books Name}'
   }

