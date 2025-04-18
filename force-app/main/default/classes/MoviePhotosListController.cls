public with sharing class MoviePhotosListController {
    public final static Integer MINIMUM_NUMBER_OF_PHOTOS = 4;
    
    @AuraEnabled
    public static List<MBMS_Movie_Photo__c> getPhotos() {
        return [
            SELECT
                Id,
                MBMS_Photo_URL__c
            FROM MBMS_Movie_Photo__c
        ];
    }
    
    @AuraEnabled
    public static List<MBMS_Movie_Photo__c> getLatestPhotos() {
        return [
            SELECT
                Id,
                Name,
                MBMS_Photo_URL__c,
                MBMS_Movie__r.MBMS_Title__c
            FROM MBMS_Movie_Photo__c
            ORDER BY CreatedDate DESC
            LIMIT :MINIMUM_NUMBER_OF_PHOTOS
        ];
    }
    
    public static List<MBMS_Movie_Photo__c> getRequiringActionPhotos() {
        return [
            SELECT
                Id,
                Name,
                MBMS_Status__c,
                CreatedDate
            FROM MBMS_Movie_Photo__c
            WHERE MBMS_Status__c
            IN (:Constants.STATUS_INITIAL, :Constants.STATUS_REJECTED)
            ORDER BY CreatedDate
        ];
    }
    
    @AuraEnabled
    public static Boolean arePhotosAvailable() { 
        return getLatestPhotos().size().equals(MINIMUM_NUMBER_OF_PHOTOS);
    }
    
    @AuraEnabled
    public static Integer getMinimumNumberOfPhotos() {
        return MINIMUM_NUMBER_OF_PHOTOS;
    }
}