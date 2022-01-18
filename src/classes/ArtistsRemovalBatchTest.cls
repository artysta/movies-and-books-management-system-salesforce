@isTest
private class ArtistsRemovalBatchTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Artist__c artist = new ArtistBuilder().buildWithAllFieldsAndInsert();
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
        System.assertEquals(0, artists.size());
    }
    
    @isTest
    private static void shouldNotDeleteExistingArtists() {
        List<MBMS_Artist__c> artists = [SELECT Id FROM MBMS_Artist__c];
        
        Test.startTest();
        ArtistsRemovalBatch removalBatch = new ArtistsRemovalBatch();
        Database.executeBatch(removalBatch);
        Test.stopTest();
        
        artists = [SELECT Id FROM MBMS_Artist__c];
        System.assert(artists.size() > 0);
    }
}