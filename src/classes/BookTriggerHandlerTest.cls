@isTest
private class BookTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Book__c book = new BookBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void triggerShouldUpdateBookName() {
        Test.startTest();
        MBMS_Book__c book = [SELECT Name, MBMS_Title__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(book.MBMS_Title__c, book.Name, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Name', book.MBMS_Title__c }));
    }
    
    @isTest
    static void triggerShouldUpdateBookStatusComment() {
        Test.startTest();
        MBMS_Book__c book = [SELECT MBMS_Status_Comment__c
                             FROM MBMS_Book__c
                             LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT, book.MBMS_Status_Comment__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c', MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT }));
    }

    @isTest
    static void triggerShouldUpdateRecordOwner() {
        Test.startTest();
        MBMS_Book__c book = [SELECT OwnerId
                             FROM MBMS_Book__c
                             LIMIT 1];
        book.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_REJECTED;
        update book;

        Group approversQueue = [SELECT Id
                                FROM Group WHERE Type = :MBMS_Constants.QUEUE_GROUP_TYPE
                                AND Name = :MBMS_Constants.APPROVERS_QUEUE
                                LIMIT 1];
        Test.stopTest();

        book = [SELECT OwnerId
                FROM MBMS_Book__c
                LIMIT 1];
        
        System.assertEquals(approversQueue.Id, book.OwnerId, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'OwnerId', approversQueue.Id }));
    }
}