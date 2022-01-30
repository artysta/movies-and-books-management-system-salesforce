public class MoviePhotoBuilder {
    private MBMS_Movie_Photo__c moviePhoto;
    
    public MoviePhotoBuilder create() {
        this.moviePhoto = new MBMS_Movie_Photo__c();
        return this;
    }
    
    public MoviePhotoBuilder withName(String name) {
        this.moviePhoto.Name = name;
        return this;
    }
    
    public MoviePhotoBuilder withMovie(MBMS_Movie__c movie) {
        this.moviePhoto.MBMS_Movie__c = movie.Id;
        return this;
    }
    
    public MoviePhotoBuilder withPhotoURL(String photoURL) {
        this.moviePhoto.MBMS_Photo_URL__c = photoURL;
        return this;
    }

    public MoviePhotoBuilder withStatus(String status) {
        this.moviePhoto.MBMS_Status__c = status;
        return this;
    }
    
    public MoviePhotoBuilder withStatusComment(String statusComment) {
        this.moviePhoto.MBMS_Status_Comment__c = statusComment;
        return this;
    }
    
    /*
     Should not be used in the loops due to SOQL limit - it inserts related fields.
     This method is used to create a single record (with all fields) for test purposes.
     */
    public MBMS_Movie_Photo__c buildWithAllFields() {
        MBMS_Movie__c movie = new MovieBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        
        return this
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withMovie(movie)
            .withPhotoURL(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withStatus(MBMS_Constants.MBMS_STATUS_APPROVED)
            .withStatusComment(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .build();
    }
    
    public MBMS_Movie_Photo__c buildWithAllFieldsAndInsert() {
        this.moviePhoto = this.buildWithAllFields();
        insert moviePhoto;
        return moviePhoto;
    }
    
    public MBMS_Movie_Photo__c build() {       
        return moviePhoto;
    }
    
    public MBMS_Movie_Photo__c buildAndInsert() {       
        insert moviePhoto;
        return this.build();
    }
}