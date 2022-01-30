@isTest
private class ArtistTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void triggerShouldUpdateArtistName() {
        Test.startTest();
        MBMS_Artist__c artist = [SELECT Name, MBMS_First_Name__c, MBMS_Last_Name__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        String expectedName = String.format('{0} {1}', new List<String> { artist.MBMS_First_Name__c, artist.MBMS_Last_Name__c });
        
        System.assertEquals(expectedName, artist.Name);
    }
    
    @isTest
    static void triggerShouldDeleteRelatedMovieActorAfterArtistDeletion() {
        Test.startTest();
        MBMS_Artist__c artist = [SELECT Id FROM MBMS_Artist__c LIMIT 1];
        MBMS_Movie__c movie = new MovieBuilder().create().buildAndInsert();
        MBMS_Movie_Actor__c movieActor = new MovieActorBuilder()
            .create()
            .withCharacterName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withMovie(movie)
            .withActor(artist)
            .buildAndInsert();
        delete artist;
        Test.stopTest();
        
        List<MBMS_Movie_Actor__c> movieActors = [SELECT Id FROM MBMS_Movie_Actor__c LIMIT 1];
        
        System.assertEquals(0, movieActors.size());
    }
    
    @isTest
    static void triggerShouldUpdateArtistStatusComment() {
        Test.startTest();
        MBMS_Artist__c artist = [SELECT MBMS_Status_Comment__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
                
        System.assertEquals(MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT, artist.MBMS_Status_Comment__c);
    }
}