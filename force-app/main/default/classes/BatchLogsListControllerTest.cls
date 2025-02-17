@isTest
private class BatchLogsListControllerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new BatchLogBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void shouldReturnEmptyListOfBatchLogs() {
        MBMS_Batch_Log__c batchLog = [SELECT Id FROM MBMS_Batch_Log__c LIMIT 1];
        delete batchLog;
        
        Test.startTest();
        List<MBMS_Batch_Log__c> batchLogs = BatchLogsListController.getBatchLogs();
        Test.stopTest();
        
        System.assertEquals(0, batchLogs.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'batchLogs', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfBatchLogs() {
        Test.startTest();
        List<MBMS_Batch_Log__c> batchLogs = BatchLogsListController.getBatchLogs();
        Test.stopTest();
        
        System.assert(batchLogs.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'batchLogs', '0' }));
        System.assertNotEquals(null, batchLogs[0], Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL);
    }
    
    @isTest
    static void batchLogsShouldNotBeAvailable() {
        MBMS_Batch_Log__c batchLog = [SELECT Id FROM MBMS_Batch_Log__c LIMIT 1];
        delete batchLog;
        
        Test.startTest();
        Boolean areBatchLogsAvailable = BatchLogsListController.areBatchLogsAvailable();
        Test.stopTest();
        
        System.assert(!areBatchLogsAvailable, Constants.VALUE_SHOULD_BE_FALSE);
    }
    
    @isTest
    static void batchLogsShouldBeAvailable() {
        Test.startTest();
        Boolean areBatchLogsAvailable = BatchLogsListController.areBatchLogsAvailable();
        Test.stopTest();
        
        System.assert(areBatchLogsAvailable, Constants.VALUE_SHOULD_BE_TRUE);
    }
}