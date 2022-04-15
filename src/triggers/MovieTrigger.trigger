trigger MovieTrigger on MBMS_Movie__c (before insert, before delete, after update) {
    MovieTriggerHandler movieHandler = new MovieTriggerHandler();
    
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            movieHandler.onBeforeInsert(Trigger.New);
        }
        
        if (Trigger.isDelete) {
            movieHandler.onBeforeDelete(Trigger.Old);
        }
    }

    if (Trigger.isUpdate && Trigger.isAfter) {
        movieHandler.onAfterUpdate(Trigger.New);
    }
}