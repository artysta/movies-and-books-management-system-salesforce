@isTest
private class ArtistsListControllerTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Artist__c artist = new ArtistBuilder()
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withBirthplace(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withDateOfBirth(MBMS_Constants.MBMS_TEST_DATE_200_DAYS_BEFORE_TODAY)
            .withDateOfDeath(MBMS_Constants.MBMS_TEST_DATE_10_DAYS_BEFORE_TODAY)
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
}