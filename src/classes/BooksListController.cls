public with sharing class BooksListController {
    @AuraEnabled
    public static List<MBMS_Book__c> getBooksList() {
        return [SELECT Id, Name, MBMS_Title__c
                FROM MBMS_Book__c];
    }
}