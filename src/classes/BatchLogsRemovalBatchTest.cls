@isTest
private class BatchLogsRemovalBatchTest {
    @testSetup
    static void testDataSetup() {
        new BatchLogBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    private static void shouldDeleteExistingBatchLogs() {
        List<MBMS_Batch_Log__c> batchLogs = [SELECT Id FROM MBMS_Batch_Log__c];
        
        for (MBMS_Batch_Log__c batchLog : batchLogs) {
            Test.setCreatedDate(batchLog.Id, MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY);
        }
        
        Test.startTest();
        BatchLogsRemovalBatch removalBatch = new BatchLogsRemovalBatch();
        Database.executeBatch(removalBatch);
        Test.stopTest();
        
        batchLogs = [SELECT Id FROM MBMS_Batch_Log__c WHERE CreatedDate != TODAY];
        System.assertEquals(0, batchLogs.size());
    }
    
    @isTest
    private static void shouldDeleteExistingBatchLogsBulk() {
        removeExistingBatchLogs();
        
        List<MBMS_Batch_Log__c> batchLogs = new List<MBMS_Batch_Log__c>();
        BatchLogBuilder builder = new BatchLogBuilder();
        
        for (Integer i = 0; i < 200; i++) {
            batchLogs.add(builder
                          .create()
                          .buildWithAllFields());
        }
        
        insert batchLogs;
        
        for (MBMS_Batch_Log__c batchLog : batchLogs) {
            Test.setCreatedDate(batchLog.Id, MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY);
        }
        
        Test.startTest();
        BatchLogsRemovalBatch removalBatch = new BatchLogsRemovalBatch();
        Database.executeBatch(removalBatch);
        Test.stopTest();
        
        batchLogs = [SELECT Id FROM MBMS_Batch_Log__c WHERE CreatedDate != TODAY];
        
        System.assertEquals(0, batchLogs.size());
    }
    
    @isTest
    private static void shouldNotDeleteExistingBatchLogs() {
        List<MBMS_Batch_Log__c> batchLogs = [SELECT Id FROM MBMS_Batch_Log__c];
        
        Test.startTest();
        BatchLogsRemovalBatch removalBatch = new BatchLogsRemovalBatch();
        Database.executeBatch(removalBatch);
        Test.stopTest();
        
        batchLogs = [SELECT Id FROM MBMS_Batch_Log__c];
        System.assert(batchLogs.size() > 0);
    }
    
    private static void removeExistingBatchLogs() {
        delete [SELECT Id FROM MBMS_Batch_Log__c];
    }
}