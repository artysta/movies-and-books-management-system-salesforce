trigger BookTrigger on MBMS_Book__c (before insert) {
    for (MBMS_Book__c book : Trigger.New) {
        book.Name = book.MBMS_Title__c;
    }   
}