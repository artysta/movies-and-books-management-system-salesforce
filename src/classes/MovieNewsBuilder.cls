public class MovieNewsBuilder {   
    private MBMS_Movie_News__c movieNews;
    
    public MovieNewsBuilder create() {
        this.movieNews = new MBMS_Movie_News__c();
        return this;
    }
    
    public MovieNewsBuilder withName(String name) {
        this.movieNews.Name = name;
        return this;
    }
    
    public MovieNewsBuilder withTitle(String title) {
        this.movieNews.MBMS_Title__c = title;
        return this;
    }
    
    public MovieNewsBuilder withContent(String content) {
        this.movieNews.MBMS_Content__c = content;
        return this;
    }
    
    public MovieNewsBuilder withTags(List<String> tags) {
        this.movieNews.MBMS_Tags__c = String.join(tags, ';');
        return this;
    }
    
    public MovieNewsBuilder withMovie(MBMS_Movie__c movie) {
        this.movieNews.MBMS_Movie__c = movie.Id;
        return this;
    }
    
    public MovieNewsBuilder withImageURL(String imageURL) {
        this.movieNews.MBMS_Image_URL__c = imageURL;
        return this;
    }
    
    /*
     Should not be used in the loops due to SOQL limit - it inserts related fields.
     This method is used to create a single record (with all fields) for test purposes.
     */
    public MBMS_Movie_News__c buildWithAllFields() {
        MBMS_Movie__c movie = new MovieBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        
        return this
            .withMovie(movie)
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withTitle(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withContent(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withTags(new List<String> { MBMS_Constants.MBMS_TEST_STRING_VALUE, MBMS_Constants.MBMS_TEST_STRING_VALUE })
            .withImageURL(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .build();
    }
    
    public MBMS_Movie_News__c buildWithAllFieldsAndInsert() {
        this.movieNews = this.buildWithAllFields();
        insert movieNews;
        return movieNews;
    }
    
    public MBMS_Movie_News__c build() {       
        return movieNews;
    }
    
    public MBMS_Movie_News__c buildAndInsert() {       
        insert movieNews;
        return this.build();
    }
}