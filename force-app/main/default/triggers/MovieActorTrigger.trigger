trigger MovieActorTrigger on MBMS_Movie_Actor__c (before insert) {
    MovieActorTriggerHandler movieActorTriggerHandler = new MovieActorTriggerHandler();

    if (Trigger.isInsert && Trigger.isBefore) {
        movieActorTriggerHandler.onBeforeInsert(Trigger.New);
    }
}