@isTest
private class ArtistBuilderTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Artist__c artist = new ArtistBuilder()
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withBirthplace(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withDateOfBirth(MBMS_Constants.MBMS_TEST_DATE_200_DAYS_BEFORE_TODAY)
            .withDateOfDeath(MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY)
            .withDescription(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .buildAndInsert();
    }
    
    @isTest
    static void artistShouldNotBeNull() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT Id
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, artist);
    }
    
    @isTest
    static void artistShouldHaveAName() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT Name
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artist.Name);
    }
    
    @isTest
    static void artistShouldHaveABirthPlace() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Birthplace__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artist.MBMS_Birthplace__c);
    }
    
    @isTest
    static void artistShouldHaveADateOfBirth() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Date_of_Birth__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_DATE_200_DAYS_BEFORE_TODAY, artist.MBMS_Date_of_Birth__c);
    }
    
    @isTest
    static void artistShouldHaveADateOfDeath() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Date_of_Death__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY, artist.MBMS_Date_of_Death__c);
    }
    
    @isTest
    static void artistShouldHaveADescription() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Description__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artist.MBMS_Description__c);
    }
}