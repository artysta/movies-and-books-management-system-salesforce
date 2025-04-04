@isTest
public class ArtistNewsControllerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new ArtistNewsBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void shouldThrowException() {
        MBMS_Artist_News__c artistNews = [
            SELECT
                Id
            FROM MBMS_Artist_News__c
            LIMIT 1
        ];
        
        delete artistNews;
        
        Integer exceptionsCount = 0;
        
        Test.startTest();
        try {
            artistNews = ArtistNewsController.getLatestArtistNews();
        } catch (Exception e) {
            exceptionsCount++;
            System.assertNotEquals(null, e, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'Exception' }));
            System.assertEquals(Constants.NO_ROWS_FOR_ASSIGMENT, e.getMessage(), String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { Constants.NO_ROWS_FOR_ASSIGMENT }));
        }
        Test.stopTest();
        
        System.assert(exceptionsCount > 0, String.format(Constants.VALUE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'exceptionsCount', '0' }));
    }
    
    @isTest
    static void shouldReturnArtistNews() {
        Test.startTest();
        MBMS_Artist_News__c artistNews = ArtistNewsController.getLatestArtistNews();
        Test.stopTest();
        
        System.assertNotEquals(null, artistNews, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist_News__c' }));
    }
    
    @isTest
    static void shouldReturnArtistNewsByArtistId() {
        MBMS_Artist__c artist = [
            SELECT
                Id
            FROM MBMS_Artist__c
            LIMIT 1
        ];

        Test.startTest();
        MBMS_Artist_News__c artistNews = ArtistNewsController.getLatestArtistNewsByArtistId(artist.Id);
        Test.stopTest();
        
        System.assertNotEquals(null, artistNews, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist_News__c' }));
    }
}