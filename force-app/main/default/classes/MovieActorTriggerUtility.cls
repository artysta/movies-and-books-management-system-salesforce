public class MovieActorTriggerUtility {
    public static void updateMovieActorNames(List<MBMS_Movie_Actor__c> movieActors) {
        Map<Id, MBMS_Artist__c> artists = new Map<Id, MBMS_Artist__c>();
        
        for (MBMS_Movie_Actor__c movieActor : movieActors) {
            artists.put(movieActor.MBMS_Artist__c, null);
        }
        
        artists.putAll([SELECT Name FROM MBMS_Artist__c WHERE Id = :artists.keySet()]);
        
        for (MBMS_Movie_Actor__c movieActor: movieActors) {
            MBMS_Artist__c artist = artists.get(movieActor.MBMS_Artist__c);
            
            String characterNames = movieActor.MBMS_Character_Name__c.replace(';', ', ');
            
            if (artist != null) {
                movieActor.Name = String.format('{0} as {1}', new List<String> { artist.Name, characterNames });
            }
        }
    }
}