trigger ArtistTrigger on MBMS_Artist__c (before insert, before delete, before update) {
    ArtistTriggerHandler artistHandler = new ArtistTriggerHandler();
    
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            artistHandler.onBeforeInsert(Trigger.New);
        }

        if (Trigger.isDelete) {
            artistHandler.onBeforeDelete(Trigger.Old);
        }

        if (Trigger.isUpdate) {
            artistHandler.onBeforeUpdate(Trigger.Old, Trigger.New);
        }
    }
}