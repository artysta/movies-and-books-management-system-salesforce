public virtual class BatchRunLogger {
    private MBMS_Batch_Log__c batchLog;
    private String batchName;
    private Long startTimeInMilliseconds;
    private Integer successesCount = 0;
    private Integer errorsCount = 0;
    private String message;

    public BatchRunLogger(String batchName) {
        this.batchName = batchName;
    }
        
    public void startLogging() {
        this.startTimeInMilliseconds = Datetime.now().millisecond();
        System.debug(String.format('[ {0} ] Batch job has started.', new List<String> { this.batchName }));
    }
    
    public void stopLogging() {
        this.message = String.format('[ {0} ] Batch job done. Total amount of processed records: {1} ({2} errors). Total time of the job in milliseconds: {3}.',
                                     new List<String> {
                                         String.valueOf(this.batchName),
                                         String.valueOf(this.getTotalNumberOfRecordsProcessed()),
                                         String.valueOf(this.errorsCount),
                                         String.valueOf(Datetime.now().millisecond() - this.startTimeInMilliseconds) }
                                    );
        System.debug(message);
        
        this.buildAndInsertBatchLog();
    }
    
    public void logErrorMessage(String message) {
        System.debug(String.format('[ {0} ] Error occurred: {1}.', new List<String> { this.batchName, message }));
    }
    
    public void incrementSuccessesCount() {
        this.successesCount++;
    }

    public void incrementErrorsCount() {
        this.errorsCount++;
    }
    
    private Integer getTotalNumberOfRecordsProcessed() {
        return this.successesCount + this.errorsCount;
    }
    
    private void buildAndInsertBatchLog() {
        this.batchLog = new BatchLogBuilder()
            .createNewRecord()
            .withName(String.format('{0} Log {1}', new List<String> { this.batchName, String.valueOf(Datetime.now()) }))
            .withBatchName(this.batchName)
            .withMessage(message)
            .withRecordsProcessed(this.getTotalNumberOfRecordsProcessed())
            .buildAndInsert();
    }
}