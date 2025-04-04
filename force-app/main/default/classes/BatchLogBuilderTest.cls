@isTest
private class BatchLogBuilderTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new BatchLogBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void batchLogShouldNotBeNull() {
        MBMS_Batch_Log__c batchLog = new BatchLogBuilder()
            .create()
            .build();
        
        System.assertNotEquals(null, batchLog, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'batchLog' }));
    }
    
    @isTest
    static void insertedBatchLogShouldNotBeNull() {
        MBMS_Batch_Log__c batchLog = [
            SELECT
                Id
            FROM MBMS_Batch_Log__c
            LIMIT 1
        ];
        
        System.assertNotEquals(null, batchLog, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'batchLog' }));
    }
    
    @isTest
    static void batchLogShouldHaveName() {
        MBMS_Batch_Log__c batchLog = [
            SELECT
                Name
            FROM MBMS_Batch_Log__c
            LIMIT 1
        ];        
        
        System.assertEquals(Constants.TEST_STRING_VALUE, batchLog.Name, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Name', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void batchLogShouldHaveMessage() {
        MBMS_Batch_Log__c batchLog = [
            SELECT
                MBMS_Message__c
            FROM MBMS_Batch_Log__c
            LIMIT 1
        ];
        
        System.assertEquals(Constants.TEST_STRING_VALUE, batchLog.MBMS_Message__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Message__c', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void batchLogShouldHaveRecordsProcessed() {
        MBMS_Batch_Log__c batchLog = [
            SELECT
                MBMS_Records_Processed__c
            FROM MBMS_Batch_Log__c
            LIMIT 1
        ];
        
        System.assertEquals(Constants.TEST_NUMBER, batchLog.MBMS_Records_Processed__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Records_Processed__c', String.valueOf(Constants.TEST_NUMBER)}));
    }
}