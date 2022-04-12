@isTest
private class MBMS_UtilitiesTest {
    @isTest
    static void shouldReturnValidCustomObjectName() {
        Test.startTest();
        MBMS_Movie_Actor__c movieActor = new MovieActorBuilder().create().buildWithAllFieldsAndInsert();
        Test.stopTest();
        
        System.assertEquals('Movie Actor', MBMS_Utilities.getObjectName(movieActor.Id), String.format(MBMS_Constants.NAME_OF_SOBJECT_SHOULD_BE, new List<String> { 'MBMS_Movie_Actor__c', 'Movie Actor' }));
    }
    
    @isTest
    static void shouldReturnValidStandardObjectName() {
        Test.startTest();
        Case caseObject = new Case();
        insert caseObject;
        Test.stopTest();
        
        System.assertEquals('Case', MBMS_Utilities.getObjectName(caseObject.Id), String.format(MBMS_Constants.NAME_OF_SOBJECT_SHOULD_BE, new List<String> { 'Case', 'Case' }));
    }
    
    @isTest
    static void shouldReturnRandomNumber() {
        Integer min = 5;
        Integer max = 10;
        
        Test.startTest();
        Integer randomNumber = MBMS_Utilities.getRandomNumber(max);
        System.assert(randomNumber >= 0, String.format(MBMS_Constants.VALUE_SHOULD_BE_GREATER_OR_EQUAL_TO_PATTERN, new List<String> { 'randomNumber', '0' }));
        System.assert(randomNumber <= max, String.format(MBMS_Constants.VALUE_SHOULD_BE_LESS_OR_EQUAL_TO_PATTERN, new List<String> { 'randomNumber', String.valueOf(max) }));
        
        randomNumber = MBMS_Utilities.getRandomNumber(min, max);
        System.assert(randomNumber >= min, String.format(MBMS_Constants.VALUE_SHOULD_BE_GREATER_OR_EQUAL_TO_PATTERN, new List<String> { 'randomNumber', String.valueOf(min) }));
        System.assert(randomNumber <= max, String.format(MBMS_Constants.VALUE_SHOULD_BE_LESS_OR_EQUAL_TO_PATTERN, new List<String> { 'randomNumber', String.valueOf(max) }));
        Test.stopTest();
    }
    
    @isTest
    static void shouldReturnRandomPastDate() {
        Test.startTest();
        Date pastDate = MBMS_Utilities.getRandomPastDate(10, 50, 12, 30);
        Test.stopTest();
        
        System.assertNotEquals(null, pastDate, String.format(MBMS_Constants.VALUE_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'pastDate' }));
        System.assert(pastDate < Date.today(), String.format(MBMS_Constants.VALUE_SHOULD_BE_LESS_THAN_PATTERN, new List<String> { 'pastDate', String.valueOf(Date.today()) }));
    }
}