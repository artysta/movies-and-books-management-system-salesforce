@isTest
private class MoviesRemovalBatchTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Movie__c movie = new MovieBuilder().buildWithAllFieldsAndInsert();
    }
    
    @isTest
    private static void shouldDeleteExistingMovies() {
        List<MBMS_Movie__c> movies = [SELECT Id FROM MBMS_Movie__c];

        for (MBMS_Movie__c movie : movies) {
            Test.setCreatedDate(movie.Id, MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY);
            movie.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_REJECTED;
        }
        
        update movies;
        
        Test.startTest();
        MoviesRemovalBatch removalBatch = new MoviesRemovalBatch();
        Database.executeBatch(removalBatch);
        Test.stopTest();
        
        movies = [SELECT Id FROM MBMS_Movie__c];
        System.assertEquals(0, movies.size());
    }
    
    @isTest
    private static void shouldDeleteExistingMoviesBulk() {
        removeExistingMovies();
        
        List<MBMS_Movie__c> movies = new List<MBMS_Movie__c>();
        MovieBuilder builder = new MovieBuilder();
        
        for (Integer i = 0; i < 200; i++) {
            movies.add(builder
                       .createNewRecord()
                       .withStatus(MBMS_Constants.MBMS_STATUS_REJECTED)
                       .build());
        }
        
        insert movies;

        for (MBMS_Movie__c movie : movies) {
            Test.setCreatedDate(movie.Id, MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY);
        }
                
        Test.startTest();
        MoviesRemovalBatch removalBatch = new MoviesRemovalBatch();
        Database.executeBatch(removalBatch);
        Test.stopTest();
        
        movies = [SELECT Id FROM MBMS_Movie__c];
        
        System.assertEquals(0, movies.size());
    }
    
    @isTest
    private static void shouldNotDeleteExistingMovies() {
        List<MBMS_Movie__c> movies = [SELECT Id FROM MBMS_Movie__c];
        
        Test.startTest();
        MoviesRemovalBatch removalBatch = new MoviesRemovalBatch();
        Database.executeBatch(removalBatch);
        Test.stopTest();
        
        movies = [SELECT Id FROM MBMS_Movie__c];
        System.assert(movies.size() > 0);
    }
    
    private static void removeExistingMovies() {
        delete [SELECT Id FROM MBMS_Movie__c];
    }
}