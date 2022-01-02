public with sharing class MoviesListController {
    @AuraEnabled
    public static List<MBMS_Movie__c> getMoviesList() {
        return [SELECT Id, Name, MBMS_Title__c,
                MBMS_Director__c, MBMS_Writer__c
                FROM MBMS_Movie__c];
    }
}