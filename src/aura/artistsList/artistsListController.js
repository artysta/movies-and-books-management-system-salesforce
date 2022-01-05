({
    getArtists: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName: 'Id', type: 'text'},
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Birthplace', fieldName: 'MBMS_Birthplace__c', type: 'text'},
            {label: 'Date of Birth', fieldName: 'MBMS_Date_of_Birth__c', type: 'date'},
            {label: 'Date of Death', fieldName: 'MBMS_Date_of_Death__c', type: 'date'}
        ]);
        
        var action = component.get('c.getArtistsList');
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === 'SUCCESS') {
                component.set('v.artists', response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
    }
})