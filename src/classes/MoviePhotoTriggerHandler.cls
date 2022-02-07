public class MoviePhotoTriggerHandler {
    public void onBeforeInsert(List<MBMS_Movie_Photo__c> moviePhotos) {
        MoviePhotoTriggerUtility.updateMoviePhotoStatusComments(moviePhotos);
    }
}