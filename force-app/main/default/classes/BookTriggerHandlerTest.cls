@isTest
private class BookTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        MBMS_Book__c book = new BookBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void triggerShouldUpdateBookName() {
        MBMS_Book__c book = [
            SELECT
                Name,
                MBMS_Title__c
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        System.assertEquals(book.MBMS_Title__c, book.Name, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Name', book.MBMS_Title__c }));
    }
    
    @isTest
    static void triggerShouldUpdateBookStatusComment() {
        MBMS_Book__c book = [
            SELECT
                MBMS_Status_Comment__c
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        System.assertEquals(Constants.INITIAL_STATUS_COMMENT, book.MBMS_Status_Comment__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c', Constants.INITIAL_STATUS_COMMENT }));
    }

    @isTest
    static void triggerShouldUpdateRecordOwner() {
        MBMS_Book__c book = [
            SELECT
                OwnerId
            FROM MBMS_Book__c
            LIMIT 1
        ];

        book.MBMS_Status__c = Constants.STATUS_REJECTED;

        Test.startTest();
        update book;
        Test.stopTest();

        Group approversQueue = SObjectsSelector.getApproversQueue();

        book = [
            SELECT
                OwnerId
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        System.assertEquals(approversQueue.Id, book.OwnerId, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'OwnerId', approversQueue.Id }));
    }

    @isTest
    static void triggerShouldUpdatePreviousStatus() {
        MBMS_Book__c book = [
            SELECT
                MBMS_Status__c
            FROM MBMS_Book__c
            LIMIT 1
        ];

        String expectedPreviousStatus = book.MBMS_Status__c;
        book.MBMS_Status__c = Constants.STATUS_REJECTED;

        Test.startTest();
        update book;
        Test.stopTest();

        book = [
            SELECT
                MBMS_Previous_Status__c
            FROM MBMS_Book__c
            LIMIT 1
        ];
        
        System.assertEquals(expectedPreviousStatus, book.MBMS_Previous_Status__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Previous_Status__c', expectedPreviousStatus }));
    }
}