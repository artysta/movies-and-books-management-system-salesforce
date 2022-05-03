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
        MBMS_Artist__c artist = new ArtistBuilder()
            .create()
            .build();
        
        System.assertNotEquals(null, artist, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist__c' }));
    }

    @isTest
    static void insertedArtistShouldNotBeNull() {
        MBMS_Artist__c artist = [SELECT Id
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        
        System.assertNotEquals(null, artist, String.format(Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist__c' }));
    }
    
    @isTest
    static void artistShouldHaveName() {
        MBMS_Artist__c artist = [SELECT Name
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        
        artist.Name = Constants.TEST_STRING_VALUE;
        update artist;
        
        System.assertEquals(Constants.TEST_STRING_VALUE, artist.Name, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveFirstName() {
        MBMS_Artist__c artist = [SELECT MBMS_First_Name__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        
        System.assertEquals(Constants.TEST_STRING_VALUE, artist.MBMS_First_Name__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_First_Name__c', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveLastName() {
        MBMS_Artist__c artist = [SELECT MBMS_Last_Name__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        
        System.assertEquals(Constants.TEST_STRING_VALUE, artist.MBMS_Last_Name__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Last_Name__c', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveBirthPlace() {
        MBMS_Artist__c artist = [SELECT MBMS_Birthplace__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];

        System.assertEquals(Constants.TEST_STRING_VALUE, artist.MBMS_Birthplace__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Birthplace__c', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveDateOfBirth() {
        MBMS_Artist__c artist = [SELECT MBMS_Date_of_Birth__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        System.assertEquals(Constants.TEST_DATE_200_DAYS_BEFORE_TODAY, artist.MBMS_Date_of_Birth__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Date_of_Birth__c', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveDateOfDeath() {
        MBMS_Artist__c artist = [SELECT MBMS_Date_of_Death__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];

        System.assertEquals(Constants.TEST_DATE_10_DAYS_BEFORE_TODAY, artist.MBMS_Date_of_Death__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Date_of_Death__c', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveDescription() {
        MBMS_Artist__c artist = [SELECT MBMS_Description__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        
        System.assertEquals(Constants.TEST_STRING_VALUE, artist.MBMS_Description__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Description__c', Constants.TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistShouldHaveRole() {
        MBMS_Artist__c artist = [SELECT MBMS_Roles__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        
        List<String> roles = artist.MBMS_Roles__c.split(';');
        
        System.assert(roles.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'Roles', '0' }));
        System.assertEquals(Constants.ROLE_AUTHOR, roles.get(0), String.format(Constants.FIELD_SHOULD_CONTAIN_PATTERN, new List<String> { 'MBMS_Roles__c', Constants.ROLE_AUTHOR }));
    }

    @isTest
    static void artistShouldHaveStatus() {
        MBMS_Artist__c artist = [SELECT MBMS_Status__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        
        System.assertEquals(Constants.STATUS_APPROVED, artist.MBMS_Status__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status__c', Constants.STATUS_APPROVED }));
    }
    
    @isTest
    static void artistShouldHaveStatusComment() {
        MBMS_Artist__c artist = [SELECT MBMS_Status_Comment__c
                                 FROM MBMS_Artist__c
                                 LIMIT 1];
        
        System.assertEquals(Constants.INITIAL_STATUS_COMMENT, artist.MBMS_Status_Comment__c, String.format(Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c', Constants.INITIAL_STATUS_COMMENT }));
    }
}