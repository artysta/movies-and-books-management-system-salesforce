public with sharing class BookNewsController {
    @AuraEnabled(cacheable=true)
    public static MBMS_Book_News__c getLatestBookNews() {
        return [SELECT MBMS_Title__c, MBMS_Content__c, MBMS_Tags__c, MBMS_Image_URL__c, CreatedDate
                FROM MBMS_Book_News__c
                ORDER BY CreatedDate DESC
                LIMIT 1];
    }
}