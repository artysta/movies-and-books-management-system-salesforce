@isTest
private class MovieTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        new MovieBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void triggerShouldUpdateMovieName() {
        Test.startTest();
        MBMS_Movie__c movie = [SELECT Name, MBMS_Title__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(movie.MBMS_Title__c, movie.Name);
    }
    
    @isTest
    static void triggerShouldDeleteRelatedMovieActorAfterMovieDeletion() {
        Test.startTest();
        MBMS_Artist__c artist = [SELECT Id FROM MBMS_Artist__c LIMIT 1];
        MBMS_Movie__c movie = [SELECT Id FROM MBMS_Movie__c LIMIT 1];
        MBMS_Movie_Actor__c movieActor = new MovieActorBuilder()
            .create()
            .withCharacterName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withMovie(movie)
            .withActor(artist)
            .buildAndInsert();
        delete movie;
        Test.stopTest();
        
        List<MBMS_Movie_Actor__c> movieActors = [SELECT Id FROM MBMS_Movie_Actor__c LIMIT 1];
        
        System.assertEquals(0, movieActors.size());
    }
}