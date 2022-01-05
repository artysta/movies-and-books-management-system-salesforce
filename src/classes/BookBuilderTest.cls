@isTest
private class BookBuilderTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Artist__c artist = new ArtistBuilder()
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .buildAndInsert();
        
        MBMS_Book__c book = new BookBuilder()
            .withArtist(artist)
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withDescription(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withTitle(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withCoverImageURL(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .buildAndInsert();
    }
    
    @isTest
    static void bookShouldNotBeNull() {
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
}