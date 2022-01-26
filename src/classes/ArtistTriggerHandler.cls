public class ArtistTriggerHandler {
    public void onBeforeInsert(List<MBMS_Artist__c> artists) {
        for (MBMS_Artist__c artist : artists) {
            artist.Name = String.format('{0} {1}', new List<String> { artist.MBMS_First_Name__c, artist.MBMS_Last_Name__c });
        }   
    }
    
    public void onBeforeDelete(List<MBMS_Artist__c> artists) {
        Set<Id> artistIds = (new Map<Id, MBMS_Artist__c>(artists)).keySet();
        List<MBMS_Movie_Actor__c> movieActors = [SELECT Id FROM MBMS_Movie_Actor__c WHERE MBMS_Artist__r.Id IN :artistIds];
        
        delete movieActors;
    }
}