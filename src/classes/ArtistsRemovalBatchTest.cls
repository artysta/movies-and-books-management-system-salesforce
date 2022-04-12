@isTest
private class ArtistsRemovalBatchTest {
    @testSetup
    static void testDataSetup() {
        new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    private static void shouldDeleteExistingArtists() {
        List<MBMS_Artist__c> artists = [SELECT Id FROM MBMS_Artist__c];
        
        for (MBMS_Artist__c artist : artists) {
            Test.setCreatedDate(artist.Id, MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY);
            artist.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_REJECTED;
        }
        
        update artists;
        
        Test.startTest();
        ArtistsRemovalBatch removalBatch = new ArtistsRemovalBatch();
        Database.executeBatch(removalBatch);
        Test.stopTest();
        
        artists = [SELECT Id FROM MBMS_Artist__c];
        System.assertEquals(0, artists.size(), String.format(MBMS_Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'artists', '0' }));
    }
    
    @isTest
    private static void shouldDeleteExistingArtistsBulk() {
        removeExistingArtists();
        
        List<MBMS_Artist__c> artists = new List<MBMS_Artist__c>();
        ArtistBuilder builder = new ArtistBuilder();
        
        for (Integer i = 0; i < 200; i++) {
            artists.add(builder
                        .create()
                        .withFirstName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
                        .withLastName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
                        .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_AUTHOR, MBMS_Constants.MBMS_ROLE_ACTOR })
                        .withStatus(MBMS_Constants.MBMS_STATUS_REJECTED)
                        .build());
        }
        
        insert artists;
        
        for (MBMS_Artist__c artist : artists) {
            Test.setCreatedDate(artist.Id, MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY);
        }
        
        Test.startTest();
        ArtistsRemovalBatch removalBatch = new ArtistsRemovalBatch();
        Database.executeBatch(removalBatch);
        Test.stopTest();
        
        artists = [SELECT Id FROM MBMS_Artist__c];
        
        System.assertEquals(0, artists.size(), String.format(MBMS_Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'artists', '0' }));
    }
    
    @isTest
    private static void shouldNotDeleteExistingArtists() {
        List<MBMS_Artist__c> artists = [SELECT Id FROM MBMS_Artist__c];
        
        Test.startTest();
        ArtistsRemovalBatch removalBatch = new ArtistsRemovalBatch();
        Database.executeBatch(removalBatch);
        Test.stopTest();
        
        artists = [SELECT Id FROM MBMS_Artist__c];
        System.assertEquals(0, artists.size(), String.format(MBMS_Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'artists', '0' }));
    }
    
    private static void removeExistingArtists() {
        delete [SELECT Id FROM MBMS_Artist__c];
    }
}