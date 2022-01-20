@isTest
private class BatchLogBuilderTest {
    @testSetup
    static void testDataSetup() {
        new BatchLogBuilder()
            .createNewRecord()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void batchLogShouldNotBeNull() {
        Test.startTest();        
        MBMS_Batch_Log__c batchLog = new BatchLogBuilder()
            .createNewRecord()
            .build();
        Test.stopTest();
        
        System.assertNotEquals(null, batchLog);
    }
    
    @isTest
    static void insertedBatchLogShouldNotBeNull() {
        Test.startTest();        
        MBMS_Batch_Log__c batchLog = [SELECT Id
                                      FROM MBMS_Batch_Log__c
                                      LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, batchLog);
    }
    
    @isTest
    static void batchLogShouldHaveAName() {
        Test.startTest();        
        MBMS_Batch_Log__c batchLog = [SELECT Name
                                      FROM MBMS_Batch_Log__c
                                      LIMIT 1];        
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, batchLog.Name);
    }
    
    @isTest
    static void batchLogShouldHaveAMessage() {
        Test.startTest();        
        MBMS_Batch_Log__c batchLog = [SELECT MBMS_Message__c
                                      FROM MBMS_Batch_Log__c
                                      LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, batchLog.MBMS_Message__c);
    }
    
    @isTest
    static void batchLogShouldHaveARecordsProcessed() {
        Test.startTest();        
        MBMS_Batch_Log__c batchLog = [SELECT MBMS_Records_Processed__c
                                      FROM MBMS_Batch_Log__c
                                      LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_NUMBER, batchLog.MBMS_Records_Processed__c);
    }
}