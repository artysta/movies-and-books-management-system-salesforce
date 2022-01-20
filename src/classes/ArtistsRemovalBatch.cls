public class ArtistsRemovalBatch implements Database.Batchable<sObject>, Database.Stateful {
    private BatchRunLogger logger;
    
    public ArtistsRemovalBatch() {
		this.logger = new BatchRunLogger(String.valueOf(ArtistsRemovalBatch.class));
    }
    
    
    public Database.QueryLocator start(Database.BatchableContext context) {
        logger.startLogging();
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
                logger.incrementSuccessesCount();
                continue;
            }
            
            for (Database.Error error : result.getErrors()) {
                logger.incrementErrorsCount();
                logger.logErrorMessage(error.getMessage());
            }
        }
    }
    
    public void finish(Database.BatchableContext context) {
        logger.stopLogging();
    }
}