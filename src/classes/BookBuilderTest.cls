@isTest
private class BookBuilderTest {
    @testSetup
    static void testDataSetup() {
        new BookBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void bookShouldNotBeNull() {
        Test.startTest();        
        MBMS_Book__c book = new BookBuilder()
            .create()
            .build();
        Test.stopTest();
        
        System.assertNotEquals(null, book, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Book__c' }));
    }
    
    @isTest
    static void insertedBookShouldNotBeNull() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT Id
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, book, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Book__c' }));
    }
    
    @isTest
    static void bookShouldHaveArtist() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT MBMS_Artist__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, book.MBMS_Artist__c, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist__c' }));
    }
    
    @isTest
    static void bookShouldHaveName() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT Name
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, book.MBMS_Artist__c, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'Name' }));
    }
    
    @isTest
    static void bookShouldHaveDescription() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT MBMS_Description__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, book.MBMS_Description__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Description__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void bookShouldHaveTitle() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT MBMS_Title__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, book.MBMS_Title__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Title__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void bookShouldHaveCoverImageURL() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT MBMS_Cover_Image_URL__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, book.MBMS_Cover_Image_URL__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Cover_Image_URL__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }

    @isTest
    static void bookShouldHaveStatus() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT MBMS_Status__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();

        System.assertEquals(MBMS_Constants.MBMS_STATUS_APPROVED, book.MBMS_Status__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status__c', MBMS_Constants.MBMS_STATUS_APPROVED }));
    }
    
    @isTest
    static void bookShouldHaveStatusComment() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT MBMS_Status_Comment__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT, book.MBMS_Status_Comment__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c', MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT }));
    }
}