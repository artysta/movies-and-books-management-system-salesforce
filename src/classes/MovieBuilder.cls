public class MovieBuilder {   
    private MBMS_Movie__c movie;
    
    public MovieBuilder() {
        this.movie = new MBMS_Movie__c();
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
    
    public MBMS_Movie__c buildWithAllFields() {
        MBMS_Artist__c artist = new ArtistBuilder().buildWithAllFieldsAndInsert();
        
        return this
            .withDescription(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withDirector(artist)
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withTitle(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withWriter(artist)
            .withStatus(MBMS_Constants.MBMS_STATUS_APPROVED)
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