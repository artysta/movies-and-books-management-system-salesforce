({
    getMoviesFunction: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName: 'recordURL', type: 'url', typeAttributes: {label: { fieldName: 'Id' }}},
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Title', fieldName: 'MBMS_Title__c', type: 'text'},
            {label: 'Director', fieldName: 'directorNameURL', type: 'url', typeAttributes: {label: { fieldName: 'directorName' }}},
            {label: 'Writer', fieldName: 'writerNameURL', type: 'url', typeAttributes: {label: { fieldName: 'writerName' }}}
        ]);
        
        var action = component.get('c.getMoviesList');
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === 'SUCCESS') {
                let movies = response.getReturnValue();
                
                movies.forEach(function(movie){
                    movie.recordURL = `/${movie.Id}`;
                    movie.directorNameURL = `/${movie.MBMS_Director__c}`;
                    movie.writerNameURL = `/${movie.MBMS_Writer__c}`;
                    movie.directorName = movie.MBMS_Director__r['Name'];
                    movie.writerName = movie.MBMS_Writer__r['Name'];
                });
                
                component.set('v.movies', movies);
            }
        });
        
        $A.enqueueAction(action);
    },
    areMoviesAvailableFunction: function (component, event, helper) {
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