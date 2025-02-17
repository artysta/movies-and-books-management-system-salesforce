public class ArtistBuilder {
    private MBMS_Artist__c artist;
    
    public ArtistBuilder create() {
        this.artist = new MBMS_Artist__c();
        return this;
    }
    
    public ArtistBuilder withName(String name) {
        this.artist.Name = name;
        return this;
    }
    
    public ArtistBuilder withFirstName(String firstName) {
        this.artist.MBMS_First_Name__c = firstName;
        return this;
    }
    
    public ArtistBuilder withLastName(String lastName) {
        this.artist.MBMS_Last_Name__c = lastName;
        return this;
    }
    
    public ArtistBuilder withBirthplace(String birthplace) {
        this.artist.MBMS_Birthplace__c = birthplace;
        return this;
    }
    
    public ArtistBuilder withDateOfBirth(Date dateOfBirth) {
        this.artist.MBMS_Date_of_Birth__c = dateOfBirth;
        return this;
    }
    
    public ArtistBuilder withDateOfDeath(Date dateOfDeath) {
        this.artist.MBMS_Date_of_Death__c = dateOfDeath;
        return this;
    }
    
    public ArtistBuilder withDescription(String description) {
        this.artist.MBMS_Description__c = description;
        return this;
    }
    
    public ArtistBuilder withRoles(List<String> roles) {
        this.artist.MBMS_Roles__c = String.join(roles, ';');
        return this;
    }

    public ArtistBuilder withStatus(String status) {
        this.artist.MBMS_Status__c = status;
        return this;
    }
    
    public ArtistBuilder withStatusComment(String statusComment) {
        this.artist.MBMS_Status_Comment__c = statusComment;
        return this;
    }
    
    public MBMS_Artist__c buildWithAllFields() {
        return this
            .withName(Constants.TEST_STRING_VALUE)
            .withFirstName(Constants.TEST_STRING_VALUE)
            .withLastName(Constants.TEST_STRING_VALUE)
            .withBirthplace(Constants.TEST_STRING_VALUE)
            .withDateOfBirth(Constants.TEST_DATE_200_DAYS_BEFORE_TODAY)
            .withDateOfDeath(Constants.TEST_DATE_10_DAYS_BEFORE_TODAY)
            .withDescription(Constants.TEST_STRING_VALUE)
            .withRoles(new List<String> { Constants.ROLE_AUTHOR, Constants.ROLE_ACTOR })
            .withStatus(Constants.STATUS_APPROVED)
            .withStatusComment(Constants.TEST_STRING_VALUE)
            .build();
    }
    
    public MBMS_Artist__c buildWithAllFieldsAndInsert() {
        this.artist = this.buildWithAllFields();
        insert artist;
        return artist;
    }
    
    public MBMS_Artist__c build() {       
        return this.artist;
    }
    
    public MBMS_Artist__c buildAndInsert() {       
        insert this.artist;
        return this.build();
    }
}