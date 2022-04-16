public class MovieTriggerHandler {
    public void onBeforeInsert(List<MBMS_Movie__c> movies) {
        MovieTriggerUtility.updateMovieNames(movies);
        MovieTriggerUtility.updateMovieStatusComments(movies);
    }
    
    public void onBeforeDelete(List<MBMS_Movie__c> movies) {
        Set<Id> movieIds = (new Map<Id, MBMS_Movie__c>(movies)).keySet();
        List<MBMS_Movie_Actor__c> movieActors = [SELECT Id FROM MBMS_Movie_Actor__c WHERE MBMS_Movie__r.Id IN :movieIds];
        
        delete movieActors;
    }

    public void onBeforeUpdate(List<MBMS_Movie__c> movies) {
        MovieTriggerUtility.notifyApprovers(movies);
    }
}