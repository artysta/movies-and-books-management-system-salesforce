@isTest
private class MoviesListControllerTest {
    @testSetup
    static void testDataSetup() {
        new MovieBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void shouldReturnEmptyListOfMovies() {
        Test.startTest();
        MBMS_Movie__c movie = [SELECT Id FROM MBMS_Movie__c LIMIT 1];
        delete movie;
        
        List<MBMS_Movie__c> moviesList = MoviesListController.getMoviesList();
        Test.stopTest();
        
        System.assertEquals(0, moviesList.size(), String.format(MBMS_Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'moviesList', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfBooks() {
        Test.startTest();
        List<MBMS_Movie__c> moviesList = MoviesListController.getMoviesList();
        Test.stopTest();
        
        System.assert(moviesList.size() > 0, String.format(MBMS_Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'moviesList', '0' }));
        System.assertNotEquals(null, moviesList[0], String.format(MBMS_Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL, new List<String> { 'moviesList' }));
    }
    
    @isTest
    static void shouldReturnEmptyListOfRequiringActionMovies() {
        Test.startTest();
        MBMS_Movie__c movie = [SELECT Id FROM MBMS_Movie__c LIMIT 1];
        movie.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_APPROVED;
        update movie;
        
        List<MBMS_Movie__c> moviesList = MoviesListController.getRequiringActionMovies();
        Test.stopTest();
        
        System.assertEquals(0, moviesList.size(), String.format(MBMS_Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'moviesList', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfRequiringActionMovies() {
        Test.startTest();
        List<MBMS_Movie__c> moviesFromDb = [SELECT Id FROM MBMS_Movie__c];
        
        for (MBMS_Movie__c movie : moviesFromDb) {
            movie.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_REJECTED;
        }
        
        update moviesFromDb;
        
        List<MBMS_Movie__c> moviesList = MoviesListController.getRequiringActionMovies();
        Test.stopTest();
        
        System.assert(moviesList.size() > 0, String.format(MBMS_Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'moviesList', '0' }));
        System.assertNotEquals(null, moviesList[0], String.format(MBMS_Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL, new List<String> { 'moviesList' }));
    }
    
    @isTest
    static void moviesShouldNotBeAvailable() {
        Test.startTest();
        MBMS_Movie__c movie = [SELECT Id FROM MBMS_Movie__c LIMIT 1];
        delete movie;
        
        Boolean areMoviesAvailable = MoviesListController.areMoviesAvailable();
        Test.stopTest();
        
        System.assert(!areMoviesAvailable, String.format(MBMS_Constants.VALUE_SHOULD_BE_FALSE, new List<String> { 'areMoviesAvailable' }));
    }
    
    @isTest
    static void moviesShouldBeAvailable() {
        Test.startTest();
        Boolean areMoviesAvailable = MoviesListController.areMoviesAvailable();
        Test.stopTest();
        
        System.assert(areMoviesAvailable, String.format(MBMS_Constants.VALUE_SHOULD_BE_TRUE, new List<String> { 'areMoviesAvailable' }));
    }
}