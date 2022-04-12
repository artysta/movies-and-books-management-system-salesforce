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
        
        System.assertNotEquals(null, artist, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist__c' }));
    }

    @isTest
    static void insertedArtistShouldNotBeNull() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT Id
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, artist, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist__c' }));
    }
    
    @isTest
    static void artistShouldHaveName() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT Name
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        
        artist.Name = MBMS_Constants.MBMS_TEST_STRING_VALUE;
        update artist;
        
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artist.Name, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveFirstName() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_First_Name__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artist.MBMS_First_Name__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_First_Name__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveLastName() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Last_Name__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artist.MBMS_Last_Name__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Last_Name__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveBirthPlace() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Birthplace__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();

        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artist.MBMS_Birthplace__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Birthplace__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveDateOfBirth() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Date_of_Birth__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        System.assertEquals(MBMS_Constants.MBMS_TEST_DATE_200_DAYS_BEFORE_TODAY, artist.MBMS_Date_of_Birth__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Date_of_Birth__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveDateOfDeath() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Date_of_Death__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();

        System.assertEquals(MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY, artist.MBMS_Date_of_Death__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Date_of_Death__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveDescription() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Description__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artist.MBMS_Description__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Description__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveRole() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Roles__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        List<String> roles = artist.MBMS_Roles__c.split(MBMS_Constants.MBMS_SEMICOLON);
        
        System.assert(roles.size() > 0, String.format(MBMS_Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'Roles', '0' }));
        System.assertEquals(MBMS_Constants.MBMS_ROLE_AUTHOR, roles.get(0), String.format(MBMS_Constants.FIELD_SHOULD_CONTAIN_PATTERN, new List<String> { 'MBMS_Roles__c', MBMS_Constants.MBMS_ROLE_AUTHOR }));
    }

    @isTest
    static void artistShouldHaveStatus() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Status__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_STATUS_APPROVED, artist.MBMS_Status__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status__c', MBMS_Constants.MBMS_STATUS_APPROVED }));
    }
    
    @isTest
    static void artistShouldHaveStatusComment() {
        Test.startTest();        
        MBMS_Artist__c artist = [SELECT MBMS_Status_Comment__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT, artist.MBMS_Status_Comment__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c', MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT }));
    }
}