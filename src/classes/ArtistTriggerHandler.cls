public class ArtistTriggerHandler {
    public void onBeforeInsert(List<MBMS_Artist__c> artists) {
        for (MBMS_Artist__c artist : artists) {
            artist.Name = String.format('{0} {1}', new List<String> { artist.MBMS_First_Name__c, artist.MBMS_Last_Name__c });
        }   
    }
}