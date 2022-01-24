({
    getMovies: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName: 'recordURL', type: 'url', typeAttributes: {label: { fieldName: 'Id' }}},
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Title', fieldName: 'MBMS_Title__c', type: 'text'},
            {label: 'Director', fieldName: 'MBMS_Director__c', type: 'date'},
            {label: 'Writer', fieldName: 'MBMS_Writer__c', type: 'date'}
        ]);
        
        var action = component.get('c.getMoviesList');
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === 'SUCCESS') {
                let movies = response.getReturnValue();
                
                movies.forEach(function(movie){
                    movie.recordURL = `/${movie.Id}`;
                });
                
                component.set('v.movies', movies);
            }
        });
        
        $A.enqueueAction(action);
    },
    arePhotosAvailableFunction: function (component, event, helper) {
        var action = component.get("c.areMoviesAvailable");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.moviesAvailable", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})