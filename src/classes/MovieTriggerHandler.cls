public class MovieTriggerHandler {
    public void onBeforeInsert(List<MBMS_Movie__c> movies) {
        for (MBMS_Movie__c movie : movies) {
            movie.Name = movie.MBMS_Title__c;
        }     
    }
}