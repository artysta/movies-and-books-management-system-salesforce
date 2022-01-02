({
    getMovies: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName: 'Id', type: 'text'},
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Title', fieldName: 'MBMS_Title__c', type: 'text'},
            {label: 'Director', fieldName: 'MBMS_Director__c', type: 'date'},
            {label: 'Writer', fieldName: 'MBMS_Writer__c', type: 'date'}
        ]);
        
        var action = component.get('c.getMoviesList');
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === 'SUCCESS') {
                component.set('v.movies', response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
    }
})