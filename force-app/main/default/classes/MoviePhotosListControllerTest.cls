@isTest
private class MoviePhotosListControllerTest {
    @testSetup
    static void testDataSetup() {
        Test.startTest();
        new MoviePhotoBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        Test.stopTest();
    }
    
    @isTest
    static void shouldReturnEmptyListOfMoviePhotos() {
        MBMS_Movie_Photo__c moviePhoto = [
            SELECT
                Id
            FROM MBMS_Movie_Photo__c
            LIMIT 1
        ];
        
        delete moviePhoto;

        Test.startTest();
        List<MBMS_Movie_Photo__c> moviePhotos = MoviePhotosListController.getPhotos();
        Test.stopTest();
        
        System.assertEquals(0, moviePhotos.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'moviePhotos', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfMoviePhotos() {
        Test.startTest();
        List<MBMS_Movie_Photo__c> moviePhotos = MoviePhotosListController.getPhotos();
        Test.stopTest();
        
        System.assert(moviePhotos.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'moviePhotos', '0' }));
        System.assertNotEquals(null, moviePhotos[0], String.format(Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL, new List<String> { 'moviePhotos' }));
    }
    
    @isTest
    static void shouldReturnEmptyListOfLatestMoviePhotos() {
        MBMS_Movie_Photo__c moviePhoto = [
            SELECT
                Id
            FROM MBMS_Movie_Photo__c
            LIMIT 1
        ];
        
        delete moviePhoto;

        Test.startTest();
        List<MBMS_Movie_Photo__c> moviePhotos = MoviePhotosListController.getLatestPhotos();
        Test.stopTest();
        
        System.assertEquals(0, moviePhotos.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'moviePhotos', '0' }));
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfLatestMoviePhotos() {
        Test.startTest();
        List<MBMS_Movie_Photo__c> moviePhotos = MoviePhotosListController.getLatestPhotos();
        Test.stopTest();
        
        System.assert(moviePhotos.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'moviePhotos', '0' }));
        System.assertNotEquals(null, moviePhotos[0], String.format(Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL, new List<String> { 'moviePhotos' }));
    }
    
    @isTest
    static void latestPhotosShouldNotBeAvailable() {
        Test.startTest();
        Boolean photosAvailable = MoviePhotosListController.arePhotosAvailable();
        Test.stopTest();
        
        System.assert(!photosAvailable, String.format(Constants.VALUE_SHOULD_BE_FALSE, new List<String> { 'photosAvailable' }));
    }
    
    @isTest
    static void latestPhotosListShouldBeAvailable() {
        List<MBMS_Movie_Photo__c> moviePhotosFromDb = [
            SELECT
                Id
            FROM MBMS_Movie_Photo__c
        ];
        
        List<MBMS_Movie_Photo__c> moviePhotosToInsert = new List<MBMS_Movie_Photo__c>();
        
        // Add missing Movie Photos to reach MINIMUM_NUMBER_OF_PHOTOS size.
        if (moviePhotosFromDb.size() < MoviePhotosListController.MINIMUM_NUMBER_OF_PHOTOS) {
            for (Integer i = 0; i < MoviePhotosListController.MINIMUM_NUMBER_OF_PHOTOS - moviePhotosFromDb.size(); i++) {
                moviePhotosToInsert.add(new MoviePhotoBuilder().create().buildWithAllFields());
            }            
        }
        
        insert moviePhotosToInsert;
        
        Test.startTest();
        Boolean photosAvailable = MoviePhotosListController.arePhotosAvailable();
        Test.stopTest();
        
        System.assert(photosAvailable, String.format(Constants.VALUE_SHOULD_BE_TRUE, new List<String> { 'photosAvailable' }));
    }
    
    @isTest
    static void minimumNumberOfLatestPhotosShouldMatch() {
        Test.startTest();
        Integer minimumNumberOfPhotos = MoviePhotosListController.getMinimumNumberOfPhotos();
        Test.stopTest();
        
        System.assertEquals(MoviePhotosListController.MINIMUM_NUMBER_OF_PHOTOS, minimumNumberOfPhotos, String.format(Constants.VALUE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { String.valueOf(minimumNumberOfPhotos) }));
    }
    
    @isTest
    static void requiringActionPhotosListShouldBeEmpty() {
        Test.startTest();
        List<MBMS_Movie_Photo__c> moviePhotos = MoviePhotosListController.getRequiringActionPhotos();
        Test.stopTest();
        
        System.assertEquals(0, moviePhotos.size(), String.format(Constants.SIZE_SHOULD_BE_EQUAL_TO_PATTERN, new List<String> { 'moviePhotos', '0' }));
    }
    
    @isTest
    static void requiringActionPhotosListShouldNotBeEmpty() {
		List<MBMS_Movie_Photo__c> moviePhotosFromDb = [
            SELECT
                Id
            FROM MBMS_Movie_Photo__c
        ];
        
        for (MBMS_Movie_Photo__c moviePhoto : moviePhotosFromDb) {
            moviePhoto.MBMS_Status__c = Constants.STATUS_REJECTED;
        }
        
        update moviePhotosFromDb;

        Test.startTest();
        List<MBMS_Movie_Photo__c> moviePhotos = MoviePhotosListController.getRequiringActionPhotos();
        Test.stopTest();
        
        System.assert(moviePhotos.size() > 0, String.format(Constants.SIZE_SHOULD_BE_GREATER_THAN_PATTERN, new List<String> { 'moviePhotos', '0' }));
        System.assertNotEquals(null, moviePhotos[0], String.format(Constants.ELEMENT_OF_COLLECTION_SHOULD_NOT_BE_NULL, new List<String> { 'moviePhotos' }));
    }
}