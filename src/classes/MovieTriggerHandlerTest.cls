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
        
        System.assertEquals(movie.MBMS_Title__c, movie.Name, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Name', movie.MBMS_Title__c }));
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
        
        System.assertEquals(0, movieActors.size(), String.format(MBMS_Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'movieActors', '0' }));
    }
    
    @isTest
    static void triggerShouldUpdateMovieStatusComment() {
        Test.startTest();
        MBMS_Movie__c movie = [SELECT MBMS_Status_Comment__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT, movie.MBMS_Status_Comment__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c', MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT }));
    }

    @isTest
    static void triggerShouldUpdateRecordOwner() {
        Test.startTest();
        MBMS_Movie__c movie = [SELECT OwnerId
                               FROM MBMS_Movie__c
                               LIMIT 1];
        movie.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_REJECTED;
        update movie;

        Group approversQueue = [SELECT Id
                                FROM Group WHERE Type = :MBMS_Constants.QUEUE_GROUP_TYPE
                                AND Name = :MBMS_Constants.APPROVERS_QUEUE
                                LIMIT 1];
        Test.stopTest();

        movie = [SELECT OwnerId
                 FROM MBMS_Movie__c
                 LIMIT 1];
        
        System.assertEquals(approversQueue.Id, movie.OwnerId, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'OwnerId', approversQueue.Id }));
    }
}