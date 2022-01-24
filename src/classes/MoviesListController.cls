public with sharing class MoviesListController {
    @AuraEnabled
    public static List<MBMS_Movie__c> getMoviesList() {
        return [SELECT Id, Name, MBMS_Title__c,
                MBMS_Director__c, MBMS_Writer__c
                FROM MBMS_Movie__c];
    }
    
    public static List<MBMS_Movie__c> getRequiringActionMovies() {
        return [SELECT Id, Name, MBMS_Status__c, CreatedDate
                FROM MBMS_Movie__c
                WHERE MBMS_Status__c IN (:MBMS_Constants.MBMS_STATUS_INITIAL, :MBMS_Constants.MBMS_STATUS_REJECTED)
                ORDER BY CreatedDate];
    }
    
    @AuraEnabled
    public static Boolean areMoviesAvailable() { 
        return getMoviesList().size() > 0 ;
    }
}