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
        
        System.assertNotEquals(null, artistNews, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist_News__c' }));
    }
    
    @isTest
    static void insertedArtistNewsShouldNotBeNull() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT Id
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, artistNews, String.format(MBMS_Constants.OBJECT_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist_News__c' }));
    }
    
    @isTest
    static void artistNewsShouldHaveName() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT Name
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artistNews.Name, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist_News__c' }));
    }
    
    @isTest
    static void artistNewsShouldHaveTitle() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT MBMS_Title__c
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artistNews.MBMS_Title__c, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Title__c' }));
    }
    
    @isTest
    static void artistNewsShouldHaveContent() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT MBMS_Content__c
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artistNews.MBMS_Content__c, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Content__c' }));
    }
    
    @isTest
    static void artistNewsShouldHaveTags() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT MBMS_Tags__c
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assert(artistNews.MBMS_Tags__c.contains(MBMS_Constants.MBMS_TEST_STRING_VALUE), String.format(MBMS_Constants.FIELD_SHOULD_CONTAIN_PATTERN, new List<String> { 'MBMS_Tags__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
    
    @isTest
    static void artistNewsShouldHaveArtist() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT MBMS_Artist__c
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertNotEquals(null, artistNews.MBMS_Artist__c, String.format(MBMS_Constants.FIELD_SHOULD_NOT_BE_NULL_PATTERN, new List<String> { 'MBMS_Artist__c' }));
    }
    
    @isTest
    static void artistNewsShouldHaveImageURL() {
        Test.startTest();        
        MBMS_Artist_News__c artistNews = [SELECT MBMS_Image_URL__c
                                          FROM MBMS_Artist_News__c
                                          LIMIT 1];
        Test.stopTest();
        
        System.assertEquals(MBMS_Constants.MBMS_TEST_STRING_VALUE, artistNews.MBMS_Image_URL__c, String.format(MBMS_Constants.FIELD_SHOULD_BE_PATTERN, new List<String> { 'MBMS_Image_URL__c', MBMS_Constants.MBMS_TEST_STRING_VALUE }));
    }
}