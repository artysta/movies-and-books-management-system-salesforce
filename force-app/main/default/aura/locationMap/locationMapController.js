({
    initializeMapFunction: function(component, event, helper) {
        var action = component.get("c.getMainFilmingLocationByMovieId");
        action.setParams({
            movieId: component.get("v.recordId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set('v.mapMarkers', [
                    {
                        location: {
                            //Street: '',
                            //City: "'" + response.getReturnValue() + "'",
                            City: `\'${response.getReturnValue()}\'`,
                            //State: ''
                        },
                        //title: '',
                        //description: ''
                    }
                ]);
                component.set('v.zoomLevel', 16);
            } else if (state === "ERROR") {
                let error = response.getError();
                component.set("v.errorThrown", true);
                component.set("v.errorMessage", error[0].message);
            }
        });
        $A.enqueueAction(action);
    }
})