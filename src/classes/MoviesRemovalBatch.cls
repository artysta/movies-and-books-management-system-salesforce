public class MoviesRemovalBatch extends VirtualBatchRunLogger implements Database.Batchable<sObject>, Database.Stateful {
    public MoviesRemovalBatch() {
        super(String.valueOf(MoviesRemovalBatch.class));
    }
    
    public Database.QueryLocator start(Database.BatchableContext context) {
        startLogging();
        return Database.getQueryLocator([SELECT Id
                                         FROM MBMS_Movie__c
                                         WHERE MBMS_Status__c IN (:MBMS_Constants.MBMS_STATUS_INITIAL,
                                                                  :MBMS_Constants.MBMS_STATUS_REJECTED)
                                         AND CreatedDate <= :MBMS_Constants.MBMS_RECORDS_RETENTION_DATE]);
    }
    
    public void execute(Database.BatchableContext context, List<MBMS_Movie__c> movies) {
        List<Database.DeleteResult> deleteResults = Database.delete(movies);
        
        for (Database.DeleteResult result : deleteResults) {
            if (result.isSuccess()) {
                incrementSuccessesCount();
                continue;
            }
            
            for (Database.Error error : result.getErrors()) {
                logErrorMessage(error.getMessage());
            }
        }
    }
    
    public void finish(Database.BatchableContext context) {
        stopLogging();
    }
}