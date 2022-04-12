@isTest
private class NewsControllerTest {
    @testSetup
    static void testDataSetup() {
        new ArtistNewsBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void shouldReturnEmptyListOfNews() {
        Test.startTest();
        List<MBMS_Artist_News__c> artistNews = [SELECT Id FROM MBMS_Artist_News__c];
        delete artistNews;
        
        List<sObject> allNews = NewsController.getNews();
        Test.stopTest();
        
        System.assertEquals(0, allNews.size(), String.format(MBMS_Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'allNews', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfNews() {
        Test.startTest();
        List<MBMS_Artist_News__c> artistNews = [SELECT Id FROM MBMS_Artist_News__c];
        update artistNews;
        
        List<sObject> allNews = NewsController.getNews();
        Test.stopTest();
        
        System.assert(allNews.size() > 0, String.format(MBMS_Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'allNews', '0' }));
        System.assertNotEquals(null, allNews.get(0), String.format(MBMS_Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL, new List<String> { 'allNews' }));
    }
    
    @isTest
    static void newsShouldNotBeAvailable() {
        Test.startTest();
        MBMS_Artist_News__c artistNews = [SELECT Id FROM MBMS_Artist_News__c LIMIT 1];
        delete artistNews;
        
        Boolean areNewsAvailable = NewsController.areNewsAvailable();
        Test.stopTest();
        
        System.assert(!areNewsAvailable, String.format(MBMS_Constants.VALUE_SHOULD_BE_FALSE, new List<String> { 'areNewsAvailable' }));
    }
    
    @isTest
    static void newsShouldBeAvailable() {
        Test.startTest();
        Boolean areNewsAvailable = NewsController.areNewsAvailable();
        Test.stopTest();
        
        System.assert(areNewsAvailable, String.format(MBMS_Constants.VALUE_SHOULD_BE_TRUE, new List<String> { 'areNewsAvailable' }));
    }
}