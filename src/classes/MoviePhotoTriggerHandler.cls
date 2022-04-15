public class MoviePhotoTriggerHandler {
    public void onBeforeInsert(List<MBMS_Movie_Photo__c> moviePhotos) {
        MoviePhotoTriggerUtility.updateMoviePhotoStatusComments(moviePhotos);
    }

    public void onAfterUpdate(List<MBMS_Movie_Photo__c> moviePhotos) {
        MoviePhotoTriggerUtility.notifyApprovers(moviePhotos);
    }
}