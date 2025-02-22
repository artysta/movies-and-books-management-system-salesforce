public class BookBuilder {   
    private MBMS_Book__c book;
    
    public BookBuilder create() {
        this.book = new MBMS_Book__c();
        return this;
    }
    
    public BookBuilder withArtist(MBMS_Artist__c artist) {
        this.book.MBMS_Artist__c = artist.Id;
        return this;
    }
    
    public BookBuilder withName(String name) {
        this.book.Name = name;
        return this;
    }
    
    public BookBuilder withDescription(String description) {
        this.book.MBMS_Description__c = description;
        return this;
    }
    
    public BookBuilder withTitle(String title) {
        this.book.MBMS_Title__c = title;
        return this;
    }
    
    public BookBuilder withCoverImageURL(String coverImageURL) {
        this.book.MBMS_Cover_Image_URL__c = coverImageURL;
        return this;
    }
    
    public BookBuilder withStatus(String status) {
        this.book.MBMS_Status__c = status;
        return this;
    }
    
    public BookBuilder withStatusComment(String statusComment) {
        this.book.MBMS_Status_Comment__c = statusComment;
        return this;
    }
    
    /*
     Should not be used in the loops due to SOQL limit - it inserts related fields.
     This method is used to create a single record (with all fields) for test purposes.
     */
    public MBMS_Book__c buildWithAllFields() {
        MBMS_Artist__c artist = new ArtistBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        
        return this
            .withArtist(artist)
            .withName(Constants.TEST_STRING_VALUE)
            .withDescription(Constants.TEST_STRING_VALUE)
            .withTitle(Constants.TEST_STRING_VALUE)
            .withCoverImageURL(Constants.TEST_STRING_VALUE)
            .withStatus(Constants.STATUS_APPROVED)
            .withStatusComment(Constants.TEST_STRING_VALUE)
            .build();
    }
    
    public MBMS_Book__c buildWithAllFieldsAndInsert() {
        this.book = this.buildWithAllFields();
        insert book;
        return book;
    }
    
    public MBMS_Book__c build() {       
        return book;
    }
    
    public MBMS_Book__c buildAndInsert() {       
        insert book;
        return this.build();
    }
}