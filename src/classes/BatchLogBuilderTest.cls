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
        
        System.assertNotEquals(null, batchLog, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'batchLog' }));
    }
    
    @isTest
    static void insertedBatchLogShouldNotBeNull() {
        MBMS_Batch_Log__c batchLog = [SELECT Id
                                      FROM MBMS_Batch_Log__c
                                      LIMIT 1];
        
        System.assertNotEquals(null, batchLog, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'batchLog' }));
    }
    
    @isTest
    static void batchLogShouldHaveName() {
        MBMS_Batch_Log__c batchLog = [SELECT Name
                                      FROM MBMS_Batch_Log__c
                                      LIMIT 1];        
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, batchLog.Name, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Name', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void batchLogShouldHaveMessage() {
        MBMS_Batch_Log__c batchLog = [SELECT MBMS_Message__c
                                      FROM MBMS_Batch_Log__c
                                      LIMIT 1];
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, batchLog.MBMS_Message__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Message__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void batchLogShouldHaveRecordsProcessed() {
        MBMS_Batch_Log__c batchLog = [SELECT MBMS_Records_Processed__c
                                      FROM MBMS_Batch_Log__c
                                      LIMIT 1];
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_NUMBER, batchLog.MBMS_Records_Processed__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Records_Processed__c', String.valueOf(MBMS_Constants.MBMS_TEST_NUMBER)}));
    }
}