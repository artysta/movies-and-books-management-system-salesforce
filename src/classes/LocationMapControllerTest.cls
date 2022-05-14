@isTest
private class LocationMapControllerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new MovieBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    
    @isTest
    static void shouldReturnMainFilmingLocationByMovieId() {
        MBMS_Movie__c movie = [SELECT Id FROM MBMS_Movie__c LIMIT 1];
        
        Test.startTest();
        String mainFilmingLocation = LocationMapController.getMainFilmingLocationByMovieId(movie.Id);
        Test.stopTest();
        
        System.assertEquals(Constants.TEST_STRING_VALUE, mainFilmingLocation, String.format(Constants.VALUE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'mainFilmingLocation', Constants.TEST_STRING_VALUE }));
    }
}