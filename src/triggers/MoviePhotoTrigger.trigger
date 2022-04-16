trigger MoviePhotoTrigger on MBMS_Movie_Photo__c (before insert, before update) {
    MoviePhotoTriggerHandler moviePhotoHandler = new MoviePhotoTriggerHandler();
    
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            moviePhotoHandler.onBeforeInsert(Trigger.New);
        }

        if (Trigger.isUpdate) {
            moviePhotoHandler.onBeforeUpdate(Trigger.New);
        }
    }
}