public class ArtistsRemovalBatch extends VirtualBatchRunLogger implements Database.Batchable<sObject>, Database.Stateful {
    
    public ArtistsRemovalBatch() {
        super(String.valueOf(ArtistsRemovalBatch.class));
    }
    
    public Database.QueryLocator start(Database.BatchableContext context) {
        super.startLogging();
        return Database.getQueryLocator([SELECT Id
                                         FROM MBMS_Artist__c
                                         WHERE MBMS_Status__c IN (:MBMS_Constants.MBMS_STATUS_INITIAL,
                                                                  :MBMS_Constants.MBMS_STATUS_REJECTED)
                                         AND CreatedDate <= :MBMS_Constants.MBMS_RECORDS_RETENTION_DATE]);
    }
    
    public void execute(Database.BatchableContext context, List<MBMS_Artist__c> artists) {
        List<Database.DeleteResult> deleteResults = Database.delete(artists);
        
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