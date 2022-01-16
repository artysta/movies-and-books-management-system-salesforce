@isTest
private class MoviePhotosListControllerTest {
    @testSetup
    static void testDataSetup() {
        MBMS_Movie_Photo__c moviePhoto = new MoviePhotoBuilder().buildWithAllFieldsAndInsert();
    }
    
    @isTest
    static void shouldReturnEmptyListOfMoviePhotos() {
        Test.startTest();
        MBMS_Movie_Photo__c moviePhoto = [SELECT Id FROM MBMS_Movie_Photo__c LIMIT 1];
        delete moviePhoto;
        List<MBMS_Movie_Photo__c> moviePhotos = MoviePhotosListController.getPhotos();
        Test.stopTest();
        
        System.assertEquals(0, moviePhotos.size());
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfMoviePhotos() {
        Test.startTest();
        List<MBMS_Movie_Photo__c> moviePhotos = MoviePhotosListController.getPhotos();
        Test.stopTest();
        
        System.assert(moviePhotos.size() > 0);
        System.assertNotEquals(null, moviePhotos[0]);
    }
    
    @isTest
    static void shouldReturnEmptyListOfLatestMoviePhotos() {
        Test.startTest();
        MBMS_Movie_Photo__c moviePhoto = [SELECT Id FROM MBMS_Movie_Photo__c LIMIT 1];
        delete moviePhoto;
        List<MBMS_Movie_Photo__c> moviePhotos = MoviePhotosListController.getLatestPhotos();
        Test.stopTest();
        
        System.assertEquals(0, moviePhotos.size());
    }
    
    @isTest
    static void shouldReturnNotEmptyListOfLatestMoviePhotos() {
        Test.startTest();
        List<MBMS_Movie_Photo__c> moviePhotosFromDb = [SELECT Id FROM MBMS_Movie_Photo__c];
        List<MBMS_Movie_Photo__c> moviePhotosToInsert = new List<MBMS_Movie_Photo__c>();
        
        // Add missing Movie Photos to reach MINIMUM_NUMBER_OF_PHOTOS size.
        if (moviePhotosFromDb.size() < MoviePhotosListController.MINIMUM_NUMBER_OF_PHOTOS) {
            for (Integer i = 0; i < MoviePhotosListController.MINIMUM_NUMBER_OF_PHOTOS - moviePhotosFromDb.size(); i++) {
                moviePhotosToInsert.add(new MoviePhotoBuilder().buildWithAllFields());
            }            
        }
        
        insert moviePhotosToInsert;
        
        List<MBMS_Movie_Photo__c> latestMoviePhotos = MoviePhotosListController.getLatestPhotos();
        Test.stopTest();
        
        System.assertEquals(MoviePhotosListController.MINIMUM_NUMBER_OF_PHOTOS, latestMoviePhotos.size());
        System.assertNotEquals(null, latestMoviePhotos[0]);
    }
}