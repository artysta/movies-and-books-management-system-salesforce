public class BookBuilder {   
    private MBMS_Book__c book;
    
    public BookBuilder() {
        this.book = new MBMS_Book__c();
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
    
    public MBMS_Book__c build() {       
        return book;
    }
    
    public MBMS_Book__c buildAndInsert() {       
        insert book;
        return this.build();
    }
}