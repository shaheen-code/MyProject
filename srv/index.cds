using from './catalog-service';
using from '@sap/cds/common';


annotate CatalogService.Books with @( 
    Common.SemanticKey: [title],

UI:{
    Identification: [{Value: title}],
    
     SelectionFields: [title,author.name,author_ID],
    LineItem:[
        {Value: ID},
        {Value: title},
        {Value: author.name},
        {Value: author_ID},
        {Value: stock, Label: 'Stock Level', Criticality: level}

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
        Description: {Value:author.name},
        Title:{Value: ID, Label:'Book ID'}
        
        
    },


         Facets: [
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>Book Info}', Target: '@UI.FieldGroup#General'},
        ],
        FieldGroup#General: {
            Data: [
                //{Value: ID, Label:'{i18n>Book ID}'},
                {Value: title},
                {Value: author_ID,Label:'{i18n>Author ID}'},
             {Value: stock,Label:'{i18n>Stock}'}
            ]
        },
        

        
},    

);
// {
// 	author @ValueList.entity:'Authors';
// };

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
    


   
annotate CatalogService.Books with {
    ID @title:'{i18n>ID}' @Core.Computed;
    title @title:'{i18n>Title}';
    author @title:'{i18n>AuthorID}';
    stock @title:'{i18n>Stock}';
}

annotate CatalogService.Authors with {
    ID @title:'{i18n>ID}' @UI.HiddenFilter @Core.Computed;
    name @title:'{i18n>AuthorName}';
}
annotate CatalogService.Authors with @( 
UI:{
    //Identification: [{Value: title}],
     SelectionFields: [name, ID],
    LineItem:[
        {Value: ID},
        {Value: name},
       // {Value: books.title},
        
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

