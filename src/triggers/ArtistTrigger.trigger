trigger ArtistTrigger on MBMS_Artist__c (before insert, before delete, after update) {
    ArtistTriggerHandler artistHandler = new ArtistTriggerHandler();
    
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            artistHandler.onBeforeInsert(Trigger.New);
        }
    }

    if (Trigger.isDelete) {
        artistHandler.onBeforeDelete(Trigger.Old);
    }

    if (Trigger.isUpdate && Trigger.isAfter) {
        artistHandler.onAfterUpdate(Trigger.New);
    }
}