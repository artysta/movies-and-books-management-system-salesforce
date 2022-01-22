@isTest
private class MovieActorBuilderTest {
    @testSetup
    static void testDataSetup() {       
        new MovieActorBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void movieActorShouldNotBeNull() {
        Test.startTest();        
        MBMS_Movie_Actor__c movieActor = new MovieActorBuilder()
            .create()
            .build();
        Test.stopTest();
        
        System.assertNotEquals(null, movieActor);
    }
    
    @isTest
    static void insertedMovieActorShouldNotBeNull() {
        Test.startTest();        
        MBMS_Movie_Actor__c movieActor = [SELECT Id
                                          FROM MBMS_Movie_Actor__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, movieActor);
    }
    
    @isTest
    static void movieActorShouldHaveAnActor() {
        Test.startTest();        
        MBMS_Movie_Actor__c movieActor = [SELECT MBMS_Artist__c
                                          FROM MBMS_Movie_Actor__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, movieActor.MBMS_Artist__c);
    }
    
    @isTest
    static void movieActorShouldHaveAMovie() {
        Test.startTest();        
        MBMS_Movie_Actor__c movieActor = [SELECT MBMS_Movie__c
                                          FROM MBMS_Movie_Actor__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, movieActor.MBMS_Movie__c);
    }
}