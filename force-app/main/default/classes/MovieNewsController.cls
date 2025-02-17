public with sharing class MovieNewsController {
    @AuraEnabled(cacheable=true)
    public static MBMS_Movie_News__c getLatestMovieNews() {
        return [SELECT MBMS_Title__c, MBMS_Content__c, MBMS_Tags__c, MBMS_Image_URL__c, CreatedDate
                FROM MBMS_Movie_News__c
                ORDER BY CreatedDate DESC
                LIMIT 1];
    }
    
    @AuraEnabled(cacheable=true)
    public static MBMS_Movie_News__c getLatestMovieNewsByMovieId(String movieId) {
        return [SELECT MBMS_Title__c, MBMS_Content__c, MBMS_Tags__c, MBMS_Image_URL__c, CreatedDate, MBMS_Movie__r.Name
                FROM MBMS_Movie_News__c
                WHERE MBMS_Movie__c = :movieId
                ORDER BY CreatedDate DESC
                LIMIT 1];
    }
}