({
    getNewsFunction: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName: 'recordURL', type: 'url', typeAttributes: {label: { fieldName: 'Id' }}},
            {label: 'News Title', fieldName: 'MBMS_Title__c', type: 'text'}
        ]);
        
        var action = component.get('c.getNews');
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
    areNewsAvailableFunction: function (component, event, helper) {
        var action = component.get("c.areNewsAvailable");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.newsAvailable", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})