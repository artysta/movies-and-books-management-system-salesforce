@isTest
private class MovieTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        new MovieBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void triggerShouldUpdateMovieName() {
        Test.startTest();
        MBMS_Movie__c movie = [SELECT Name, MBMS_Title__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(movie.MBMS_Title__c, movie.Name);
    }
}