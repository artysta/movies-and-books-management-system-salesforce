@isTest
private class ArtistsListControllerTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Artist__c artist = new ArtistBuilder()
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withBirthplace(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withDateOfBirth(MBMS_Constants.MBMS_TEST_DATE_200_DAYS_BEFORE_TODAY)
            .withDateOfDeath(MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY)
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_AUTHOR, MBMS_Constants.MBMS_ROLE_ACTOR })
            .withStatus(MBMS_Constants.MBMS_STATUS_REJECTED)
            .buildAndInsert();
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
    static void shouldReturnNotEmptyListOfRequiringActionArtists() {
        Test.startTest();
        List<MBMS_Artist__c> artistsList = ArtistsListController.getRequiringActionArtists();
        Test.stopTest();
        
        System.assert(artistsList.size() > 0);
        System.assertNotEquals(null, artistsList[0]);
    }
}