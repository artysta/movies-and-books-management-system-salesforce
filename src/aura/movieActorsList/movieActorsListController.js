({
    getMovieActorsFunction: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Id', fieldName: 'recordURL', type: 'url', typeAttributes: {label: { fieldName: 'Id' }}},
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Movie', fieldName: 'movieURL', type: 'url', typeAttributes: {label: { fieldName: 'movie' }}}
        ]);
        
        var action = component.get('c.getMovieActors');
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === 'SUCCESS') {
                let movieActors = response.getReturnValue();
                
                movieActors.forEach(function(movieActor){
                    movieActor.recordURL = `/${movieActor.Id}`;
                    movieActor.movieURL = `/${movieActor.MBMS_Movie__c}`;
                    movieActor.movie = movieActor.MBMS_Movie__r['Name'];
                });
                
                component.set('v.movieActors', movieActors);
            }
        });
        
        $A.enqueueAction(action);
    },
    areMovieActorsAvailableFunction: function (component, event, helper) {
        var action = component.get("c.areMovieActorsAvailable");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.movieActorsAvailable", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})