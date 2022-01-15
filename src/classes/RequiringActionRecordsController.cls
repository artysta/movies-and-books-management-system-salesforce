public with sharing class RequiringActionRecordsController {
    @AuraEnabled
    public static List<sObject> getRequiringActionRecords() {
        List<sObject> result = new List<sObject>();
        
        result.addAll(ArtistsListController.getRequiringActionArtists());
        result.addAll(BooksListController.getRequiringActionBooks());
        result.addAll(MoviesListController.getRequiringActionMovies());
        result.addAll(MoviePhotosListController.getRequiringActionPhotos());

        return result;
    }
}