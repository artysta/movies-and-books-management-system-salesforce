trigger BookTrigger on MBMS_Book__c (before insert, after update) {
    BookTriggerHandler bookHandler = new BookTriggerHandler();

    if (Trigger.isInsert && Trigger.isBefore) {
        bookHandler.onBeforeInsert(Trigger.New);
    }

    if (Trigger.isUpdate && Trigger.isAfter) {
        bookHandler.onAfterUpdate(Trigger.New);
    }
}