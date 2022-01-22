@isTest
private class BookTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Book__c book = new BookBuilder().buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void triggerShouldUpdateBookName() {
        Test.startTest();
        MBMS_Book__c book = [SELECT Name, MBMS_Title__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(book.MBMS_Title__c, book.Name);
    }
}