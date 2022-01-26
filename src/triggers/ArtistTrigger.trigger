trigger ArtistTrigger on MBMS_Artist__c (before insert, before delete) {
    ArtistTriggerHandler artistHandler = new ArtistTriggerHandler();
    
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            artistHandler.onBeforeInsert(Trigger.New);
        }
        
        if (Trigger.isDelete) {
            artistHandler.onBeforeDelete(Trigger.Old);
        }
    }
}