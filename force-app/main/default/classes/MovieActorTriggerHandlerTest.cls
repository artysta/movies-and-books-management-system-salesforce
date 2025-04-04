@isTest
private class MovieActorTriggerHandlerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new MovieActorBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void triggerShouldUpdateMovieActorName() {
        MBMS_Movie_Actor__c movieActor = [
            SELECT
                Name,
                MBMS_Artist__r.Name,
                MBMS_Character_Name__c
            FROM MBMS_Movie_Actor__c
            LIMIT 1
        ];
        
        String expectedName = String.format('{0} as {1}', new List<String> { movieActor.MBMS_Artist__r.Name, movieActor.MBMS_Character_Name__c });
        
		System.assertEquals(expectedName, movieActor.Name, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Name', expectedName }));
    }
}