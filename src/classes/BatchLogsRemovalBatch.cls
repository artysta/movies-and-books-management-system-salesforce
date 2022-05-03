public class BatchLogsRemovalBatch extends VirtualBatchRunLogger implements Database.Batchable<sObject>, Database.Stateful {
    
    public BatchLogsRemovalBatch() {
        super(String.valueOf(BatchLogsRemovalBatch.class));
    }
    
    public Database.QueryLocator start(Database.BatchableContext context) {
        super.startLogging();
        System.debug('size: ' + [SELECT Id FROM MBMS_Batch_Log__c WHERE CreatedDate <= :Constants.RECORDS_RETENTION_DATE].size());
        return Database.getQueryLocator([SELECT Id
                                         FROM MBMS_Batch_Log__c
                                         WHERE CreatedDate <= :Constants.RECORDS_RETENTION_DATE]);
    }
    
    public void execute(Database.BatchableContext context, List<MBMS_Batch_Log__c> batchLogs) {
        List<Database.DeleteResult> deleteResults = Database.delete(batchLogs);
        System.debug('deleteResults.size(): ' + deleteResults.size());
        for (Database.DeleteResult result : deleteResults) {
            if (result.isSuccess()) {
                super.incrementSuccessesCount();
                continue;
            }
            
            for (Database.Error error : result.getErrors()) {
                super.logErrorMessage(error.getMessage());
            }
        }
    }
    
    public void finish(Database.BatchableContext context) {
        super.stopLogging();
    }
}