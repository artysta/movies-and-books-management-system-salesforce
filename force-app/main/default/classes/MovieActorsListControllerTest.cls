@isTest
private class MovieActorsListControllerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new MovieActorBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void shouldReturnEmptyListOfMovieActors() {
        MBMS_Movie_Actor__c movieActor = [
            SELECT
                Id
            FROM MBMS_Movie_Actor__c
            LIMIT 1
        ];
        
        delete movieActor;
        
        Test.startTest();
        List<MBMS_Movie_Actor__c> movieActors = MovieActorsListController.getMovieActors();
        Test.stopTest();
        
        System.assertEquals(0, movieActors.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'movieActors', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfMovieActors() {
        Test.startTest();
        List<MBMS_Movie_Actor__c> movieActors = MovieActorsListController.getMovieActors();
        Test.stopTest();
        
        System.assert(movieActors.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'movieActors', '0' }));
        System.assertNotEquals(null, movieActors[0], String.format(Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL, new List<String> { 'movieActors' }));
    }
    
    @isTest
    static void artistsShouldNotBeAvailable() {
        MBMS_Movie_Actor__c movieActor = [
            SELECT
                Id
            FROM MBMS_Movie_Actor__c
            LIMIT 1
        ];
        
        delete movieActor;
        
        Test.startTest();
        Boolean areMovieActorsAvailable = MovieActorsListController.areMovieActorsAvailable();
        Test.stopTest();
        
        System.assert(!areMovieActorsAvailable, String.format(Constants.VALUE_SHOULD_BE_FALSE, new List<String> { 'areMovieActorsAvailable' }));
    }
    
    @isTest
    static void artistsShouldBeAvailable() {
        Test.startTest();
        Boolean areMovieActorsAvailable = MovieActorsListController.areMovieActorsAvailable();
        Test.stopTest();
        
        System.assert(areMovieActorsAvailable, String.format(Constants.VALUE_SHOULD_BE_TRUE, new List<String> { 'areMovieActorsAvailable' }));
    }
}