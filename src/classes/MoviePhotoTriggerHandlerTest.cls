@isTest
private class MoviePhotoTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Movie_Photo__c book = new MoviePhotoBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void triggerShouldUpdateMoviePhotoStatusComment() {
        Test.startTest();
        MBMS_Movie_Photo__c moviePhoto = [SELECT MBMS_Status_Comment__c
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT, moviePhoto.MBMS_Status_Comment__c);
    }
}