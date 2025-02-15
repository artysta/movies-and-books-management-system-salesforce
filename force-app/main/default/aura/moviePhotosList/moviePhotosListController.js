({
    getLatestPhotosFunction: function (component, event, helper) {
        var action = component.get("c.getLatestPhotos");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.photos", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    arePhotosAvailableFunction: function (component, event, helper) {
        var action = component.get("c.arePhotosAvailable");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.photosAvailable", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    getMinimumNumberOfPhotosFunction: function (component, event, helper) {
        var action = component.get("c.getMinimumNumberOfPhotos");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.minimumNumberOfPhotos", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})