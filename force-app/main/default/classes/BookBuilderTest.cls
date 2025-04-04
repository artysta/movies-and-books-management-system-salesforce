@isTest
private class BookBuilderTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new BookBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void bookShouldNotBeNull() {
        MBMS_Book__c book = new BookBuilder()
            .create()
            .build();
        
        System.assertNotEquals(null, book, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Book__c' }));
    }
    
    @isTest
    static void insertedBookShouldNotBeNull() {
        MBMS_Book__c book = [
            SELECT
                Id
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        System.assertNotEquals(null, book, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Book__c' }));
    }
    
    @isTest
    static void bookShouldHaveArtist() {
        MBMS_Book__c book = [
            SELECT
                MBMS_Artist__c
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        System.assertNotEquals(null, book.MBMS_Artist__c, String.format(Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist__c' }));
    }
    
    @isTest
    static void bookShouldHaveName() {
        MBMS_Book__c book = [
            SELECT
                Name
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        System.assertNotEquals(null, book.Name, String.format(Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'Name' }));
    }
    
    @isTest
    static void bookShouldHaveDescription() {
        MBMS_Book__c book = [
            SELECT
                MBMS_Description__c
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        System.assertEquals(Constants.TEST_STRING_VALUE, book.MBMS_Description__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Description__c', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void bookShouldHaveTitle() {
        MBMS_Book__c book = [
            SELECT
                MBMS_Title__c
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        System.assertEquals(Constants.TEST_STRING_VALUE, book.MBMS_Title__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Title__c', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void bookShouldHaveCoverImageURL() {
        MBMS_Book__c book = [
            SELECT
                MBMS_Cover_Image_URL__c
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        System.assertEquals(Constants.TEST_STRING_VALUE, book.MBMS_Cover_Image_URL__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Cover_Image_URL__c', Constants.TEST_STRING_VALUE }));
    }

    @isTest
    static void bookShouldHaveStatus() {
        MBMS_Book__c book = [
            SELECT
                MBMS_Status__c
            FROM MBMS_Book__c
            LIMIT 1
        ];

        System.assertEquals(Constants.STATUS_APPROVED, book.MBMS_Status__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status__c', Constants.STATUS_APPROVED }));
    }
    
    @isTest
    static void bookShouldHaveStatusComment() {
        MBMS_Book__c book = [
            SELECT
                MBMS_Status_Comment__c
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        System.assertEquals(Constants.INITIAL_STATUS_COMMENT, book.MBMS_Status_Comment__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c', Constants.INITIAL_STATUS_COMMENT }));
    }
}