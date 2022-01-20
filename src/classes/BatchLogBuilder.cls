public class BatchLogBuilder {
    private MBMS_Batch_Log__c batchLog;
    
    public BatchLogBuilder createNewRecord() {
        this.batchLog = new MBMS_Batch_Log__c();
        return this;
    }
    
    public BatchLogBuilder withName(String name) {
        this.batchLog.Name = name;
        return this;
    }
    
    public BatchLogBuilder withBatchName(String batchName) {
        this.batchLog.MBMS_Batch_Name__c = batchName;
        return this;
    }
    
    public BatchLogBuilder withMessage(String message) {
        this.batchLog.MBMS_Message__c = message;
        return this;
    }
    
    public BatchLogBuilder withRecordsProcessed(Integer recordsProcessed) {
        this.batchLog.MBMS_Records_Processed__c = recordsProcessed;
        return this;
    }
    
    public MBMS_Batch_Log__c buildWithAllFields() {
        return this
            .createNewRecord()
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withMessage(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withRecordsProcessed(MBMS_Constants.MBMS_TEST_NUMBER)
            .build();
    }
    
    public MBMS_Batch_Log__c buildWithAllFieldsAndInsert() {
        this.batchLog = this.buildWithAllFields();
        insert this.batchLog;
        return this.batchLog;
    }
    
    public MBMS_Batch_Log__c build() {
        return this.batchLog;
    }
    
    public MBMS_Batch_Log__c buildAndInsert() {
        insert this.batchLog;
        return this.build();
    }
}