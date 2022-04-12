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
        
        System.assertNotEquals(null, movieActor, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Movie_Actor__c' }));
    }
    
    @isTest
    static void insertedMovieActorShouldNotBeNull() {
        Test.startTest();        
        MBMS_Movie_Actor__c movieActor = [SELECT Id
                                          FROM MBMS_Movie_Actor__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, movieActor, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Movie_Actor__c' }));
    }
    
    @isTest
    static void movieActorShouldHaveActor() {
        Test.startTest();        
        MBMS_Movie_Actor__c movieActor = [SELECT MBMS_Artist__c
                                          FROM MBMS_Movie_Actor__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, movieActor.MBMS_Artist__c, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist__c' }));
    }
    
    @isTest
    static void movieActorShouldHaveMovie() {
        Test.startTest();        
        MBMS_Movie_Actor__c movieActor = [SELECT MBMS_Movie__c
                                          FROM MBMS_Movie_Actor__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, movieActor.MBMS_Movie__c, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Movie__c' }));
    }
    
    @isTest
    static void movieActorShouldHaveCharacterName() {
        Test.startTest();        
        MBMS_Movie_Actor__c movieActor = [SELECT MBMS_Character_Name__c
                                          FROM MBMS_Movie_Actor__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, movieActor.MBMS_Character_Name__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Character_Name__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
}