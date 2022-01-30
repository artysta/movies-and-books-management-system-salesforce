public class MoviePhotoTriggerHandler {
    public void onBeforeInsert(List<MBMS_Movie_Photo__c> moviePhotos) {
        for (MBMS_Movie_Photo__c moviePhoto : moviePhotos) {
            moviePhoto.MBMS_Status_Comment__c = MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT;
        }
    }
}