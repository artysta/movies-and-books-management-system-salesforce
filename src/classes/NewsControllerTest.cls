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
        
        System.assertEquals(0, allNews.size());
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfNews() {
        Test.startTest();
        List<MBMS_Artist_News__c> artistNews = [SELECT Id FROM MBMS_Artist_News__c];
        update artistNews;
        
        List<sObject> allNews = NewsController.getNews();
        Test.stopTest();
        
        System.assert(allNews.size() > 0);
        System.assertNotEquals(null, allNews.get(0));
    }
    
    @isTest
    static void newsShouldNotBeAvailable() {
        Test.startTest();
        MBMS_Artist_News__c artistNews = [SELECT Id FROM MBMS_Artist_News__c LIMIT 1];
        delete artistNews;
        
        Boolean areNewsAvailable = NewsController.areNewsAvailable();
        Test.stopTest();
        
        System.assert(!areNewsAvailable);
    }
    
    @isTest
    static void newsShouldBeAvailable() {
        Test.startTest();
        Boolean areNewsAvailable = NewsController.areNewsAvailable();
        Test.stopTest();
        
        System.assert(areNewsAvailable);
    }
}