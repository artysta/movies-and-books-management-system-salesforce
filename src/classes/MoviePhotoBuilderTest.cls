@isTest
private class MoviePhotoBuilderTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new MoviePhotoBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void moviePhotoShouldNotBeNull() {
        MBMS_Movie_Photo__c moviePhoto = new MoviePhotoBuilder()
            .create()
            .build();
        
        System.assertNotEquals(null, moviePhoto, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Movie_Photo__c' }));
    }
    
    @isTest
    static void insertedMoviePhotoShouldNotBeNull() {
        MBMS_Movie_Photo__c moviePhoto = [SELECT Id
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        
        System.assertNotEquals(null, moviePhoto, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Movie_Photo__c' }));
    }
    
    @isTest
    static void moviePhotoShouldHaveMovie() {
        MBMS_Movie_Photo__c moviePhoto = [SELECT MBMS_Movie__c
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        
        System.assertNotEquals(null, moviePhoto.MBMS_Movie__c, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Movie__c' }));
    }

    @isTest
    static void moviePhotoShouldHavePhotoURL() {
        MBMS_Movie_Photo__c moviePhoto = [SELECT MBMS_Photo_URL__c
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, moviePhoto.MBMS_Photo_URL__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Photo_URL__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }

    @isTest
    static void moviePhotoShouldHaveStatus() {
        MBMS_Movie_Photo__c moviePhoto = [SELECT MBMS_Status__c
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        
        System.assertEquals(MBMS_Constants.MBMS_STATUS_APPROVED, moviePhoto.MBMS_Status__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status__c', MBMS_Constants.MBMS_STATUS_APPROVED }));
    }
    
    @isTest
    static void moviePhotoShouldHaveStatusComment() {
        MBMS_Movie_Photo__c moviePhoto = [SELECT MBMS_Status_Comment__c
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        
        System.assertEquals(MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT, moviePhoto.MBMS_Status_Comment__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c', MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT }));
    }
}