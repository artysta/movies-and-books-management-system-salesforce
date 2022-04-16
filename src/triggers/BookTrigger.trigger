trigger BookTrigger on MBMS_Book__c (before insert, before update) {
    BookTriggerHandler bookHandler = new BookTriggerHandler();

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            bookHandler.onBeforeInsert(Trigger.New);
        }

        if (Trigger.isUpdate) {
            bookHandler.onBeforeUpdate(Trigger.New);
        }
    }
}