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
        
        System.assertEquals(0, moviesList.size());
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfBooks() {
        Test.startTest();
        List<MBMS_Movie__c> moviesList = MoviesListController.getMoviesList();
        Test.stopTest();
        
        System.assert(moviesList.size() > 0);
        System.assertNotEquals(null, moviesList[0]);
    }
    
    @isTest
    static void shouldReturnEmptyListOfRequiringActionMovies() {
        Test.startTest();
        MBMS_Movie__c movie = [SELECT Id FROM MBMS_Movie__c LIMIT 1];
        movie.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_APPROVED;
        update movie;
        
        List<MBMS_Movie__c> moviesList = MoviesListController.getRequiringActionMovies();
        Test.stopTest();
        
        System.assertEquals(0, moviesList.size());
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
        
        System.assert(moviesList.size() > 0);
        System.assertNotEquals(null, moviesList[0]);
    }
}