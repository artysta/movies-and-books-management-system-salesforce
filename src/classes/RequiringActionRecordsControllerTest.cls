@isTest
private class RequiringActionRecordsControllerTest {
    @testSetup
    static void testDataSetup() {
        // TODO: Create builder or factory class for User object (+ some constant values).
        Profile profile = [SELECT Id FROM Profile LIMIT 1];

        User user = new User();
        user.LastName = MBMS_Constants.MBMS_TEST_STRING_VALUE;
        user.Email = 'test1@test.pl';
        user.Alias = 'test';
        user.Username = 'test123@test.pl';
        user.CommunityNickname = MBMS_Constants.MBMS_TEST_STRING_VALUE;
        user.LocaleSidKey = 'en_US';
        user.TimeZoneSidKey = 'GMT';
        user.ProfileId = profile.Id;
        user.LanguageLocaleKey = 'en_US';
        user.EmailEncodingKey = 'UTF-8';
        insert user;

        new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void  shouldReturnEmptyListOfRequiringActionRecords() {
        Test.startTest();
        List<MBMS_Artist__c> artists = [SELECT Id FROM MBMS_Artist__c];
        delete artists;
        
        List<sObject> requiringActionRecords = RequiringActionRecordsController.getRequiringActionRecords();
        Test.stopTest();
        
        System.assertEquals(0, requiringActionRecords.size(), String.format(MBMS_Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'requiringActionRecords', '0' }));
    }
    
    @isTest
    static void  shouldReturnNotEmptyListOfRequiringActionRecords() {
        Test.startTest();
        List<MBMS_Artist__c> artists = [SELECT Id FROM MBMS_Artist__c];
        
        for (MBMS_Artist__c artist : artists) {
            artist.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_REJECTED;
        }
        
        update artists;
        
        List<sObject> requiringActionRecords = RequiringActionRecordsController.getRequiringActionRecords();
        Test.stopTest();
        
        System.assert(requiringActionRecords.size() > 0, String.format(MBMS_Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'requiringActionRecords', '0' }));
        System.assertNotEquals(null, requiringActionRecords.get(0), String.format(MBMS_Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL, new List<String> { 'requiringActionRecords' }));
    }
    
    @isTest
    static void requiringActionRecordsShouldNotBeAvailable() {
        Test.startTest();
        MBMS_Artist__c artist = [SELECT Id FROM MBMS_Artist__c LIMIT 1];
        delete artist;
        
        Boolean areRequiringActionRecordsAvailable = RequiringActionRecordsController.areRequiringActionRecordsAvailable();
        Test.stopTest();
        
        System.assert(!areRequiringActionRecordsAvailable, String.format(MBMS_Constants.VALUE_SHOULD_BE_FALSE, new List<String> { 'areRequiringActionRecordsAvailable' }));
    }
    
    @isTest
    static void requiringActionRecordsShouldBeAvailable() {
        Test.startTest();
        List<MBMS_Artist__c> artists = [SELECT Id FROM MBMS_Artist__c];
        
        for (MBMS_Artist__c artist : artists) {
            artist.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_REJECTED;
        }
        
        update artists;
        
        Boolean areRequiringActionRecordsAvailable = RequiringActionRecordsController.areRequiringActionRecordsAvailable();
        Test.stopTest();
        
        System.assert(areRequiringActionRecordsAvailable, String.format(MBMS_Constants.VALUE_SHOULD_BE_TRUE, new List<String> { 'areRequiringActionRecordsAvailable' }));
    }

    @isTest
    static void userShouldBeAbleToSeeTheComponent() {
        User user = [SELECT Id FROM User WHERE Email = 'test1@test.pl' LIMIT 1];
        System.runAs(user) {
            Test.startTest();

            Group queue = [SELECT Id
                           FROM Group
                           WHERE Type = :MBMS_Constants.QUEUE_GROUP_TYPE
                           AND Name = :MBMS_Constants.APPROVERS_QUEUE];

            GroupMember groupMember = new GroupMember();
            groupMember.UserOrGroupId = user.Id;
            groupMember.GroupId = queue.Id;
            insert groupMember;

            Boolean isUserAbleToSeeTheComponent = RequiringActionRecordsController.shouldUserBeAbleToSeeTheComponent();
            Test.stopTest();

            System.assert(isUserAbleToSeeTheComponent, String.format(MBMS_Constants.VALUE_SHOULD_BE_TRUE, new List<String> { 'isUserAbleToSeeTheComponent' }));
        }
    }

    @isTest
    static void userShouldNotBeAbleToSeeTheComponent() {
        User user = [SELECT Id FROM User WHERE Email = 'test1@test.pl' LIMIT 1];
        System.runAs(user) {
            Test.startTest();
            Boolean isUserAbleToSeeTheComponent = RequiringActionRecordsController.shouldUserBeAbleToSeeTheComponent();
            Test.stopTest();

            System.assert(!isUserAbleToSeeTheComponent, String.format(MBMS_Constants.VALUE_SHOULD_BE_FALSE, new List<String> { 'isUserAbleToSeeTheComponent' }));
        }
    }
}