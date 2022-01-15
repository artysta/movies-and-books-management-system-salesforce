({
    getRequiringActionRecordsFunction: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName: 'Id', type: 'text'},
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Status', fieldName: 'MBMS_Status__c', type: 'text'},
            {label: 'Created Date', fieldName: 'CreatedDate', type: 'date'}
        ]);
        
        var action = component.get('c.getRequiringActionRecords');
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === 'SUCCESS') {                
                component.set('v.sObjects', response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
    }
})