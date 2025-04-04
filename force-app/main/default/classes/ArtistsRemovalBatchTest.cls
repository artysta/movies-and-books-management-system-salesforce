@isTest
private class ArtistsRemovalBatchTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    private static void shouldDeleteExistingArtists() {
        List<MBMS_Artist__c> artists = [
            SELECT
                Id
            FROM MBMS_Artist__c
        ];
        
        for (MBMS_Artist__c artist : artists) {
            Test.setCreatedDate(artist.Id, Constants.TEST_DATE_10_DAYS_BEFORE_TODAY);
            artist.MBMS_Status__c = Constants.STATUS_REJECTED;
        }
        
        update artists;
        
        Test.startTest();
        Database.executeBatch(new ArtistsRemovalBatch());
        Test.stopTest();
        
        artists = [
            SELECT
                Id
            FROM MBMS_Artist__c
        ];

        System.assertEquals(0, artists.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'artists', '0' }));
    }
    
    @isTest
    private static void shouldDeleteExistingArtistsBulk() {
        removeExistingArtists();
        
        List<MBMS_Artist__c> artists = new List<MBMS_Artist__c>();
        ArtistBuilder builder = new ArtistBuilder();
        
        for (Integer i = 0; i < 200; i++) {
            artists.add(builder
                        .create()
                        .withFirstName(Constants.TEST_STRING_VALUE)
                        .withLastName(Constants.TEST_STRING_VALUE)
                        .withRoles(new List<String> { Constants.ROLE_AUTHOR, Constants.ROLE_ACTOR })
                        .withStatus(Constants.STATUS_REJECTED)
                        .build());
        }
        
        insert artists;
        
        for (MBMS_Artist__c artist : artists) {
            Test.setCreatedDate(artist.Id, Constants.TEST_DATE_10_DAYS_BEFORE_TODAY);
        }
        
        Test.startTest();
        Database.executeBatch(new ArtistsRemovalBatch());
        Test.stopTest();
        
        artists = [
            SELECT
                Id
            FROM MBMS_Artist__c
        ];
        
        System.assertEquals(0, artists.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'artists', '0' }));
    }
    
    @isTest
    private static void shouldNotDeleteExistingArtists() {
        List<MBMS_Artist__c> artists = [SELECT Id FROM MBMS_Artist__c];
        
        Test.startTest();
        Database.executeBatch(new ArtistsRemovalBatch());
        Test.stopTest();
        
        artists = [
            SELECT
                Id
            FROM MBMS_Artist__c
        ];

        System.assertEquals(1, artists.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'artists', '1' }));
    }
    
    private static void removeExistingArtists() {
        delete [
            SELECT
                Id
            FROM MBMS_Artist__c
        ];
    }
}