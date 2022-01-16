public class MovieActorBuilder {
    private MBMS_Movie_Actor__c movieActor;
    
    public MovieActorBuilder() {
        this.movieActor = new MBMS_Movie_Actor__c();
    }
    
    public MovieActorBuilder withActor(MBMS_Artist__c artist) {
        this.movieActor.MBMS_Artist__c = artist.Id;
        return this;
    }
    
    public MovieActorBuilder withMovie(MBMS_Movie__c movie) {
        this.movieActor.MBMS_Movie__c = movie.Id;
        return this;
    }
    
    public MBMS_Movie_Actor__c buildWithAllFields() {
        MBMS_Artist__c artist = new ArtistBuilder().buildWithAllFieldsAndInsert();
        MBMS_Movie__c movie = new MovieBuilder().buildWithAllFieldsAndInsert();
        
        return this
            .withActor(artist)
            .withMovie(movie)
            .build();
    }
    
    public MBMS_Movie_Actor__c buildWithAllFieldsAndInsert() {
        this.movieActor = this.buildWithAllFields();
        insert movieActor;
        return movieActor;
    }
    
    public MBMS_Movie_Actor__c build() {       
        return movieActor;
    }
    
    public MBMS_Movie_Actor__c buildAndInsert() {       
        insert movieActor;
        return this.build();
    }
}