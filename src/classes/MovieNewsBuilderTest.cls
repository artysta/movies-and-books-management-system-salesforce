@isTest
private class MovieNewsBuilderTest {
    @testSetup
    static void testDataSetup() {
        new MovieNewsBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void movieNewsShouldNotBeNull() {
        Test.startTest();        
        MBMS_Movie_News__c movieNews = new MovieNewsBuilder()
            .create()
            .build();
        Test.stopTest();
        
        System.assertNotEquals(null, movieNews);
    }
    
    @isTest
    static void insertedMovieNewsShouldNotBeNull() {
        Test.startTest();        
        MBMS_Movie_News__c movieNews = [SELECT Id
                                        FROM MBMS_Movie_News__c
                                        LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, movieNews);
    }
    
    @isTest
    static void movieNewsShouldHaveName() {
        Test.startTest();        
        MBMS_Movie_News__c movieNews = [SELECT Name
                                        FROM MBMS_Movie_News__c
                                        LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, movieNews.Name);
    }
    
    @isTest
    static void movieNewsShouldHaveTitle() {
        Test.startTest();        
        MBMS_Movie_News__c movieNews = [SELECT MBMS_Title__c
                                        FROM MBMS_Movie_News__c
                                        LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, movieNews.MBMS_Title__c);
    }
    
    @isTest
    static void movieNewsShouldHaveContent() {
        Test.startTest();        
        MBMS_Movie_News__c movieNews = [SELECT MBMS_Content__c
                                        FROM MBMS_Movie_News__c
                                        LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, movieNews.MBMS_Content__c);
    }
    
    @isTest
    static void movieNewsShouldHaveTags() {
        Test.startTest();        
        MBMS_Movie_News__c movieNews = [SELECT MBMS_Tags__c
                                        FROM MBMS_Movie_News__c
                                        LIMIT 1];
        Test.stopTest();
        
        System.assert(movieNews.MBMS_Tags__c.contains(MBMS_Constants.MBMS_TEST_STRING_VALUE));
        System.assert(movieNews.MBMS_Tags__c.contains(';'));
    }
    
    @isTest
    static void movieNewsShouldHaveArtist() {
        Test.startTest();        
        MBMS_Movie_News__c movieNews = [SELECT MBMS_Movie__c
                                        FROM MBMS_Movie_News__c
                                        LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, movieNews.MBMS_Movie__c);
    }
}