@isTest
private class UtilitiesTest {
    @isTest
    static void shouldReturnValidCustomObjectName() {
        MBMS_Movie_Actor__c movieActor = new MovieActorBuilder().create().buildWithAllFieldsAndInsert();
        
        Test.startTest();
        String objectName = Utilities.getObjectName(movieActor.Id);
        Test.stopTest();
        
        System.assertEquals('Movie Actor', objectName, String.format(Constants.NAME_OF_SOBJECT_SHOULD_BE, new List<String> { 'MBMS_Movie_Actor__c', 'Movie Actor' }));
    }
    
    @isTest
    static void shouldReturnValidStandardObjectName() {
        Case caseObject = new Case();
        insert caseObject;

        Test.startTest();
        String objectName = Utilities.getObjectName(caseObject.Id);
        Test.stopTest();
        
        System.assertEquals('Case', objectName, String.format(Constants.NAME_OF_SOBJECT_SHOULD_BE, new List<String> { 'Case', 'Case' }));
    }
    
    @isTest
    static void shouldReturnRandomNumber() {
        Integer min = 5;
        Integer max = 10;
        
        Test.startTest();
        Integer randomNumber = Utilities.getRandomNumber(max);
        Integer randomNumber2 = Utilities.getRandomNumber(min, max);
        Test.stopTest();

        System.assert(randomNumber >= 0, String.format(Constants.VALUE_SHOULD_BE_GREATER_OR_EQUAL_TO_PATTERN, new List<String> { 'randomNumber', '0' }));
        System.assert(randomNumber <= max, String.format(Constants.VALUE_SHOULD_BE_LESS_OR_EQUAL_TO_PATTERN, new List<String> { 'randomNumber', String.valueOf(max) }));
        System.assert(randomNumber2 >= min, String.format(Constants.VALUE_SHOULD_BE_GREATER_OR_EQUAL_TO_PATTERN, new List<String> { 'randomNumber2', String.valueOf(min) }));
        System.assert(randomNumber2 <= max, String.format(Constants.VALUE_SHOULD_BE_LESS_OR_EQUAL_TO_PATTERN, new List<String> { 'randomNumber2', String.valueOf(max) }));
    }
    
    @isTest
    static void shouldReturnRandomPastDate() {
        Test.startTest();
        Date pastDate = Utilities.getRandomPastDate(10, 50, 12, 30);
        Test.stopTest();
        
        System.assertNotEquals(null, pastDate, String.format(Constants.VALUE_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'pastDate' }));
        System.assert(pastDate < Date.today(), String.format(Constants.VALUE_SHOULD_BE_LESS_THAN_PATTERN, new List<String> { 'pastDate', String.valueOf(Date.today()) }));
    }
}