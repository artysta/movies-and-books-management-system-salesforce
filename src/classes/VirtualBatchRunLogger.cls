public virtual class VirtualBatchRunLogger {
    private BatchRunLogger logger;
    
    public VirtualBatchRunLogger(String batchName) {    
        this.logger = new BatchRunLogger(batchName);
    }
    
    public void startLogging() {
        logger.startLogging();
    }
    
    public void stopLogging() {
        logger.stopLogging();
    }
    
    public void logErrorMessage(String message) {
        logger.logErrorMessage(message);
    }
    
    public void incrementSuccessesCount() {
        logger.incrementSuccessesCount();
    }
}