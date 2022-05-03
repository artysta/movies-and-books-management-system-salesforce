public class MovieActorBuilder {
    private MBMS_Movie_Actor__c movieActor;
    
    public MovieActorBuilder create() {
        this.movieActor = new MBMS_Movie_Actor__c();
        return this;
    }
    
    public MovieActorBuilder withActor(MBMS_Artist__c artist) {
        this.movieActor.MBMS_Artist__c = artist.Id;
        return this;
    }
    
    public MovieActorBuilder withMovie(MBMS_Movie__c movie) {
        this.movieActor.MBMS_Movie__c = movie.Id;
        return this;
    }
    
    public MovieActorBuilder withCharacterName(String characterName) {
        this.movieActor.MBMS_Character_Name__c = characterName;
        return this;
    }
    
    /*
     Should not be used in the loops due to SOQL limit - it inserts related fields.
     This method is used to create a single record (with all fields) for test purposes.
     */
    public MBMS_Movie_Actor__c buildWithAllFields() {
        MBMS_Artist__c artist = new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        
        MBMS_Movie__c movie = new MovieBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        
        return this
            .withActor(artist)
            .withMovie(movie)
            .withCharacterName(Constants.TEST_STRING_VALUE)
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