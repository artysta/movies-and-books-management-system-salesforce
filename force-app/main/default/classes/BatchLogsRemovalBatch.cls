public class BatchLogsRemovalBatch extends VirtualBatchRunLogger implements Database.Batchable<sObject>, Database.Stateful {
    
    public BatchLogsRemovalBatch() {
        super(String.valueOf(BatchLogsRemovalBatch.class));
    }
    
    public Database.QueryLocator start(Database.BatchableContext context) {
        super.startLogging();
        return Database.getQueryLocator([
            SELECT
                Id
            FROM MBMS_Batch_Log__c
            WHERE CreatedDate <= :Constants.RECORDS_RETENTION_DATE
        ]);
    }
    
    public void execute(Database.BatchableContext context, List<MBMS_Batch_Log__c> batchLogs) {
        List<Database.DeleteResult> deleteResults = Database.delete(batchLogs);
        super.checkDeleteResults(deleteResults);
    }
    
    public void finish(Database.BatchableContext context) {
        super.stopLogging();
    }
}