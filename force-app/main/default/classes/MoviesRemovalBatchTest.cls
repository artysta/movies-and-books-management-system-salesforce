@isTest
private class MoviesRemovalBatchTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new MovieBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    private static void shouldDeleteExistingMovies() {
        List<MBMS_Movie__c> movies = [
            SELECT
                Id
            FROM MBMS_Movie__c
        ];

        for (MBMS_Movie__c movie : movies) {
            Test.setCreatedDate(movie.Id, Constants.TEST_DATE_10_DAYS_BEFORE_TODAY);
            movie.MBMS_Status__c = Constants.STATUS_REJECTED;
        }
        
        update movies;
        
        Test.startTest();
        Database.executeBatch(new MoviesRemovalBatch());
        Test.stopTest();
        
        movies = [
            SELECT
                Id
            FROM MBMS_Movie__c
        ];

        System.assertEquals(0, movies.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'movies', '0' }));
    }
    
    @isTest
    private static void shouldDeleteExistingMoviesBulk() {
        removeExistingMovies();
        
        List<MBMS_Movie__c> movies = new List<MBMS_Movie__c>();
        MovieBuilder builder = new MovieBuilder();
        
        for (Integer i = 0; i < 200; i++) {
            movies.add(builder
                       .create()
                       .withStatus(Constants.STATUS_REJECTED)
                       .build());
        }
        
        insert movies;

        for (MBMS_Movie__c movie : movies) {
            Test.setCreatedDate(movie.Id, Constants.TEST_DATE_10_DAYS_BEFORE_TODAY);
        }
                
        Test.startTest();
        Database.executeBatch(new MoviesRemovalBatch());
        Test.stopTest();
        
        movies = [
            SELECT
                Id
            FROM MBMS_Movie__c
        ];
        
        System.assertEquals(0, movies.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'movies', '0' }));
    }
    
    @isTest
    private static void shouldNotDeleteExistingMovies() {
        List<MBMS_Movie__c> movies = [
            SELECT
                Id
            FROM MBMS_Movie__c
        ];
        
        Test.startTest();
        Database.executeBatch(new MoviesRemovalBatch());
        Test.stopTest();
        
        movies = [
            SELECT
                Id
            FROM MBMS_Movie__c
        ];

        System.assert(movies.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'movies', '0' }));
    }
    
    private static void removeExistingMovies() {
        delete [
            SELECT
                Id
            FROM MBMS_Movie__c
        ];
    }
}