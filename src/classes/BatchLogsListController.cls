public with sharing class BatchLogsListController {
    @AuraEnabled
    public static List<MBMS_Batch_Log__c> getBatchLogs() {
        return [SELECT Id, Name, MBMS_Records_Processed__c,
                MBMS_Message__c, CreatedDate
                FROM MBMS_Batch_Log__c];
    }
}