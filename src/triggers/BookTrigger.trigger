trigger BookTrigger on MBMS_Book__c (before insert) {
    BookTriggerHandler bookHandler = new BookTriggerHandler();

    if (Trigger.isInsert && Trigger.isBefore) {
        bookHandler.onBeforeInsert(Trigger.New);
    }
}