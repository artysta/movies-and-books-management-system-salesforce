@isTest
private class BookNewsBuilderTest {
    @testSetup
    static void testDataSetup() {
        new BookNewsBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void bookNewsShouldNotBeNull() {
        Test.startTest();        
        MBMS_Book_News__c bookNews = new BookNewsBuilder()
            .create()
            .build();
        Test.stopTest();
        
        System.assertNotEquals(null, bookNews, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Book_News__c' }));
    }
    
    @isTest
    static void insertedBookNewsShouldNotBeNull() {
        Test.startTest();        
        MBMS_Book_News__c bookNews = [SELECT Id
                                      FROM MBMS_Book_News__c
                                      LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, bookNews, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Book_News__c' }));
    }
    
    @isTest
    static void bookNewsShouldHaveName() {
        Test.startTest();        
        MBMS_Book_News__c bookNews = [SELECT Name
                                      FROM MBMS_Book_News__c
                                      LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, bookNews.Name, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Name', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void bookNewsShouldHaveTitle() {
        Test.startTest();        
        MBMS_Book_News__c bookNews = [SELECT MBMS_Title__c
                                      FROM MBMS_Book_News__c
                                      LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, bookNews.MBMS_Title__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Title__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void bookNewsShouldHaveContent() {
        Test.startTest();        
        MBMS_Book_News__c bookNews = [SELECT MBMS_Content__c
                                      FROM MBMS_Book_News__c
                                      LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, bookNews.MBMS_Content__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Content__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void bookNewsShouldHaveTags() {
        Test.startTest();        
        MBMS_Book_News__c bookNews = [SELECT MBMS_Tags__c
                                      FROM MBMS_Book_News__c
                                      LIMIT 1];
        Test.stopTest();
        
        System.assert(bookNews.MBMS_Tags__c.contains(MBMS_Constants.MBMS_TEST_STRING_VALUE), String.format(MBMS_Constants.FIELD_SHOULD_CONTAIN_PATTERN, new List<String> { 'MBMS_Tags__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void bookNewsShouldHaveArtist() {
        Test.startTest();        
        MBMS_Book_News__c bookNews = [SELECT MBMS_Book__c
                                      FROM MBMS_Book_News__c
                                      LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, bookNews.MBMS_Book__c, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Book__c' }));
    }
    
    @isTest
    static void bookNewsShouldHaveImageURL() {
        Test.startTest();        
        MBMS_Book_News__c bookNews = [SELECT MBMS_Image_URL__c
                                      FROM MBMS_Book_News__c
                                      LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, bookNews.MBMS_Image_URL__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Image_URL__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
}