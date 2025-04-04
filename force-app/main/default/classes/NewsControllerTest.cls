@isTest
private class NewsControllerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new ArtistNewsBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void shouldReturnEmptyListOfNews() {
        List<MBMS_Artist_News__c> artistNews = [
            SELECT
                Id
            FROM MBMS_Artist_News__c
        ];
        
        delete artistNews;
        
        Test.startTest();
        List<sObject> allNews = NewsController.getNews();
        Test.stopTest();
        
        System.assertEquals(0, allNews.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'allNews', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfNews() {
        List<MBMS_Artist_News__c> artistNews = [
            SELECT
                Id
            FROM MBMS_Artist_News__c
        ];
        
        update artistNews;
        
        Test.startTest();
        List<sObject> allNews = NewsController.getNews();
        Test.stopTest();
        
        System.assert(allNews.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'allNews', '0' }));
        System.assertNotEquals(null, allNews.get(0), String.format(Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL, new List<String> { 'allNews' }));
    }
    
    @isTest
    static void newsShouldNotBeAvailable() {
        MBMS_Artist_News__c artistNews = [
            SELECT
                Id
            FROM MBMS_Artist_News__c
            LIMIT 1
        ];
        
        delete artistNews;
        
        Test.startTest();
        Boolean areNewsAvailable = NewsController.areNewsAvailable();
        Test.stopTest();
        
        System.assert(!areNewsAvailable, String.format(Constants.VALUE_SHOULD_BE_FALSE, new List<String> { 'areNewsAvailable' }));
    }
    
    @isTest
    static void newsShouldBeAvailable() {
        Test.startTest();
        Boolean areNewsAvailable = NewsController.areNewsAvailable();
        Test.stopTest();
        
        System.assert(areNewsAvailable, String.format(Constants.VALUE_SHOULD_BE_TRUE, new List<String> { 'areNewsAvailable' }));
    }
}