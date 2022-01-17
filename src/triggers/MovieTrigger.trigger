trigger MovieTrigger on MBMS_Movie__c (before insert) {
    MovieTriggerHandler movieHandler = new MovieTriggerHandler();

    if (Trigger.isInsert && Trigger.isBefore) {
        movieHandler.onBeforeInsert(Trigger.New);
    }
}