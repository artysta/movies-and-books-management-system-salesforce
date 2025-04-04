@isTest
private class BookNewsBuilderTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new BookNewsBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void bookNewsShouldNotBeNull() {
        MBMS_Book_News__c bookNews = new BookNewsBuilder()
            .create()
            .build();
        
        System.assertNotEquals(null, bookNews, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Book_News__c' }));
    }
    
    @isTest
    static void insertedBookNewsShouldNotBeNull() {
        MBMS_Book_News__c bookNews = [
            SELECT
                Id
            FROM MBMS_Book_News__c
            LIMIT 1
        ];
        
        System.assertNotEquals(null, bookNews, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Book_News__c' }));
    }
    
    @isTest
    static void bookNewsShouldHaveName() {
        MBMS_Book_News__c bookNews = [
            SELECT
                Name
            FROM MBMS_Book_News__c
            LIMIT 1
        ];
        
        System.assertEquals(Constants.TEST_STRING_VALUE, bookNews.Name, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Name', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void bookNewsShouldHaveTitle() {
        MBMS_Book_News__c bookNews = [
            SELECT
                MBMS_Title__c
            FROM MBMS_Book_News__c
            LIMIT 1
        ];
        
        System.assertEquals(Constants.TEST_STRING_VALUE, bookNews.MBMS_Title__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Title__c', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void bookNewsShouldHaveContent() {
        MBMS_Book_News__c bookNews = [
            SELECT
                MBMS_Content__c
            FROM MBMS_Book_News__c
            LIMIT 1
        ];
        
        System.assertEquals(Constants.TEST_STRING_VALUE, bookNews.MBMS_Content__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Content__c', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void bookNewsShouldHaveTags() {
        MBMS_Book_News__c bookNews = [
            SELECT
                MBMS_Tags__c
            FROM MBMS_Book_News__c
            LIMIT 1
        ];
        
        System.assert(bookNews.MBMS_Tags__c.contains(Constants.TEST_STRING_VALUE), String.format(Constants.FIELD_SHOULD_CONTAIN_PATTERN, new List<String> { 'MBMS_Tags__c', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void bookNewsShouldHaveArtist() {
        MBMS_Book_News__c bookNews = [
            SELECT
                MBMS_Book__c
            FROM MBMS_Book_News__c
            LIMIT 1
        ];
        
        System.assertNotEquals(null, bookNews.MBMS_Book__c, String.format(Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Book__c' }));
    }
    
    @isTest
    static void bookNewsShouldHaveImageURL() {
        MBMS_Book_News__c bookNews = [
            SELECT
                MBMS_Image_URL__c
            FROM MBMS_Book_News__c
            LIMIT 1
        ];
        
        System.assertEquals(Constants.TEST_STRING_VALUE, bookNews.MBMS_Image_URL__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Image_URL__c', Constants.TEST_STRING_VALUE }));
    }
}