trigger ArtistTrigger on MBMS_Artist__c (before insert) {
    ArtistTriggerHandler artistHandler = new ArtistTriggerHandler();
    
    if (Trigger.isInsert && Trigger.isBefore) {
        artistHandler.onBeforeInsert(Trigger.New);
    }
}