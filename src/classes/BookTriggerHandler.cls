public class BookTriggerHandler {
    public void onBeforeInsert(List<MBMS_Book__c> books) {
        for (MBMS_Book__c book : books) {
            book.Name = book.MBMS_Title__c;
        }
        
        for (MBMS_Book__c book : books) {
            book.MBMS_Status_Comment__c = MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT;
        }
    }
}