public class BookBuilder {   
    private MBMS_Book__c book;
    
    public BookBuilder() {
        this.book = new MBMS_Book__c();
    }
    
    public BookBuilder withAuthor(MBMS_Author__c author) {
        this.book.MBMS_Author__c = author.Id;
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
    
    public MBMS_Book__c buildAndInsert() {       
        insert book;
        return book;
    }
}