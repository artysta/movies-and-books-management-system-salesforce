public class BookTriggerHandler {
    public void onBeforeInsert(List<MBMS_Book__c> books) {
        for (MBMS_Book__c book : books) {
            book.Name = book.MBMS_Title__c;
        }
    }
}