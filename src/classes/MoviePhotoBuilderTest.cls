@isTest
private class MoviePhotoBuilderTest {
    @testSetup
    static void testDataSetup() {
        new MoviePhotoBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void moviePhotoShouldNotBeNull() {
        Test.startTest();        
        MBMS_Movie_Photo__c moviePhoto = new MoviePhotoBuilder()
            .create()
            .build();
        Test.stopTest();
        
        System.assertNotEquals(null, moviePhoto);
    }
    
    @isTest
    static void insertedMoviePhotoShouldNotBeNull() {
        Test.startTest();        
        MBMS_Movie_Photo__c moviePhoto = [SELECT Id
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, moviePhoto);
    }
    
    @isTest
    static void moviePhotoShouldHaveAMovie() {
        Test.startTest();        
        MBMS_Movie_Photo__c moviePhoto = [SELECT MBMS_Movie__c
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, moviePhoto.MBMS_Movie__c);
    }

    @isTest
    static void moviePhotoShouldHaveAPhotoURL() {
        Test.startTest();
        MBMS_Movie_Photo__c moviePhoto = [SELECT MBMS_Photo_URL__c
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, moviePhoto.MBMS_Photo_URL__c);
    }

    @isTest
    static void moviePhotoShouldHaveAStatus() {
        Test.startTest();        
        MBMS_Movie_Photo__c moviePhoto = [SELECT MBMS_Status__c
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_STATUS_APPROVED, moviePhoto.MBMS_Status__c);
    }
    
    @isTest
    static void moviePhotoShouldHaveAStatusComment() {
        Test.startTest();        
        MBMS_Movie_Photo__c moviePhoto = [SELECT MBMS_Status_Comment__c
                                          FROM MBMS_Movie_Photo__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT, moviePhoto.MBMS_Status_Comment__c);
    }
}