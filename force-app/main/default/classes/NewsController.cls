public with sharing class NewsController {
    @AuraEnabled
    public static List<sObject> getNews() {
        List<sObject> result = new List<sObject>();
        
        result.addAll([
            SELECT
                Id,
                MBMS_Title__c,
                MBMS_Artist__c
            FROM MBMS_Artist_News__c
        ]);

        result.addAll([
            SELECT
                Id,
                MBMS_Title__c,
                MBMS_Book__c
            FROM MBMS_Book_News__c
        ]);

        result.addAll([
            SELECT
                Id,
                MBMS_Title__c,
                MBMS_Movie__c
            FROM MBMS_Movie_News__c
        ]);

        return result;
    }
    
    @AuraEnabled
    public static Boolean areNewsAvailable() { 
        return getNews().size() > 0;
    }
}