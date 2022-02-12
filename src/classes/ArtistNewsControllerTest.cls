@isTest
public class ArtistNewsControllerTest {
    @testSetup
    static void testDataSetup() {
        new ArtistNewsBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void shouldThrowException() {
        Test.startTest();
        MBMS_Artist_News__c artistNews = [SELECT Id FROM MBMS_Artist_News__c LIMIT 1];
        delete artistNews;
        
        Integer exceptionsCount = 0;
        
        try {
            artistNews = ArtistNewsController.getLatestArtistNews();
        } catch (Exception e) {
            exceptionsCount++;
            System.assertNotEquals(null, e);
            System.assertEquals('List has no rows for assignment to SObject', e.getMessage());
        }
        Test.stopTest();
        
        System.assert(exceptionsCount > 0);
    }
    
    @isTest
    static void shouldReturnArtistNews() {
        Test.startTest();
        MBMS_Artist_News__c artistNews = ArtistNewsController.getLatestArtistNews();
        Test.stopTest();
        
        System.assertNotEquals(null, artistNews);
    }
    
    @isTest
    static void shouldReturnArtistNewsByArtistId() {
        Test.startTest();
        MBMS_Artist__c artist = [SELECT Id FROM MBMS_Artist__c LIMIT 1];
        MBMS_Artist_News__c artistNews = ArtistNewsController.getLatestArtistNewsByArtistId(artist.Id);
        Test.stopTest();
        
        System.assertNotEquals(null, artistNews);
    }
}