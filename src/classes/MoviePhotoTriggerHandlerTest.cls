@isTest
private class MoviePhotoTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        MBMS_Movie_Photo__c book = new MoviePhotoBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void triggerShouldUpdateMoviePhotoStatusComment() {
        MBMS_Movie_Photo__c moviePhoto = [SELECT MBMS_Status_Comment__c
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        
        System.assertEquals(Constants.INITIAL_STATUS_COMMENT, moviePhoto.MBMS_Status_Comment__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c', Constants.INITIAL_STATUS_COMMENT }));
    }

    @isTest
    static void triggerShouldUpdateRecordOwner() {
        MBMS_Movie_Photo__c moviePhoto = [SELECT OwnerId
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];  
        moviePhoto.MBMS_Status__c = Constants.STATUS_REJECTED;

        Test.startTest();
        update moviePhoto;
        Test.stopTest();

        Group approversQueue = [SELECT Id
                                FROM Group WHERE Type = :Constants.QUEUE_GROUP_TYPE
                                AND Name = :Constants.APPROVERS_QUEUE
                                LIMIT 1];

        moviePhoto = [SELECT OwnerId
                      FROM MBMS_Movie_Photo__c
                      LIMIT 1];
        
        System.assertEquals(approversQueue.Id, moviePhoto.OwnerId, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'OwnerId', approversQueue.Id }));
    }
    
    @isTest
    static void triggerShouldUpdatePreviousStatus() {
        MBMS_Movie_Photo__c moviePhoto = [SELECT MBMS_Status__c
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        String expectedPreviousStatus = moviePhoto.MBMS_Status__c;
        moviePhoto.MBMS_Status__c = Constants.STATUS_REJECTED;

        Test.startTest();
        update moviePhoto;
        Test.stopTest();

        moviePhoto = [SELECT MBMS_Previous_Status__c
                      FROM MBMS_Movie_Photo__c
                      LIMIT 1];
        
        System.assertEquals(expectedPreviousStatus, moviePhoto.MBMS_Previous_Status__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Previous_Status__c', expectedPreviousStatus }));
    }
}