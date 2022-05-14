public class LocationMapController {
    @AuraEnabled
    public static String getMainFilmingLocationByMovieId(Id movieId) {
        return [SELECT MBMS_Main_Filming_Location__c FROM MBMS_Movie__c WHERE Id = :movieId].MBMS_Main_Filming_Location__c;
    }
}