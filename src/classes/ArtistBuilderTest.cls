@isTest
private class ArtistBuilderTest {
    @testSetup
    static void testDataSetup() {
        new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void artistShouldNotBeNull() {
        Test.startTest();        
        MBMS_Artist__c artist = new ArtistBuilder()
            .create()
            .build();
        Test.stopTest();
        
        System.assertNotEquals(null, artist);
    }

    @isTest
    static void insertedArtistShouldNotBeNull() {
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
        
        artist.Name = MBMS_Constants.MBMS_TEST_STRING_VALUE;
        update artist;
        
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artist.Name);
    }
    
    @isTest
    static void artistShouldHaveAFirstName() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_First_Name__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artist.MBMS_First_Name__c);
    }
    
    @isTest
    static void artistShouldHaveALastName() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Last_Name__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artist.MBMS_Last_Name__c);
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
    
    @isTest
    static void artistShouldHaveARole() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Roles__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        List<String> roles = artist.MBMS_Roles__c.split(MBMS_Constants.MBMS_SEMICOLON);
        
        System.assert(roles.size() > 0);
        System.assertEquals(MBMS_Constants.MBMS_ROLE_AUTHOR, roles.get(0));
    }

    @isTest
    static void artistShouldHaveAStatus() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Status__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_STATUS_APPROVED, artist.MBMS_Status__c);
    }
    
    @isTest
    static void artistShouldHaveAStatusComment() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Status_Comment__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT, artist.MBMS_Status_Comment__c);
    }
}