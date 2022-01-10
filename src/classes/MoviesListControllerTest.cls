@isTest
private class MoviesListControllerTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Artist__c artist = new ArtistBuilder()
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withRoles(new List<String> { MBMS_Constants.MBMS_ROLE_AUTHOR, MBMS_Constants.MBMS_ROLE_ACTOR })
            .buildAndInsert();
        
        MBMS_Movie__c movie = new MovieBuilder()
            .withDirector(artist)
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withTitle(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withWriter(artist)
            .buildAndInsert();
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfBooks() {
        Test.startTest();
        List<MBMS_Movie__c> moviesList = MoviesListController.getMoviesList();
        Test.stopTest();
        
        System.assert(moviesList.size() > 0);
        System.assertNotEquals(null, moviesList[0]);
    }
}