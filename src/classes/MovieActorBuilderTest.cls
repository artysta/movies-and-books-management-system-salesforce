@isTest
private class MovieActorBuilderTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Artist__c artist = new ArtistBuilder()
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_AUTHOR, MBMS_Constants.MBMS_ROLE_ACTOR })
            .buildAndInsert();
        
        MBMS_Movie__c movie = new MovieBuilder()
            .buildAndInsert();
    }
    
    @isTest
    static void movieShouldNotBeNull() {
        Test.startTest();        
        MBMS_Movie__c movie = [SELECT Id
                               FROM MBMS_Movie__c
                               LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, movie);
    }
}