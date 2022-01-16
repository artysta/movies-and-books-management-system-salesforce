public class MoviePhotoBuilder {
    private MBMS_Movie_Photo__c moviePhoto;
    
    public MoviePhotoBuilder() {
        this.moviePhoto = new MBMS_Movie_Photo__c();
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
    
    public MBMS_Movie_Photo__c build() {       
        return moviePhoto;
    }
    
    public MBMS_Movie_Photo__c buildAndInsert() {       
        insert moviePhoto;
        return this.build();
    }
}