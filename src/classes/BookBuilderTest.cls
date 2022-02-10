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
        
        System.assertNotEquals(null, book);
    }
    
    @isTest
    static void insertedBookShouldNotBeNull() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT Id
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, book);
    }
    
    @isTest
    static void bookShouldHaveAnArtist() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT MBMS_Artist__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, book.MBMS_Artist__c);
    }
    
    @isTest
    static void bookShouldHaveAName() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT Name
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, book.Name);
    }
    
    @isTest
    static void bookShouldHaveADescription() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT MBMS_Description__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, book.MBMS_Description__c);
    }
    
    @isTest
    static void bookShouldHaveATitle() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT MBMS_Title__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, book.MBMS_Title__c);
    }
    
    @isTest
    static void bookShouldHaveACoverImageURL() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT MBMS_Cover_Image_URL__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, book.MBMS_Cover_Image_URL__c);
    }

    @isTest
    static void bookShouldHaveAStatus() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT MBMS_Status__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_STATUS_APPROVED, book.MBMS_Status__c);
    }
    
    @isTest
    static void bookShouldHaveAStatusComment() {
        Test.startTest();        
        MBMS_Book__c book = [SELECT MBMS_Status_Comment__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT, book.MBMS_Status_Comment__c);
    }
}