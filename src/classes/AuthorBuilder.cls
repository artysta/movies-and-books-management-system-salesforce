public class AuthorBuilder {
    private MBMS_Author__c author;
    
    public AuthorBuilder() {
        this.author = new MBMS_Author__c();
    }
    
    public AuthorBuilder withName(String name) {
        this.author.Name = name;
        return this;
    }
    
    public AuthorBuilder withBirthplace(String birthplace) {
        this.author.MBMS_Birthplace__c = birthplace;
        return this;
    }
    
    public AuthorBuilder withDateOfBirth(Date dateOfBirth) {
        this.author.MBMS_Date_of_Birth__c = dateOfBirth;
        return this;
    }
    
    public AuthorBuilder withDateOfDeath(Date dateOfDeath) {
        this.author.MBMS_Date_of_Death__c = dateOfDeath;
        return this;
    }
    
    public AuthorBuilder withDescription(String description) {
        this.author.MBMS_Description__c = description;
        return this;
    }
    
    public MBMS_Author__c buildAndInsert() {       
        insert author;
        return author;
    }
}