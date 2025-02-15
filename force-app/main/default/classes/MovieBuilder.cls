public class MovieBuilder {   
    private MBMS_Movie__c movie;
       
    public MovieBuilder create() {
        this.movie = new MBMS_Movie__c();
        return this;
    }
    
    public MovieBuilder withDescription(String description) {
        this.movie.MBMS_Description__c = description;
        return this;
    }
    
    public MovieBuilder withDirector(MBMS_Artist__c director) {
        this.movie.MBMS_Director__c = director.Id;
        return this;
    }
    
    public MovieBuilder withName(String name) {
        this.movie.Name = name;
        return this;
    }
    
    public MovieBuilder withTitle(String title) {
        this.movie.MBMS_Title__c = title;
        return this;
    }
    
    public MovieBuilder withWriter(MBMS_Artist__c writer) {
        this.movie.MBMS_Writer__c = writer.Id;
        return this;
    }
    
    public MovieBuilder withStatus(String status) {
        this.movie.MBMS_Status__c = status;
        return this;
    }
    
    public MovieBuilder withStatusComment(String statusComment) {
        this.movie.MBMS_Status_Comment__c = statusComment;
        return this;
    }
    
    public MovieBuilder withProducer(MBMS_Artist__c producer) {
        this.movie.MBMS_Producer__c = producer.Id;
        return this;
    }
    
    public MovieBuilder withMainFilmingLocation(String mainFilmingLocation) {
        this.movie.MBMS_Main_Filming_Location__c = mainFilmingLocation;
        return this;
    }
    
    /*
     Should not be used in the loops due to SOQL limit - it inserts related fields.
     This method is used to create a single record (with all fields) for test purposes.
     */
    public MBMS_Movie__c buildWithAllFields() {
        MBMS_Artist__c artist = new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        
        return this
            .withDescription(Constants.TEST_STRING_VALUE)
            .withDirector(artist)
            .withName(Constants.TEST_STRING_VALUE)
            .withTitle(Constants.TEST_STRING_VALUE)
            .withWriter(artist)
            .withStatus(Constants.STATUS_APPROVED)
            .withStatusComment(Constants.TEST_STRING_VALUE)
            .withProducer(artist)
            .withMainFilmingLocation(Constants.TEST_STRING_VALUE)
            .build();
    }
    
    public MBMS_Movie__c buildWithAllFieldsAndInsert() {
        this.movie = this.buildWithAllFields();
        insert movie;
        return movie;
    }
    
    public MBMS_Movie__c build() {       
        return movie;
    }
    
    public MBMS_Movie__c buildAndInsert() {       
        insert movie;
        return this.build();
    }
}