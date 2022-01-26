public with sharing class MovieActorsListController {
    @AuraEnabled
    public static List<MBMS_Movie_Actor__c> getMovieActors() {
        return [SELECT Id, Name, MBMS_Character_Name__c, MBMS_Movie__r.Name
                FROM MBMS_Movie_Actor__c];
    }

    @AuraEnabled
    public static Boolean areMovieActorsAvailable() { 
        return getMovieActors().size() > 0 ;
    }
}