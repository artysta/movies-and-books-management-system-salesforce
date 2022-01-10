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
}