public class ArtistsRemovalBatch implements Database.Batchable<sObject>, Database.Stateful {
    private Integer errorsCount = 0;
    private Integer totalRecordsCount = 0;
    private Long startTimeInMilliseconds;
    
    public Database.QueryLocator start(Database.BatchableContext context) {
        System.debug(String.format('[ {0} ] Batch job started.', new List<String> { String.valueOf(ArtistsRemovalBatch.class) }));
        this.startTimeInMilliseconds = Datetime.now().millisecond();
        return Database.getQueryLocator([SELECT Id
                                         FROM MBMS_Artist__c
                                         WHERE MBMS_Status__c IN (:MBMS_Constants.MBMS_STATUS_INITIAL,
                                                                  :MBMS_Constants.MBMS_STATUS_REJECTED)
                                         AND CreatedDate <= :MBMS_Constants.MBMS_RECORDS_RETENTION_DATE]);
    }
    
    public void execute(Database.BatchableContext context, List<MBMS_Artist__c> artists) {
        List<Database.DeleteResult> deleteResults = Database.delete(artists);
        
        this.totalRecordsCount = deleteResults.size();
        
        for (Database.DeleteResult result : deleteResults) {
            if (result.isSuccess()) {
                continue;
            }
            
            for (Database.Error error : result.getErrors()) {
                System.debug(String.format('[ {0} ] Error: {1}.', new List<String> { String.valueOf(ArtistsRemovalBatch.class), error.getMessage() }));
				this.errorsCount++;
            }
        }
        
        System.debug(String.format('[ {0} ] Amount of deleted records: {1}.', new List<String> { String.valueOf(ArtistsRemovalBatch.class), String.valueOf(this.totalRecordsCount) }));
    }
    
    public void finish(Database.BatchableContext context) {
        System.debug(String.format('[ {0} ] Batch job done. Total processed records: {1} ({2} errors).', new List<String> { String.valueOf(ArtistsRemovalBatch.class), String.valueOf(this.totalRecordsCount), String.valueOf(errorsCount) }));
        System.debug(String.format('[ {0} ] Total time of the job in milliseconds: {1}.', new List<String> { String.valueOf(ArtistsRemovalBatch.class), String.valueOf(Datetime.now().millisecond() - startTimeInMilliseconds) }));
    }
}