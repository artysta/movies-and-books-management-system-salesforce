@isTest
private class ArtistsListControllerTest {
    @testSetup
    static void testDataSetup() {
        new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void shouldReturnEmptyListOfArtists() {
        Test.startTest();
        MBMS_Artist__c artist = [SELECT Id FROM MBMS_Artist__c LIMIT 1];
        delete artist;
        
        List<MBMS_Artist__c> artistsList = ArtistsListController.getArtistsList();
        Test.stopTest();
        
        System.assertEquals(0, artistsList.size());
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfArtists() {
        Test.startTest();
        List<MBMS_Artist__c> artistsList = ArtistsListController.getArtistsList();
        Test.stopTest();
        
        System.assert(artistsList.size() > 0);
        System.assertNotEquals(null, artistsList[0]);
    }
    
    @isTest
    static void shouldReturnEmptyListOfRequiringActionArtists() {
        Test.startTest();
        MBMS_Artist__c artist = [SELECT Id FROM MBMS_Artist__c LIMIT 1];
        artist.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_APPROVED;
        update artist;
        
        List<MBMS_Artist__c> artistsList = ArtistsListController.getRequiringActionArtists();
        Test.stopTest();
        
        System.assertEquals(0, artistsList.size());
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfRequiringActionArtists() {
        Test.startTest();
        List<MBMS_Artist__c> artistsFromDb = [SELECT Id FROM MBMS_Artist__c];
        
        for (MBMS_Artist__c artist : artistsFromDb) {
            artist.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_REJECTED;
        }
        
        update artistsFromDb;
        
        List<MBMS_Artist__c> artistsList = ArtistsListController.getRequiringActionArtists();
        Test.stopTest();
        
        System.assert(artistsList.size() > 0);
        System.assertNotEquals(null, artistsList[0]);
    }
    
    @isTest
    static void artistsShouldNotBeAvailable() {
        Test.startTest();
        MBMS_Artist__c artist = [SELECT Id FROM MBMS_Artist__c LIMIT 1];
        delete artist;
        
        Boolean areArtistsAvailable = ArtistsListController.areArtistsAvailable();
        Test.stopTest();
        
        System.assert(!areArtistsAvailable);
    }
    
    @isTest
    static void artistsShouldBeAvailable() {
        Test.startTest();
        Boolean areArtistsAvailable = ArtistsListController.areArtistsAvailable();
        Test.stopTest();
        
        System.assert(areArtistsAvailable);
    }
}