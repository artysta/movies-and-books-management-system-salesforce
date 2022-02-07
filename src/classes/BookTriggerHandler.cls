public class BookTriggerHandler {
    public void onBeforeInsert(List<MBMS_Book__c> books) {
        BookTriggerUtility.updateBookNames(books);
        BookTriggerUtility.updateBookStatusComments(books);
    }
}