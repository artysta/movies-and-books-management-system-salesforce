public class MovieActorTriggerHandler {
    public void onBeforeInsert(List<MBMS_Movie_Actor__c> movieActors) {
        MovieActorTriggerUtility.updateMovieActorNames(movieActors);
    }
}