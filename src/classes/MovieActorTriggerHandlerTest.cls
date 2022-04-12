@isTest
private class MovieActorTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        new MovieActorBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void triggerShouldUpdateMovieActorName() {
        Test.startTest();
        MBMS_Movie_Actor__c movieActor = [SELECT Name, MBMS_Artist__r.Name, MBMS_Character_Name__c
                                          FROM MBMS_Movie_Actor__c
                                          LIMIT 1];
        Test.stopTest();
        
        String expectedName = String.format('{0} as {1}', new List<String> { movieActor.MBMS_Artist__r.Name, movieActor.MBMS_Character_Name__c });
        
		System.assertEquals(expectedName, movieActor.Name, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Name', expectedName }));
    }
}