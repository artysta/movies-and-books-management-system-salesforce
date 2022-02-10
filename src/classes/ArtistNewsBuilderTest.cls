@isTest
private class ArtistNewsBuilderTest {
    @testSetup
    static void testDataSetup() {
        new ArtistNewsBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void artistNewsShouldNotBeNull() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = new ArtistNewsBuilder()
            .create()
            .build();
        Test.stopTest();
        
        System.assertNotEquals(null, artistNews);
    }
    
    @isTest
    static void insertedArtistNewsShouldNotBeNull() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT Id
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, artistNews);
    }
    
    @isTest
    static void artistNewsShouldHaveName() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT Name
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artistNews.Name);
    }
    
    @isTest
    static void artistNewsShouldHaveTitle() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT MBMS_Title__c
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artistNews.MBMS_Title__c);
    }
    
    @isTest
    static void artistNewsShouldHaveContent() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT MBMS_Content__c
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artistNews.MBMS_Content__c);
    }
    
    @isTest
    static void artistNewsShouldHaveTags() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT MBMS_Tags__c
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assert(artistNews.MBMS_Tags__c.contains(MBMS_Constants.MBMS_TEST_STRING_VALUE));
        System.assert(artistNews.MBMS_Tags__c.contains(';'));
    }
    
    @isTest
    static void artistNewsShouldHaveArtist() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT MBMS_Artist__c
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, artistNews.MBMS_Artist__c);
    }
}