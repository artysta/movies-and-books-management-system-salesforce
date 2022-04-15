public class ArtistTriggerHandler {
    public void onBeforeInsert(List<MBMS_Artist__c> artists) {
        ArtistTriggerUtility.updateArtistNames(artists);
        ArtistTriggerUtility.updateArtistStatusComments(artists);
    }
    
    public void onBeforeDelete(List<MBMS_Artist__c> artists) {
        ArtistTriggerUtility.removeRelatedMovieActors(artists);
    }

    public void onAfterUpdate(List<MBMS_Artist__c> artists) {
        ArtistTriggerUtility.notifyApprovers(artists);
    }
}