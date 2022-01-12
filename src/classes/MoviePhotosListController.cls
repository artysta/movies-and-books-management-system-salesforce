public with sharing class MoviePhotosListController {
    private static Integer minimumNumberOfPhotos = 4;
    
    @AuraEnabled
    public static List<MBMS_Movie_Photo__c> getPhotos() {
        return [SELECT Id, MBMS_Photo_URL__c
                FROM MBMS_Movie_Photo__c];
    }
    
    @AuraEnabled
    public static List<MBMS_Movie_Photo__c> getLatestPhotos() {
        return [SELECT Id, Name, MBMS_Photo_URL__c, MBMS_Movie__r.MBMS_Title__c
                FROM MBMS_Movie_Photo__c
                ORDER BY CreatedDate
                LIMIT :minimumNumberOfPhotos];
    }
    
    @AuraEnabled
    public static Boolean arePhotosAvailable() { 
        return getLatestPhotos().size() == minimumNumberOfPhotos;
    }
    
    @AuraEnabled
    public static Integer getMinimumNumberOfPhotos() {
        return minimumNumberOfPhotos;
    }
}