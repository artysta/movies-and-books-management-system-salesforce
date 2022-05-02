@isTest
public class MovieNewsControllerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new MovieNewsBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void shouldThrowException() {
        MBMS_Movie_News__c movieNews = [SELECT Id FROM MBMS_Movie_News__c LIMIT 1];
        delete movieNews;
        
        Integer exceptionsCount = 0;
        
        Test.startTest();
        try {
            movieNews = MovieNewsController.getLatestMovieNews();
        } catch (Exception e) {
            exceptionsCount++;
            System.assertNotEquals(null, e, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'Exception' }));
            System.assertEquals('List has no rows for assignment to SObject', e.getMessage(), MBMS_Constants.NO_ROWS_FOR_ASSIGMENT);
        }
        Test.stopTest();
        
        System.assert(exceptionsCount > 0, String.format(MBMS_Constants.VALUE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'exceptionsCount', '0' }));
    }
    
    @isTest
    static void shouldReturnMovieNews() {
        Test.startTest();
        MBMS_Movie_News__c movieNews = MovieNewsController.getLatestMovieNews();
        Test.stopTest();
        
        System.assertNotEquals(null, movieNews, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Movie_News__c' }));
    }
    
    @isTest
    static void shouldReturnMovieNewsByMovieId() {
        MBMS_Movie__c movie = [SELECT Id FROM MBMS_Movie__c LIMIT 1];

        Test.startTest();
        MBMS_Movie_News__c movieNews = MovieNewsController.getLatestMovieNewsByMovieId(movie.Id);
        Test.stopTest();
        
        System.assertNotEquals(null, movieNews, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Movie_News__c' }));
    }
}