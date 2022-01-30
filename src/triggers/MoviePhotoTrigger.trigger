trigger MoviePhotoTrigger on MBMS_Movie_Photo__c (before insert) {
    MoviePhotoTriggerHandler moviePhotoHandler = new MoviePhotoTriggerHandler();
    
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            moviePhotoHandler.onBeforeInsert(Trigger.New);
        }
    }
}