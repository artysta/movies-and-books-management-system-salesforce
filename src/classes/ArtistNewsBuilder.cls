public class ArtistNewsBuilder {   
    private MBMS_Artist_News__c artistNews;
    
    public ArtistNewsBuilder create() {
        this.artistNews = new MBMS_Artist_News__c();
        return this;
    }
    
    public ArtistNewsBuilder withName(String name) {
        this.artistNews.Name = name;
        return this;
    }
    
    public ArtistNewsBuilder withTitle(String title) {
        this.artistNews.MBMS_Title__c = title;
        return this;
    }
    
    public ArtistNewsBuilder withContent(String content) {
        this.artistNews.MBMS_Content__c = content;
        return this;
    }
    
    public ArtistNewsBuilder withTags(List<String> tags) {
        this.artistNews.MBMS_Tags__c = String.join(tags, ';');
        return this;
    }
    
    public ArtistNewsBuilder withArtist(MBMS_Artist__c artist) {
        this.artistNews.MBMS_Artist__c = artist.Id;
        return this;
    }
    
    public ArtistNewsBuilder withImageURL(String imageURL) {
        this.artistNews.MBMS_Image_URL__c = imageURL;
        return this;
    }
    
    /*
     Should not be used in the loops due to SOQL limit - it inserts related fields.
     This method is used to create a single record (with all fields) for test purposes.
     */
    public MBMS_Artist_News__c buildWithAllFields() {
        MBMS_Artist__c artist = new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        
        return this
            .withArtist(artist)
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withTitle(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withContent(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withTags(new List<String> { MBMS_Constants.MBMS_TEST_STRING_VALUE, MBMS_Constants.MBMS_TEST_STRING_VALUE })
            .withImageURL(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .build();
    }
    
    public MBMS_Artist_News__c buildWithAllFieldsAndInsert() {
        this.artistNews = this.buildWithAllFields();
        insert artistNews;
        return artistNews;
    }
    
    public MBMS_Artist_News__c build() {       
        return artistNews;
    }
    
    public MBMS_Artist_News__c buildAndInsert() {       
        insert artistNews;
        return this.build();
    }
}