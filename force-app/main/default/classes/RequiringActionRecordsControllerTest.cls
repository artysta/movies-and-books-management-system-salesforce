@isTest
private class RequiringActionRecordsControllerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new UserBuilder()
            .create()
            .buildWithAllFieldsAndInsert();

        new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void  shouldReturnEmptyListOfRequiringActionRecords() {
        List<MBMS_Artist__c> artists = [
            SELECT
                Id
            FROM MBMS_Artist__c
        ];
        
        delete artists;
        
        Test.startTest();
        List<sObject> requiringActionRecords = RequiringActionRecordsController.getRequiringActionRecords();
        Test.stopTest();
        
        System.assertEquals(0, requiringActionRecords.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'requiringActionRecords', '0' }));
    }
    
    @isTest
    static void  shouldReturnNotEmptyListOfRequiringActionRecords() {
        List<MBMS_Artist__c> artists = [
            SELECT
                Id
            FROM MBMS_Artist__c
        ];
        
        for (MBMS_Artist__c artist : artists) {
            artist.MBMS_Status__c = Constants.STATUS_REJECTED;
        }
        
        update artists;
        
        Test.startTest();
        List<sObject> requiringActionRecords = RequiringActionRecordsController.getRequiringActionRecords();
        Test.stopTest();
        
        System.assert(requiringActionRecords.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'requiringActionRecords', '0' }));
        System.assertNotEquals(null, requiringActionRecords.get(0), String.format(Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL, new List<String> { 'requiringActionRecords' }));
    }
    
    @isTest
    static void requiringActionRecordsShouldNotBeAvailable() {
        MBMS_Artist__c artist = [
            SELECT
                Id
            FROM MBMS_Artist__c
            LIMIT 1
        ];
        
        delete artist;
        
        Test.startTest();
        Boolean areRequiringActionRecordsAvailable = RequiringActionRecordsController.areRequiringActionRecordsAvailable();
        Test.stopTest();
        
        System.assert(!areRequiringActionRecordsAvailable, String.format(Constants.VALUE_SHOULD_BE_FALSE, new List<String> { 'areRequiringActionRecordsAvailable' }));
    }
    
    @isTest
    static void requiringActionRecordsShouldBeAvailable() {
        List<MBMS_Artist__c> artists = [
            SELECT
                Id
            FROM MBMS_Artist__c
        ];
        
        for (MBMS_Artist__c artist : artists) {
            artist.MBMS_Status__c = Constants.STATUS_REJECTED;
        }
        
        update artists;
        
        Test.startTest();
        Boolean areRequiringActionRecordsAvailable = RequiringActionRecordsController.areRequiringActionRecordsAvailable();
        Test.stopTest();
        
        System.assert(areRequiringActionRecordsAvailable, String.format(Constants.VALUE_SHOULD_BE_TRUE, new List<String> { 'areRequiringActionRecordsAvailable' }));
    }

    @isTest
    static void userShouldBeAbleToSeeTheComponent() {
        User user = [
            SELECT
                Id
            FROM User
            WHERE Email = :Constants.EMAIL LIMIT 1
        ];
        
        System.runAs(user) {
            Group queue = SObjectsSelector.getApproversQueue();

            GroupMember groupMember = new GroupMember();
            groupMember.UserOrGroupId = user.Id;
            groupMember.GroupId = queue.Id;
            insert groupMember;

            Test.startTest();
            Boolean isUserAbleToSeeTheComponent = RequiringActionRecordsController.shouldUserBeAbleToSeeTheComponent();
            Test.stopTest();

            System.assert(isUserAbleToSeeTheComponent, String.format(Constants.VALUE_SHOULD_BE_TRUE, new List<String> { 'isUserAbleToSeeTheComponent' }));
        }
    }

    @isTest
    static void userShouldNotBeAbleToSeeTheComponent() {
        User user = [
            SELECT
                Id
            FROM User
            WHERE Email = 'test1@test.pl'
            LIMIT 1
        ];
        
        System.runAs(user) {
            Test.startTest();
            Boolean isUserAbleToSeeTheComponent = RequiringActionRecordsController.shouldUserBeAbleToSeeTheComponent();
            Test.stopTest();

            System.assert(!isUserAbleToSeeTheComponent, String.format(Constants.VALUE_SHOULD_BE_FALSE, new List<String> { 'isUserAbleToSeeTheComponent' }));
        }
    }
}