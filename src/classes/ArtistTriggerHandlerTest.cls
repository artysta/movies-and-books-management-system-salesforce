@isTest
private class ArtistTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void triggerShouldUpdateArtistName() {
        MBMS_Artist__c artist = [SELECT Name, MBMS_First_Name__c, MBMS_Last_Name__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        
        String expectedName = String.format('{0} {1}', new List<String> { artist.MBMS_First_Name__c, artist.MBMS_Last_Name__c });
        
        System.assertEquals(expectedName, artist.Name, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> {'Name', expectedName }));
    }
    
    @isTest
    static void triggerShouldDeleteRelatedMovieActorAfterArtistDeletion() {
        MBMS_Artist__c artist = [SELECT Id FROM MBMS_Artist__c LIMIT 1];
        MBMS_Movie__c movie = new MovieBuilder().create().buildAndInsert();
        MBMS_Movie_Actor__c movieActor = new MovieActorBuilder()
            .create()
            .withCharacterName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withMovie(movie)
            .withActor(artist)
            .buildAndInsert();

        Test.startTest();
        delete artist;
        Test.stopTest();
        
        List<MBMS_Movie_Actor__c> movieActors = [SELECT Id FROM MBMS_Movie_Actor__c LIMIT 1];
        
        System.assertEquals(0, movieActors.size(), String.format(MBMS_Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'movieActors', '0' }));
    }
    
    @isTest
    static void triggerShouldUpdateArtistStatusComment() {
        MBMS_Artist__c artist = [SELECT MBMS_Status_Comment__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
                
        System.assertEquals(MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT, artist.MBMS_Status_Comment__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c' }));
    }

    @isTest
    static void triggerShouldUpdateRecordOwner() {
        MBMS_Artist__c artist = [SELECT OwnerId
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        artist.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_REJECTED;

        Test.startTest();
        update artist;
        Test.stopTest();

        Group approversQueue = [SELECT Id
                                FROM Group WHERE Type = :MBMS_Constants.QUEUE_GROUP_TYPE
                                AND Name = :MBMS_Constants.APPROVERS_QUEUE
                                LIMIT 1];

        artist = [SELECT OwnerId
                  FROM MBMS_Artist__c
                  LIMIT 1];
        
        System.assertEquals(approversQueue.Id, artist.OwnerId, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'OwnerId', approversQueue.Id }));
    }
}