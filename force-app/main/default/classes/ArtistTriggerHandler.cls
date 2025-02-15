public class ArtistTriggerHandler {
    public void onBeforeInsert(List<MBMS_Artist__c> artists) {
        ArtistTriggerUtility.updateArtistNames(artists);
        ArtistTriggerUtility.updateArtistStatusComments(artists);
    }
    
    public void onBeforeDelete(List<MBMS_Artist__c> artists) {
        ArtistTriggerUtility.removeRelatedMovieActors(artists);
    }

    public void onBeforeUpdate(List<MBMS_Artist__c> oldArtists, List<MBMS_Artist__c> newArtists) {
        ArtistTriggerUtility.updatePreviousStatus(oldArtists, newArtists);
        ArtistTriggerUtility.notifyApprovers(newArtists);
    }
}