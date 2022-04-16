trigger MovieTrigger on MBMS_Movie__c (before insert, before delete, before update) {
    MovieTriggerHandler movieHandler = new MovieTriggerHandler();
    
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            movieHandler.onBeforeInsert(Trigger.New);
        }
        
        if (Trigger.isDelete) {
            movieHandler.onBeforeDelete(Trigger.Old);
        }

        if (Trigger.isUpdate) {
            movieHandler.onBeforeUpdate(Trigger.New);
        }
    }
}