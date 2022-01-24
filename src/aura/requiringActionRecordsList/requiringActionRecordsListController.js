({
    getRequiringActionRecordsFunction: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName: 'recordURL', type: 'url', typeAttributes: {label: { fieldName: 'Id' }}},
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Status', fieldName: 'MBMS_Status__c', type: 'text'},
            {label: 'Created Date', fieldName: 'CreatedDate', type: 'date'}
        ]);
        
        var action = component.get('c.getRequiringActionRecords');
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === 'SUCCESS') {                
                let sObjects = response.getReturnValue();
                
                sObjects.forEach(function(sObject){
                    sObject.recordURL = `/${sObject.Id}`;
                });
                
                component.set('v.sObjects', sObjects);
            }
        });
        
        $A.enqueueAction(action);
    },
    areRequiringActionRecordsAvailableFunction: function (component, event, helper) {
        var action = component.get("c.areRequiringActionRecordsAvailable");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.requiringActionRecordsAvailable", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})