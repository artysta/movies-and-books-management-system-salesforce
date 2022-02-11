public with sharing class ArtistNewsController {
    @AuraEnabled(cacheable=true)
    public static MBMS_Artist_News__c getLatestArtistNews() {
        return [SELECT MBMS_Title__c, MBMS_Content__c, MBMS_Tags__c, MBMS_Image_URL__c, CreatedDate
                FROM MBMS_Artist_News__c
                ORDER BY CreatedDate DESC
                LIMIT 1];
    }
}