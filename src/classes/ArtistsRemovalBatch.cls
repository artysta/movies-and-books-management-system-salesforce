public class ArtistsRemovalBatch extends VirtualBatchRunLogger implements Database.Batchable<sObject>, Database.Stateful {
    
    public ArtistsRemovalBatch() {
        super(String.valueOf(ArtistsRemovalBatch.class));
    }
    
    public Database.QueryLocator start(Database.BatchableContext context) {
        super.startLogging();
        return Database.getQueryLocator([SELECT Id
                                         FROM MBMS_Artist__c
                                         WHERE MBMS_Status__c IN (:Constants.STATUS_INITIAL,
                                                                  :Constants.STATUS_REJECTED)
                                         AND CreatedDate <= :Constants.RECORDS_RETENTION_DATE]);
    }
    
    public void execute(Database.BatchableContext context, List<MBMS_Artist__c> artists) {
        List<Database.DeleteResult> deleteResults = Database.delete(artists);
        super.checkDeleteResults(deleteResults);
    }
    
    public void finish(Database.BatchableContext context) {
        super.stopLogging();
    }
}
