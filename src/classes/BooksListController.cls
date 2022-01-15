public with sharing class BooksListController {
    @AuraEnabled
    public static List<MBMS_Book__c> getBooksList() {
        return [SELECT Id, Name, MBMS_Title__c
                FROM MBMS_Book__c];
    }
    
    public static List<MBMS_Book__c> getRequiringActionBooks() {
        return [SELECT Id, Name, MBMS_Status__c, CreatedDate
                FROM MBMS_Book__c
                WHERE MBMS_Status__c IN (:MBMS_Constants.MBMS_STATUS_INITIAL, :MBMS_Constants.MBMS_STATUS_REJECTED)
                ORDER BY CreatedDate];
    }
}