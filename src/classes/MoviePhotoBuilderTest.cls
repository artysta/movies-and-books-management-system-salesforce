@isTest
private class MoviePhotoBuilderTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Movie__c movie = new MovieBuilder()
            .buildAndInsert();
        
        MBMS_Movie_Photo__c moviePhoto = new MoviePhotoBuilder()
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withMovie(movie)
            .withPhotoURL(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .buildAndInsert();
    }
    
    @isTest
    static void moviePhotoShouldNotBeNull() {
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
    static void bookShouldHaveAPhotoURL() {
        Test.startTest();
        MBMS_Movie_Photo__c book = [SELECT MBMS_Photo_URL__c
                                    FROM MBMS_Movie_Photo__c
                                    LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, book.MBMS_Photo_URL__c);
    }
}