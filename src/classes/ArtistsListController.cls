public with sharing class ArtistsListController {
    @AuraEnabled
    public static List<MBMS_Artist__c> getArtistsList() {
        return [SELECT Id, Name, MBMS_Birthplace__c,
                MBMS_Date_of_Birth__c, MBMS_Date_of_Death__c
                FROM MBMS_Artist__c];
    }
}