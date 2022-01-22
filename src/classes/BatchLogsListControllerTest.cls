@isTest
private class BatchLogsListControllerTest {
    @testSetup
    static void testDataSetup() {
        new BatchLogBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void shouldReturnEmptyListOfBatchLogs() {
        Test.startTest();
        MBMS_Batch_Log__c batchLog = [SELECT Id FROM MBMS_Batch_Log__c LIMIT 1];
        delete batchLog;
        
        List<MBMS_Batch_Log__c> batchLogs = BatchLogsListController.getBatchLogs();
        Test.stopTest();
        
        System.assertEquals(0, batchLogs.size());
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfBatchLogs() {
        Test.startTest();
        List<MBMS_Batch_Log__c> batchLogs = BatchLogsListController.getBatchLogs();
        Test.stopTest();
        
        System.assert(batchLogs.size() > 0);
        System.assertNotEquals(null, batchLogs[0]);
    }
}