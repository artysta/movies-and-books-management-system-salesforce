@isTest
private class MBMS_UtilitiesTest {
    @isTest
    static void shouldReturnValidCustomObjectName() {
        Test.startTest();
        MBMS_Movie_Actor__c movieActor = new MovieActorBuilder().create().buildWithAllFieldsAndInsert();
        Test.stopTest();
        
        System.assertEquals('Movie Actor', MBMS_Utilities.getObjectName(movieActor.Id));
    }
    
    @isTest
    static void shouldReturnValidStandardObjectName() {
        Test.startTest();
        Case caseObject = new Case();
        insert caseObject;
        Test.stopTest();
        
        System.assertEquals('Case', MBMS_Utilities.getObjectName(caseObject.Id));
    }
    
    @isTest
    static void shouldReturnRandomNumber() {
        Integer min = 5;
        Integer max = 10;
        
        Test.startTest();
        Integer randomNumber = MBMS_Utilities.getRandomNumber(max);
        System.assert(randomNumber >= 0);
        System.assert(randomNumber <= max);
        
        randomNumber = MBMS_Utilities.getRandomNumber(min, max);
        System.assert(randomNumber >= min);
        System.assert(randomNumber <= max);
        Test.stopTest();
    }
    
    @isTest
    static void shouldReturnRandomPastDate() {
        Test.startTest();
        Date pastDate = MBMS_Utilities.getRandomPastDate(10, 50, 12, 30);
        Test.stopTest();
        
        System.assertNotEquals(null, pastDate);
        System.assert(pastDate < Date.today());
    }
}