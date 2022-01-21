({
    getBatchLogsFunction: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName: 'recordURL', type: 'url', typeAttributes: {label: { fieldName: 'Id' }}},
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Batch Name', fieldName: 'MBMS_Batch_Name__c', type: 'text'},
            {label: 'Records Processed', fieldName: 'MBMS_Records_Processed__c', type: 'text'},
            {label: 'Message', fieldName: 'MBMS_Message__c', type: 'text'},
            {label: 'Created Date', fieldName: 'CreatedDate', type: 'date'}
        ]);
        
        var action = component.get('c.getBatchLogs');
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === 'SUCCESS') {
                let batchLogs = response.getReturnValue();

                batchLogs.forEach(function(batchLog){
                    batchLog.recordURL = `/${batchLog.Id}`;
                });
                
                component.set('v.batchLogs', batchLogs);
            }
        });
        
        $A.enqueueAction(action);
    }
})