public class BookTriggerHandler {
    public void onBeforeInsert(List<MBMS_Book__c> books) {
        BookTriggerUtility.updateBookNames(books);
        BookTriggerUtility.updateBookStatusComments(books);
    }

    public void onBeforeUpdate(List<MBMS_Book__c> oldBooks, List<MBMS_Book__c> newBooks) {
        BookTriggerUtility.updatePreviousStatus(oldBooks, newBooks);
        BookTriggerUtility.notifyApprovers(newBooks);
    }
}