public class MoviePhotoTriggerHandler {
    public void onBeforeInsert(List<MBMS_Movie_Photo__c> moviePhotos) {
        MoviePhotoTriggerUtility.updateMoviePhotoStatusComments(moviePhotos);
    }

    public void onBeforeUpdate(List<MBMS_Movie_Photo__c> oldMoviePhotos, List<MBMS_Movie_Photo__c> newMoviePhotos) {
        MoviePhotoTriggerUtility.updatePreviousStatus(oldMoviePhotos, newMoviePhotos);
        MoviePhotoTriggerUtility.notifyApprovers(newMoviePhotos);
    }
}