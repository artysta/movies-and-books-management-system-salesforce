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
        
        System.assertEquals(0, artistsList.size(), String.format(MBMS_Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'artistsList', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfArtists() {
        Test.startTest();
        List<MBMS_Artist__c> artistsList = ArtistsListController.getArtistsList();
        Test.stopTest();
        
        System.assert(artistsList.size() > 0, String.format(MBMS_Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'artistsList', '0' }));
        System.assertNotEquals(null, artistsList[0], MBMS_Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL);
    }
    
    @isTest
    static void shouldReturnEmptyListOfRequiringActionArtists() {
        Test.startTest();
        MBMS_Artist__c artist = [SELECT Id FROM MBMS_Artist__c LIMIT 1];
        artist.MBMS_Status__c = MBMS_Constants.MBMS_STATUS_APPROVED;
        update artist;
        
        List<MBMS_Artist__c> artistsList = ArtistsListController.getRequiringActionArtists();
        Test.stopTest();
        
        System.assertEquals(0, artistsList.size(), String.format(MBMS_Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'artistsList', '0' }));
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
        
        System.assert(artistsList.size() > 0, String.format(MBMS_Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'artistsList', '0' }));
        System.assertNotEquals(null, artistsList[0], MBMS_Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL);
    }
    
    @isTest
    static void artistsShouldNotBeAvailable() {
        Test.startTest();
        MBMS_Artist__c artist = [SELECT Id FROM MBMS_Artist__c LIMIT 1];
        delete artist;
        
        Boolean areArtistsAvailable = ArtistsListController.areArtistsAvailable();
        Test.stopTest();
        
        System.assert(!areArtistsAvailable, String.format(MBMS_Constants.VALUE_SHOULD_BE_FALSE, new List<String> { 'areArtistsAvailable' }));
    }
    
    @isTest
    static void artistsShouldBeAvailable() {
        Test.startTest();
        Boolean areArtistsAvailable = ArtistsListController.areArtistsAvailable();
        Test.stopTest();
        
        System.assert(areArtistsAvailable, String.format(MBMS_Constants.VALUE_SHOULD_BE_TRUE, new List<String> { 'areArtistsAvailable' }));
    }
}