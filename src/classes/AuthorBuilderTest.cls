@isTest
private class AuthorBuilderTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Author__c author = new AuthorBuilder()
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withBirthplace(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withDateOfBirth(MBMS_Constants.MBMS_TEST_DATE_200_DAYS_BEFORE_TODAY)
            .withDateOfDeath(MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY)
            .withDescription(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .buildAndInsert();
    }
    
    @isTest
    static void authorShouldNotBeNull() {
        Test.startTest();        
        MBMS_Author__c author = [SELECT Id
                                 FROM MBMS_Author__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, author);
    }
    
    @isTest
    static void authorShouldHaveAName() {
        Test.startTest();        
        MBMS_Author__c author = [SELECT Name
                                 FROM MBMS_Author__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, author.Name);
    }
    
    @isTest
    static void authorShouldHaveABirthPlace() {
        Test.startTest();        
        MBMS_Author__c author = [SELECT MBMS_Birthplace__c
                                 FROM MBMS_Author__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, author.MBMS_Birthplace__c);
    }
    
    @isTest
    static void authorShouldHaveADateOfBirth() {
        Test.startTest();        
        MBMS_Author__c author = [SELECT MBMS_Date_of_Birth__c
                                 FROM MBMS_Author__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_DATE_200_DAYS_BEFORE_TODAY, author.MBMS_Date_of_Birth__c);
    }
    
    @isTest
    static void authorShouldHaveADateOfDeath() {
        Test.startTest();        
        MBMS_Author__c author = [SELECT MBMS_Date_of_Death__c
                                 FROM MBMS_Author__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY, author.MBMS_Date_of_Death__c);
    }
    
    @isTest
    static void authorShouldHaveADescription() {
        Test.startTest();        
        MBMS_Author__c author = [SELECT MBMS_Description__c
                                 FROM MBMS_Author__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, author.MBMS_Description__c);
    }
}