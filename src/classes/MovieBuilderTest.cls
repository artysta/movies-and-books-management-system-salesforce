@isTest
private class MovieBuilderTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Movie__c movie = new MovieBuilder().buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void movieShouldNotBeNull() {
        Test.startTest();        
        MBMS_Movie__c movie = new MovieBuilder().build();
        Test.stopTest();
        
        System.assertNotEquals(null, movie);
    }
    
    @isTest
    static void insertedMovieShouldNotBeNull() {
        Test.startTest();        
        MBMS_Movie__c movie = [SELECT Id
                               FROM MBMS_Movie__c
                               LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, movie);
    }
    
    @isTest
    static void movieShouldHaveADescription() {
        Test.startTest();        
        MBMS_Movie__c movie = [SELECT MBMS_Description__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, movie.MBMS_Description__c);
    }
    
    @isTest
    static void movieShouldHaveADirector() {
        Test.startTest();        
        MBMS_Movie__c movie = [SELECT MBMS_Director__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, movie.MBMS_Director__c);
    }
    
    @isTest
    static void movieShouldHaveAName() {
        Test.startTest();        
        MBMS_Movie__c movie = [SELECT Name
                               FROM MBMS_Movie__c
                               LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, movie.Name);
    }
    
    @isTest
    static void movieShouldHaveATitle() {
        Test.startTest();        
        MBMS_Movie__c movie = [SELECT MBMS_Title__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, movie.MBMS_Title__c);
    }
    
    @isTest
    static void movieShouldHaveAWriter() {
        Test.startTest();        
        MBMS_Movie__c movie = [SELECT MBMS_Writer__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, movie.MBMS_Writer__c);
    }

    @isTest
    static void movieShouldHaveAStatus() {
        Test.startTest();        
        MBMS_Movie__c movie = [SELECT MBMS_Status__c
                               FROM MBMS_Movie__c
                               LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_STATUS_APPROVED, movie.MBMS_Status__c);
    }
}