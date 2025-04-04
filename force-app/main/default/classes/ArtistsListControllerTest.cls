@isTest
private class ArtistsListControllerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void shouldReturnEmptyListOfArtists() {
        MBMS_Artist__c artist = [
            SELECT
                Id
            FROM MBMS_Artist__c
            LIMIT 1
        ];

        delete artist;
        
        Test.startTest();
        List<MBMS_Artist__c> artistsList = ArtistsListController.getArtistsList();
        Test.stopTest();
        
        System.assertEquals(0, artistsList.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'artistsList', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfArtists() {
        Test.startTest();
        List<MBMS_Artist__c> artistsList = ArtistsListController.getArtistsList();
        Test.stopTest();
        
        System.assert(artistsList.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'artistsList', '0' }));
        System.assertNotEquals(null, artistsList[0], Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL);
    }
    
    @isTest
    static void shouldReturnEmptyListOfRequiringActionArtists() {
        MBMS_Artist__c artist = [
            SELECT
                Id
            FROM MBMS_Artist__c
            LIMIT 1
        ];
        
        artist.MBMS_Status__c = Constants.STATUS_APPROVED;
        update artist;
        
        Test.startTest();
        List<MBMS_Artist__c> artistsList = ArtistsListController.getRequiringActionArtists();
        Test.stopTest();
        
        System.assertEquals(0, artistsList.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'artistsList', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfRequiringActionArtists() {
        List<MBMS_Artist__c> artistsFromDb = [
            SELECT
                Id
            FROM MBMS_Artist__c
        ];
        
        for (MBMS_Artist__c artist : artistsFromDb) {
            artist.MBMS_Status__c = Constants.STATUS_REJECTED;
        }
        
        update artistsFromDb;
        
        Test.startTest();
        List<MBMS_Artist__c> artistsList = ArtistsListController.getRequiringActionArtists();
        Test.stopTest();
        
        System.assert(artistsList.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'artistsList', '0' }));
        System.assertNotEquals(null, artistsList[0], Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL);
    }
    
    @isTest
    static void artistsShouldNotBeAvailable() {
        MBMS_Artist__c artist = [
            SELECT
                Id
            FROM MBMS_Artist__c
            LIMIT 1
        ];

        delete artist;
        
        Test.startTest();
        Boolean areArtistsAvailable = ArtistsListController.areArtistsAvailable();
        Test.stopTest();
        
        System.assert(!areArtistsAvailable, String.format(Constants.VALUE_SHOULD_BE_FALSE, new List<String> { 'areArtistsAvailable' }));
    }
    
    @isTest
    static void artistsShouldBeAvailable() {
        Test.startTest();
        Boolean areArtistsAvailable = ArtistsListController.areArtistsAvailable();
        Test.stopTest();
        
        System.assert(areArtistsAvailable, String.format(Constants.VALUE_SHOULD_BE_TRUE, new List<String> { 'areArtistsAvailable' }));
    }
}