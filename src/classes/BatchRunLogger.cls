public virtual class BatchRunLogger {
	private String batchName;
    private Long startTimeInMilliseconds;
    private Integer successesCount = 0;
    private Integer errorsCount = 0;

    public BatchRunLogger(String batchName) {
        this.batchName = batchName;
    }
        
    public void startLogging() {
        this.startTimeInMilliseconds = Datetime.now().millisecond();
        System.debug(String.format('[ {0} ] Batch job has started.', new List<String> { batchName }));
    }
    
    public void stopLogging() {
        System.debug(String.format('[ {0} ] Batch job done. Total amount of processed records: {1} ({2} errors). Total time of the job in milliseconds: {3}.',
                                   new List<String> {
                                       String.valueOf(ArtistsRemovalBatch.class),
                                       String.valueOf(this.successesCount + this.errorsCount),
                                       String.valueOf(errorsCount),
                                       String.valueOf(Datetime.now().millisecond() - startTimeInMilliseconds) }
                                  ));
    }
    
    public void logErrorMessage(String message) {
        System.debug(String.format('[ {0} ] Error occurred: {1}.', new List<String> { batchName, message }));
    }
    
    public void incrementSuccessesCount() {
        this.successesCount++;
    }

    public void incrementErrorsCount() {
        this.errorsCount++;
    }
}