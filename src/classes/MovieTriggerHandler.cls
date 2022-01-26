public class MovieTriggerHandler {
    public void onBeforeInsert(List<MBMS_Movie__c> movies) {
        for (MBMS_Movie__c movie : movies) {
            movie.Name = movie.MBMS_Title__c;
        }     
    }
    
    public void onBeforeDelete(List<MBMS_Movie__c> movies) {
        Set<Id> movieIds = (new Map<Id, MBMS_Movie__c>(movies)).keySet();
        List<MBMS_Movie_Actor__c> movieActors = [SELECT Id FROM MBMS_Movie_Actor__c WHERE MBMS_Movie__r.Id IN :movieIds];
        
        delete movieActors;
    }
}