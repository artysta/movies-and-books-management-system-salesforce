({
    getBooks: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName: 'Id', type: 'text'},
            {label: 'Title', fieldName: 'MBMS_Title__c', type: 'text'}
        ]);
        
        var action = component.get('c.getBooksList');
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === 'SUCCESS') {
                component.set('v.books', response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
    }
})