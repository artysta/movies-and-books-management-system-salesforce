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
        
        System.assertEquals(expectedName, artist.Name, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> {'Name', expectedName }));
    }
    
    @isTest
    static void triggerShouldDeleteRelatedMovieActorAfterArtistDeletion() {
        MBMS_Artist__c artist = [SELECT Id FROM MBMS_Artist__c LIMIT 1];
        MBMS_Movie__c movie = new MovieBuilder().create().buildAndInsert();
        MBMS_Movie_Actor__c movieActor = new MovieActorBuilder()
            .create()
            .withCharacterName(Constants.TEST_STRING_VALUE)
            .withMovie(movie)
            .withActor(artist)
            .buildAndInsert();

        Test.startTest();
        delete artist;
        Test.stopTest();
        
        List<MBMS_Movie_Actor__c> movieActors = [SELECT Id FROM MBMS_Movie_Actor__c LIMIT 1];
        
        System.assertEquals(0, movieActors.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'movieActors', '0' }));
    }
    
    @isTest
    static void triggerShouldUpdateArtistStatusComment() {
        MBMS_Artist__c artist = [SELECT MBMS_Status_Comment__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
                
        System.assertEquals(Constants.INITIAL_STATUS_COMMENT, artist.MBMS_Status_Comment__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c' }));
    }

    @isTest
    static void triggerShouldUpdateRecordOwner() {
        MBMS_Artist__c artist = [SELECT OwnerId
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        artist.MBMS_Status__c = Constants.STATUS_REJECTED;

        Test.startTest();
        update artist;
        Test.stopTest();

        Group approversQueue = SObjectsSelector.getApproversQueue();

        artist = [SELECT OwnerId
                  FROM MBMS_Artist__c
                  LIMIT 1];
        
        System.assertEquals(approversQueue.Id, artist.OwnerId, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'OwnerId', approversQueue.Id }));
    }

    @isTest
    static void triggerShouldUpdatePreviousStatus() {
        MBMS_Artist__c artist = [SELECT MBMS_Status__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        String expectedPreviousStatus = artist.MBMS_Status__c;
        artist.MBMS_Status__c = Constants.STATUS_REJECTED;

        Test.startTest();
        update artist;
        Test.stopTest();

        artist = [SELECT MBMS_Previous_Status__c
                  FROM MBMS_Artist__c
                  LIMIT 1];
        
        System.assertEquals(expectedPreviousStatus, artist.MBMS_Previous_Status__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Previous_Status__c', expectedPreviousStatus }));
    }
}