@isTest
public class MovieNewsControllerTest {
    @testSetup
    static void testDataSetup() {
        new MovieNewsBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void shouldThrowException() {
        Test.startTest();
        MBMS_Movie_News__c movieNews = [SELECT Id FROM MBMS_Movie_News__c LIMIT 1];
        delete movieNews;
        
        Integer exceptionsCount = 0;
        
        try {
            movieNews = MovieNewsController.getLatestMovieNews();
        } catch (Exception e) {
            exceptionsCount++;
            System.assertNotEquals(null, e);
            System.assertEquals('List has no rows for assignment to SObject', e.getMessage());
        }
        Test.stopTest();
        
        System.assert(exceptionsCount > 0);
    }
    
    @isTest
    static void shouldReturnMovieNews() {
        Test.startTest();
        MBMS_Movie_News__c movieNews = MovieNewsController.getLatestMovieNews();
        Test.stopTest();
        
        System.assertNotEquals(null, movieNews);
    }
    
    @isTest
    static void shouldReturnMovieNewsByMovieId() {
        Test.startTest();
        MBMS_Movie__c movie = [SELECT Id FROM MBMS_Movie__c LIMIT 1];
        MBMS_Movie_News__c movieNews = MovieNewsController.getLatestMovieNewsByMovieId(movie.Id);
        Test.stopTest();
        
        System.assertNotEquals(null, movieNews);
    }
}