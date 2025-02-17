public with sharing class ArtistsListController {
    @AuraEnabled
    public static List<MBMS_Artist__c> getArtistsList() {
        return [SELECT Id, Name, MBMS_Birthplace__c,
                MBMS_Date_of_Birth__c, MBMS_Date_of_Death__c
                FROM MBMS_Artist__c];
    }
    
    public static List<MBMS_Artist__c> getRequiringActionArtists() {
        return [SELECT Id, Name, MBMS_Status__c, CreatedDate
                FROM MBMS_Artist__c
                WHERE MBMS_Status__c IN (:Constants.STATUS_INITIAL, :Constants.STATUS_REJECTED)
                ORDER BY CreatedDate];
    }
    
    @AuraEnabled
    public static Boolean areArtistsAvailable() { 
        return getArtistsList().size() > 0;
    }
}