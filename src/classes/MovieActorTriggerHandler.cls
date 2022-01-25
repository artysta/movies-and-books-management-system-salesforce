public class MovieActorTriggerHandler {
    public void onBeforeInsert(List<MBMS_Movie_Actor__c> movieActors) {
        List<Id> actorsIds = new List<Id>();
        
        for (MBMS_Movie_Actor__c movieActor : movieActors) {
            actorsIds.add(movieActor.MBMS_Artist__c);
        }
        
        List<MBMS_Artist__c> actors = [SELECT Name FROM MBMS_Artist__c WHERE Id IN :actorsIds];
        
        for (Integer i = 0; i < movieActors.size(); i++) {
            movieActors[i].Name = String.format('{0} as {1}', new List<String> { actors[i].Name, movieActors[i].MBMS_Character_Name__c });
        }
    }
}