@isTest
private class MovieTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new MovieBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void triggerShouldUpdateMovieName() {
        MBMS_Movie__c movie = [SELECT Name, MBMS_Title__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        
        System.assertEquals(movie.MBMS_Title__c, movie.Name, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Name', movie.MBMS_Title__c }));
    }
    
    @isTest
    static void triggerShouldDeleteRelatedMovieActorAfterMovieDeletion() {
        MBMS_Artist__c artist = [SELECT Id FROM MBMS_Artist__c LIMIT 1];
        MBMS_Movie__c movie = [SELECT Id FROM MBMS_Movie__c LIMIT 1];
        MBMS_Movie_Actor__c movieActor = new MovieActorBuilder()
            .create()
            .withCharacterName(Constants.TEST_STRING_VALUE)
            .withMovie(movie)
            .withActor(artist)
            .buildAndInsert();

        Test.startTest();
        delete movie;
        Test.stopTest();
        
        List<MBMS_Movie_Actor__c> movieActors = [SELECT Id FROM MBMS_Movie_Actor__c LIMIT 1];
        
        System.assertEquals(0, movieActors.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'movieActors', '0' }));
    }
    
    @isTest
    static void triggerShouldUpdateMovieStatusComment() {
        MBMS_Movie__c movie = [SELECT MBMS_Status_Comment__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        
        System.assertEquals(Constants.INITIAL_STATUS_COMMENT, movie.MBMS_Status_Comment__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c', Constants.INITIAL_STATUS_COMMENT }));
    }

    @isTest
    static void triggerShouldUpdateRecordOwner() {
        MBMS_Movie__c movie = [SELECT OwnerId
                               FROM MBMS_Movie__c
                               LIMIT 1];
        movie.MBMS_Status__c = Constants.STATUS_REJECTED;

        Test.startTest();
        update movie;
        Test.stopTest();

        Group approversQueue = [SELECT Id
                                FROM Group WHERE Type = :Constants.QUEUE_GROUP_TYPE
                                AND Name = :Constants.APPROVERS_QUEUE
                                LIMIT 1];

        movie = [SELECT OwnerId
                 FROM MBMS_Movie__c
                 LIMIT 1];
        
        System.assertEquals(approversQueue.Id, movie.OwnerId, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'OwnerId', approversQueue.Id }));
    }
}