@isTest
private class MovieBuilderTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new MovieBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void movieShouldNotBeNull() {
        MBMS_Movie__c movie = new MovieBuilder()
            .create()
            .build();
        
        System.assertNotEquals(null, movie, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Movie__c' }));
    }
    
    @isTest
    static void insertedMovieShouldNotBeNull() {
        MBMS_Movie__c movie = [SELECT Id
                               FROM MBMS_Movie__c
                               LIMIT 1];
        
        System.assertNotEquals(null, movie, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Movie__c' }));
    }
    
    @isTest
    static void movieShouldHaveDescription() {
        MBMS_Movie__c movie = [SELECT MBMS_Description__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, movie.MBMS_Description__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Description__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void movieShouldHaveDirector() {
        MBMS_Movie__c movie = [SELECT MBMS_Director__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        
        System.assertNotEquals(null, movie.MBMS_Director__c, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Director__c' }));
    }
    
    @isTest
    static void movieShouldHaveName() {
        MBMS_Movie__c movie = [SELECT Name
                               FROM MBMS_Movie__c
                               LIMIT 1];
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, movie.Name, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'Name', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void movieShouldHaveTitle() {
        MBMS_Movie__c movie = [SELECT MBMS_Title__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, movie.MBMS_Title__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Title__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void movieShouldHaveWriter() {
        MBMS_Movie__c movie = [SELECT MBMS_Writer__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        
        System.assertNotEquals(null, movie.MBMS_Writer__c, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Writer__c' }));
    }
    
    @isTest
    static void movieShouldHaveStatus() {
        MBMS_Movie__c movie = [SELECT MBMS_Status__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        
        System.assertEquals(MBMS_Constants.MBMS_STATUS_APPROVED, movie.MBMS_Status__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status__c', MBMS_Constants.MBMS_STATUS_APPROVED }));
    }
    
    @isTest
    static void movieShouldHaveStatusComment() {
        MBMS_Movie__c movie = [SELECT MBMS_Status_Comment__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        
        System.assertEquals(MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT, movie.MBMS_Status_Comment__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Status_Comment__c', MBMS_Constants.MBMS_INITIAL_STATUS_COMMENT }));
    }
    
    @isTest
    static void movieShouldHaveProducer() {
        MBMS_Movie__c movie = [SELECT MBMS_Producer__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        
        System.assertNotEquals(null, movie.MBMS_Producer__c, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Producer__c' }));
    }
}