({
    getBooks: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName: 'recordURL', type: 'url', typeAttributes: {label: { fieldName: 'Id' }}},
            {label: 'Title', fieldName: 'MBMS_Title__c', type: 'text'}
        ]);
        
        var action = component.get('c.getBooksList');
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === 'SUCCESS') {
                let books = response.getReturnValue();
                
                books.forEach(function(book){
                    book.recordURL = `/${book.Id}`;
                });
                
                component.set('v.books', books);
            }
        });
        
        $A.enqueueAction(action);
    }
})