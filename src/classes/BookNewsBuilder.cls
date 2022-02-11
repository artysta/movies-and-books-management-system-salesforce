public class BookNewsBuilder {   
    private MBMS_Book_News__c bookNews;
    
    public BookNewsBuilder create() {
        this.bookNews = new MBMS_Book_News__c();
        return this;
    }
    
    public BookNewsBuilder withName(String name) {
        this.bookNews.Name = name;
        return this;
    }
    
    public BookNewsBuilder withTitle(String title) {
        this.bookNews.MBMS_Title__c = title;
        return this;
    }
    
    public BookNewsBuilder withContent(String content) {
        this.bookNews.MBMS_Content__c = content;
        return this;
    }
    
    public BookNewsBuilder withTags(List<String> tags) {
        this.bookNews.MBMS_Tags__c = String.join(tags, ';');
        return this;
    }
    
    public BookNewsBuilder withBook(MBMS_Book__c book) {
        this.bookNews.MBMS_Book__c = book.Id;
        return this;
    }
    
    public BookNewsBuilder withImageURL(String imageURL) {
        this.bookNews.MBMS_Image_URL__c = imageURL;
        return this;
    }
    
    /*
     Should not be used in the loops due to SOQL limit - it inserts related fields.
     This method is used to create a single record (with all fields) for test purposes.
     */
    public MBMS_Book_News__c buildWithAllFields() {
        MBMS_Book__c book = new BookBuilder()
            .create()
            .buildWithAllFieldsAndInsert();
        
        return this
            .withBook(book)
            .withName(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withTitle(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withContent(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .withTags(new List<String> { MBMS_Constants.MBMS_TEST_STRING_VALUE, MBMS_Constants.MBMS_TEST_STRING_VALUE })
            .withImageURL(MBMS_Constants.MBMS_TEST_STRING_VALUE)
            .build();
    }
    
    public MBMS_Book_News__c buildWithAllFieldsAndInsert() {
        this.bookNews = this.buildWithAllFields();
        insert bookNews;
        return bookNews;
    }
    
    public MBMS_Book_News__c build() {       
        return bookNews;
    }
    
    public MBMS_Book_News__c buildAndInsert() {       
        insert bookNews;
        return this.build();
    }
}