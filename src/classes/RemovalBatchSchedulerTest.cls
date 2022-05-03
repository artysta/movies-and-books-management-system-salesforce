@isTest
private class RemovalBatchSchedulerTest {
    @isTest
    static void shouldSuccessfullyScheduleJob() {
        Test.startTest();
        System.schedule(RemovalBatchScheduler.class.getName(), Constants.CRON_EXP, new RemovalBatchScheduler());
        Test.stopTest();
        
        List<AsyncApexJob> scheduledApexJobs = [SELECT Id FROM AsyncApexJob WHERE JobType = :Constants.SCHEDULED_APEX];
        List<AsyncApexJob> batchApexJobs = [SELECT Id FROM AsyncApexJob WHERE JobType = :Constants.BATCH_APEX];

        System.assertEquals(1, scheduledApexJobs.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'scheduledApexJobs', '1' }));
        System.assertEquals(3, batchApexJobs.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'batchApexJobs', '3' }));
    }
}